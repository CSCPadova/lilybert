\language "italiano"
%********************************** VARIABILI
\version "2.24.0"

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

dolce = _\markup\italic"doux"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { seul }

tu = ^\markup \italic "tous"

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


Iglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}

Idsn =  \relative do'' {

    mi4 fa
    mi la sold re
    do-+ si mi la,
    la \appoggiatura sol8 fad4 si do

    %4
    sold \appoggiatura fa8 mi4 mi' fa
    dod re re do8-+ si
    mi2 la8 (sol) fa(mi)

    %7
    re(do) si(la) do4 si-+
    la2 mi'8 fa sol do,
    si re sol, sib \tuplet 3/2 { la si do sol [la fa] }

    %10
    mi4_+ \appoggiatura re8 do4 sol'8 la sib do
    la re mi fa si,?4. do8
    re4 sol, sol'16(fa mi8) r4

    %13
    fa16(mi re8) r4 mi16(re do8) sol'16[(fa mi8)]
    la4 sol la8 si do mi,
    fa re mi do re fa sol, si

    %16
    do4 do,\mbreak mi'4 fa  %%% riprendi da qui  OOKK mi4 fa
    mi la sold re
    do-+ si mi la,

    %19
    la \appoggiatura sol8 fad4 si do
    sold \appoggiatura fa8 mi4 mi' fa
    dod re re do8-+ si

    %22
    mi2 la8 (sol) fa(mi)
    re(do) si(la) do4 si-+
    la2 mi'4 fad

    %25
    sol \appoggiatura fad8 mi4\mbreak la sol8-+ fad
    sol4 \appoggiatura fad8 mi4  la sol8-+ fad
    si4 si, mi fad

    %28
    red \appoggiatura do8 si4 si'16(la sol8) si,[si]
    si4-+ la la'16[(sol fad8)] la,8 la
    la4 sol \tuplet 3/2 { red'8(mi fad) sol[(fad mi)]}

    %31
    la(sol) fad(mi) sol(fad)  mi(red)
    mi4 mi, mi'4 fa
    mi la sold re

    %34
    do-+ si mi la,
    la \appoggiatura sol8 fad4 si do
    sold \appoggiatura fa8 mi4 mi' fa

    %37
    dod re re do8-+ si
    mi2 la8 (sol) fa(mi)
    re(do) si(la) do4 si-+

    %40
    la2

}

Ihcn = \relative do'' {

    do4 si
    do2 si4 si
    la sold la mi
    mi mi re do

    %4
    si2_+ la4 la'
    sol la la sold
    la2. la4

    %7
    la2 la4 sold
    la2 sol4 sol
    sol sol fa re_+

    %10
    do2. mi4
    fa la sol sol
    sol2 mi'16(re do8) r4

    %13
    re16(do si8) r4 do do
    do do do do
    si do la fa

    %16
    mi2 do'4 si
    do2 si4 si
    la sold la mi

    %19
    mi mi re do
    si2_+ la4 la'
    sol la la sold

    %22
    la2. la4
    la2 la4 sold
    la2 la4 do

    %25
    si4. mi8 mi4 red
    mi si8 mi mi4 red
    mi2 si4 la

    %28
    fad2 sol4 sol
    sol_+ fad fad fad
    fad_+ mi fad mi

    %31
    fad sol la fad
    sold2 do4 si
    do2 si4 si

    %34
    la sold la mi
    mi mi re do
    si2_+ la4 la'

    %37
    sol la la sold
    la2. la4
    la2 la4 sold

    %40
    la2

}

Itln =  \relative do' {

    mi4 re
    do mi mi mi
    mi mi la, la
    la la sold la8 mi

    %4
    mi4 mi sol fa
    sib la si si
    do2. do4
    si sol' mi re

    %8
    do2 mi4 mi\mbreak
    re do do si-+
    do sol do do
    do fa re mi

    %12
    si2-+ r4 do16(re mi8)
    r4 si16(do re8) r4 mi
    do mi fa sol

    %15
    fa mi re re-+
    do2 mi4 re
    do mi mi mi

    %18
    mi mi la, la
    la la sold la8 mi
    mi4 mi sol fa

    %21
    sib la si si
    do2. do4
    si sol' mi re
    do2 mi,4 la\mbreak

    %25
    sol  si do si
    si sol8 si do4 si
    si8 la sol2 do4

    %28
    si red mi2
    si4 si si si
    si2 si

    %31
    si4 si re si
    si2 mi4 re
    do mi mi mi

    %34
    mi mi la, la
    la la sold la8 mi
    mi4 mi sol fa

    %37
    sib la si si
    do2. do4
    si sol' mi re

    %40
    do2

}

Ibcn = \relative do {

    la'4 sold
    la8 si do re mi mi, sold mi
    la4 mi do dod
    re do si la

    %4
    mi' re dod re
    mi fa si, mi
    do la do re8 mi

    %7
    fa4 re mi mi,
    la2 do8 re mi fa  %% da qui
    sol4 mi fa sol

    %10
    do, do mi do
    fa re sol do,
    sol2 r4 la'16(si do8)

    %13
    r4 sol16(la si8) r4 mi,16(re do8)
    fa4 do fa mi
    re do sol sol

    %16
    do,2 la''4 sold
    la8 si do re mi mi, sold mi
    la4 mi do dod

    %19
    re do si la
    mi' re dod re
    mi fa si, mi

    %22
    do la do re8 mi
    fa4 re mi mi,
    la2 do4 la

    %25
    mi' sol\mbreak fad si
    mi, sol fad si
    sol8 fad mi fad sol4 la

    %28
    si si, sol'8 mi sol si
    red,4 red red red
    mi mi, si'' mi,

    %31
    red mi la, si
    mi,2 la'4 sold
    la8 si do re mi mi, sold mi

    %34
    la4 mi do dod
    re do si la
    mi' re dod re

    %37
    mi fa si, mi
    do la do re8 mi
    fa4 re mi mi,

    %40
    la2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4 <7>
    s2 <_+>
    s4 <_+> <6> <5/>
    <9 _+>2 <6\\\+>
    <_+> <5/>
    <6\\\+>4 <6> <7> <_+>
    \bassFigureExtendersOn <6>4 <6>4 <6> <6>8 s
    <6\\>4 <6\\> <6 4> <7 _+>
    s2   %fin qui

    \bassFigureExtendersOff s
    s4 <6> <6 5> s
    s1
    <9>4 <7> <7> s
    s2 s4 <6>
    s <7> s <6>
    s s <6 5> <6>
    <6\\>2 <6 5>
    s2

    s4 <7>
    s2 <_+>
    s4 <_+> <6> <5/>
    <9 _+>2 <6\\\+>
    <_+> <5/>
    <6\\\+>4 <6> <7> <_+>
    \bassFigureExtendersOn <6>4 <6>4 <6> <6>8 s
    <6\\>4 <6\\> <6 4> <7 _+>
    s2   %fin qui

    \bassFigureExtendersOff s4 <6\+ 5/>
    s2 <7>4 <_+>
    s2 <7>4 <_+>
    <6>2 s4 <6\+ 5>4
    <_+>1
    <5/>
    <4>4 <3> <_+> s
    <5/> s <6\+ 5> <_+>
    <_+>2

    s4 <7>
    s2 <_+>
    s4 <_+> <6> <5/>
    <9 _+>2 <6\\\+>
    <_+> <5/>
    <6\\\+>4 <6> <7> <_+>
    \bassFigureExtendersOn <6>4 <6>4 <6> <6>8 s
    <6\\>4 <6\\> <6 4> <7 _+>
    s2   %fin qui

}

forma = {

    \key la\minor
    \time 2/2
    \tempo 2 = 67
    \partial 2 s2
    s1*7
    s2
    \bar":|."
    s
    s1*7
    s2
    \bar "||"
    s2
    s1*7
    s2
    \bar "||"
    s2
    s1*7
    s2
    \bar "||"
    s
    s1*7
    \once \override Score.RehearsalMark.extra-offset = #'(+3 . +1) \mark\markup "Fin"
    s2
    \bar "|."

}

Ids = {
    \Iglobal
    <<\Idsn \forma>>

}

Ihc = {
    \Iglobal
    <<\Ihcn \forma>>

}

Itl = {
    \Iglobal
    \clef alto
    <<\Itln \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>

}



IIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IIdsn =  \relative do'' {

    sol'16 fad mi8 si' si,
    mi4 do
    si16 la sol8 fad16 sol la8

    %4
    sol4_+ fad
    sol16 la si8 la16 si do8
    si sol'16 fad mi8 sol\mbreak

    %7
    la16 sol fad8 la16 sol fad8
    red16 do si8 si4
    si'8[la sol fad]

    %10
    mi[re do si]
    la[sol fad mi]
    \appoggiatura sol fad \appoggiatura mi red mi16 sol fad la

    %13
    sol16 mi' si sol la8 fad_+
    sol16 mi' si sol la8 fad_+
    sol16 mi' si sol la8 fad_+

    %16
    mi2\mbreak
    mi'16 fad sol la si8 si,  %% fin qui
    do4 si
    si16 dod red mi fad8 la,

    %20
    sol8._+ fad16 mi4
    sol16 la si do re8 sol16 sol,
    la4_+ sol

    %23
    mi'16 re do si la8 sol
    fad8._+ mi16 re4\mbreak
    re'16 do re mi re sol si re,

    %26
    re do si la do4
    do16 si do re do fad la do,
    do si la sol si4

    %29
    re16 sol fad mi re si ' la sol
    la do, si la si fa' mi re
    mi8 sol,16 si la8 fad_+

    %32
    sol4 sol,\mbreak
    sol''16 fad mi8 si' si,
    mi4 do
    si16 la sol8 fad16 sol la8

    %36
    sol4_+ fad
    sol16 la si8 la16 si do8
    si sol'16 fad mi8 sol\mbreak

    %39
    la16 sol fad8 la16 sol fad8
    red16 do si8 si4
    si'8[la sol fad]

    %42
    mi[re do si]
    la[sol fad mi]
    \appoggiatura sol fad \appoggiatura mi red mi16 sol fad la

    %45
    sol16 mi' si sol la8 fad_+
    sol16 mi' si sol la8 fad_+
    sol16 mi' si sol la8 fad_+

    %48
    mi2
    si'8 mi16 re do si la sold
    la si la8 la4
    la8 re16 do si la sol fad

    %52
    sol la sol8 sol4
    re'8[red mi fad]
    sol mi sol4

    %55
    fad16 mi re8 dod si
    lad4 fad\mbreak
    fad'8 si16 fad fad8 fad

    %58
    fad si16 fad mi8 mi
    mi[re dod si]
    dod lad si16 re dod mi

    %61
    re si' fad re mi8 dod
    re16 si' fad re mi8 dod
    re16 si' fad re mi8 dod-+

    %64
    si4 si,
    sol''16 fad mi8 si' si,
    mi4 do
    si16 la sol8 fad16 sol la8

    %68
    sol4_+ fad
    sol16 la si8 la16 si do8
    si sol'16 fad mi8 sol\mbreak

    %71
    la16 sol fad8 la16 sol fad8
    red16 do si8 si4
    si'8[la sol fad]

    %74
    mi[re do si]
    la[sol fad mi]
    \appoggiatura sol fad \appoggiatura mi red mi16 sol fad la

    %77
    sol16 mi' si sol la8 fad_+
    sol16 mi' si sol la8 fad_+
    sol16 mi' si sol la8 fad_+

    %80
    mi2

}

IIhcn = \relative do'' {

    R2*2
    mi,4 red
    mi red

    %5
    mi do'16 si la8
    sol mi16 fad sol8 mi
    fad16 sol la8 fad16 sol la8

    %8
    fad16 mi red8 red4
    sol sol
    sol r8 sol\mbreak

    %11
    do,[mi fad sol]
    red fad si,4
    si'8[sol fad red]

    %14
    mi[sol fad red]
    mi[sol fad red]
    mi2 %fin qui

    %17
    r4 r8 sol
    fad8 la sol4
    fad4. red8

    %20
    mi4 mi\mbreak
    mi re
    mi re

    %23
    do mi
    re re
    sol sol

    %26
    mi mi
    re re
    re re

    %29
    si' si
    re si8 sol\mbreak
    sol4 mi8 re
    re2

    %33
    R2*2
    mi4 red
    mi red

    %37
    mi do'16 si la8
    sol mi16 fad sol8 mi
    fad16 sol la8 fad16 sol la8

    %40
    fad16 mi red8 red4
    sol sol
    sol r8 sol\mbreak

    %43
    do,[mi fad sol]
    red fad si,4
    si'8[sol fad red]

    %46
    mi[sol fad red]
    mi[sol fad red]
    mi2 %fin qui

    %49
    sol8[si mi, re]
    do4 do
    re re

    %52
    re re
    re8[fad mi red]
    mi4 mi

    %55
    re8 fad sol4
    fad lad\mbreak
    si si

    %58
    si si
    lad8[fad fad fad]
    fad4 fad

    %61
    fad sol8 fad
    fad4 sol8 fad
    fad4 sol8 fad

    %64
    red2

    R2*2
    mi4 red

    %68
    mi red
    mi do'16 si la8
    sol mi16 fad sol8 mi

    %71
    fad16 sol la8 fad16 sol la8
    fad16 mi red8 red4
    sol sol

    %64
    sol r8 sol\mbreak
    do,[mi fad sol]
    red fad si,4

    %77
    si'8[sol fad red]
    mi[sol fad red]
    mi[sol fad red]

    %80
    mi2 %fin qui

}

IItln =  \relative do' {

    R2*2
    si4 si
    si si

    %5
    si8 sol' red4
    mi mi
    do do

    %8
    si4. si8
    mi4 mi8 si
    do4 r8 mi\mbreak

    %11
    fad8[si, si si]
    si4. si8
    si4 do8 si

    %14
    si4 do8 si
    si4 do8 si
    si2 % fin qui

    %17
    r4 r8 mi
    red4 mi
    si si

    %20
    si si\mbreak
    si8[sol sol' si,]
    do4 re8 si

    %23
    sol4 la
    la la
    si4. si8

    %26
    la4 la
    la la8 fad
    sol4 sol

    %29
    sol' sol
    re re\mbreak
    do do8 la

    %32
    si2

    R2*2
    si4 si

    %36
    si si
    si8 sol' red4
    mi mi

    %39
    do do
    si4. si8
    mi4 mi8 si

    %42
    do4 r8 mi\mbreak
    fad8[si, si si]
    si4. si8

    %45
    si4 do8 si
    si4 do8 si
    si4 do8 si

    %48
    si2 % fin qui

    mi4 r8 mi
    mi4 mi

    %51
    la,8 [fad' sol do,]
    si4 si
    la8[si si si]

    %54
    si4 lad
    si dod
    dod dod\mbreak

    %57
    re4 re
    re dod
    dod8[si mi re]

    %60
    dod4 re8 fad,
    fad[re' dod lad]
    si[re dod lad]

    %63
    si[re dod lad]
    si2

    R2*2

    %67
    si4 si
    si si
    si8 sol' red4

    %70
    mi mi
    do do
    si4. si8

    %73
    mi4 mi8 si
    do4 r8 mi\mbreak
    fad8[si, si si]

    %76
    si4. si8
    si4 do8 si
    si4 do8 si

    %79
    si4 do8 si
    si2 % fin qui

}

IIbcn = \relative do {

    R2*2
    sol'16 fad mi8 si' si,
    mi4 si

    %5
    mi8 mi fad fad
    sol sol,4 sol'8\mbreak
    fad fad,4 fad'8

    %8
    si si,4 si'16 la
    sol8[la si sol]
    do[si la sol]

    %11
    fad[mi red mi]
    si'[la sol red]
    mi[mi la, si]

    %14
    sol[mi' la, si]
    sol[mi' la, si]\mbreak
    mi,2 %% Fin qui

    %17
    r4 r8 mi'
    la[fad sol mi]
    red[si red si]

    %20
    mi[fad sol mi]
    mi,[mi' si sol]
    do[do' si sol]

    %23
    do,4 dod
    re8[mi fad re]\mbreak
    si[sol' si, sol]

    %26
    la4. la'16 sol
    fad8[re' fad, re]
    sol4 sol,

    %29
    sol'8[sol sol sol]
    fad[re' sol, si,]
    do mi16 re do8 re

    %32
    sol,2
    R2*2
    sol'16 fad mi8 si' si,

    %36
    mi4 si
    mi8 mi fad fad
    sol sol,4 sol'8\mbreak

    %39
    fad fad,4 fad'8
    si si,4 si'16 la
    sol8[la si sol]

    %42
    do[si la sol]
    fad[mi red mi]
    si'[la sol red]

    %45
    mi[mi la, si]
    sol[mi' la, si]
    sol[mi' la, si]\mbreak

    %48
    mi,2 %% Fin qui
    mi'8[sold la, si]
    do do'16 si do8 la

    %51
    fad[re sol, la]
    si si'16 do si8 sol
    fad si16 la sol8 fad

    %54
    mi[sol do, do]
    re[re mi mi]
    fad[sol fad mi]\mbreak

    %57
    re4. re8
    sol4. dod,8
    fad[si lad si]

    %60
    fad[mi re lad]
    si[si' mi, fad]
    re[si' mi, fad]

    %63
    re[si' mi, fad]
    si,2
    R2*2

    %67
    sol'16 fad mi8 si' si,
    mi4 si
    mi8 mi fad fad

    %70
    sol sol,4 sol'8\mbreak
    fad fad,4 fad'8
    si si,4 si'16 la

    %73
    sol8[la si sol]
    do[si la sol]
    fad[mi red mi]

    %76
    si'[la sol red]
    mi[mi la, si]
    sol[mi' la, si]

    %79
    sol[mi' la, si]\mbreak
    mi,2 %% Fin qui

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    s
    <6>4 <4>8 <7 _+>
    s4 <_+>
    s <6\+ 5/>
    <6>2
    <7>
    <_+>
    \bassFigureExtendersOn <6>4 <6>\bassFigureExtendersOff
    <7>2
    <7>4 <5/>
    <_+> <6>8 <5/>
    s4 <6 5>8 <_+>
    <6>4 <6 5>8 <6 _+>
    <6>4 <6 5>8 <_+>
    s2  %% Fin qui

    s
    <6 5>8 <6\+ 5/> <6> s
    <5/>2
    s
    s4 <6>
    <6 5> <6>
    <7> <5/>
    s2
    <6>
    <4>4 <3>
    <5/>2
    <4>4 <3>
    s2
    <5/>
    <7>4 <6 5>
    s2

    s2
    s
    <6>4 <4>8 <7 _+>
    s4 <_+>
    s <6\+ 5/>
    <6>2
    <7>
    <_+>
    \bassFigureExtendersOn <6>4 <6>\bassFigureExtendersOff
    <7>2
    <7>4 <5/>
    <_+> <6>8 <5/>
    s4 <6 5>8 <_+>
    <6>4 <6 5>8 <6 _+>
    <6>4 <6 5>8 <_+>
    s2  %% Fin qui

    <_+>4 s8 <6\\\+>
    <6>2
    <5/>4 s8 <6\\>
    <6>2
    <6>8 <_+> <6> <6\+>
    s4 <6\+ 5/>
    <6> <6\+ 5/>
    <_+>2
    <6>
    <7>4 <6\\>
    <7 _+> <5/>
    <_+> <6>8 <5/>
    s4 <6\+ 5>8 <_+>
    <6>4 <6\+ 5>8 <_+>
    <6>4 <6\+ 5>8 <_+>
    <_+>2

    s2
    s
    <6>4 <4>8 <7 _+>
    s4 <_+>
    s <6\+ 5/>
    <6>2
    <7>
    <_+>
    \bassFigureExtendersOn <6>4 <6>\bassFigureExtendersOff
    <7>2
    <7>4 <5/>
    <_+> <6>8 <5/>
    s4 <6 5>8 <_+>
    <6>4 <6 5>8 <6 _+>
    <6>4 <6 5>8 <_+>
    s2  %% Fin qui

}

forma = {

    \key sol\major
    \time 2/4
    \tempo 2 = 60
    s2*16
    \bar":|."
    s2*16
    \bar "||"
    s2*16
    \bar "||"
    s2*16
    \bar "||"
    s2*15
    \once \override Score.RehearsalMark.extra-offset = #'(+3 . +1) \mark\markup "Fin"
    s2\fermata
    \bar "|."

}

IIds = {
    \IIglobal
    <<\IIdsn \forma>>

}

IIhc = {
    \IIglobal
    <<\IIhcn \forma>>

}

IItl = {
    \IIglobal
    \clef alto
    <<\IItln \forma>>

}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn \forma \IIbfn>>

}



IIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IIIdsn =  \relative do'' {

    mi8 fad sold si, dod la
    la4_+ sold2
    dod4 red mi

    %4
    red4.-+ dod8 si4
    si'8 la sold si mi, si'
    red, si' si, si' fad si

    %7
    \tuplet 3/2 { sold(fad mi) } la4 sold
    fad2.-+ fad
    sold8 la si mi, sold si,

    %10
    dod la sold la fad4
    la'8 sold la fad la dod,
    red si la si sold4

    %13
    mi'8 sold fad mi red dod
    si mi red dod si la
    \tuplet 3/2 { sold(fad mi) } sold4 fad_+

    %16
    mi2.

}

IIIhcn = \relative do'' {

    sold4. sold8 la dod,
    dod4_+ si2
    fad4 la' sold

    %4
    fad2 red4
    mi mi mi
    fad fad red

    %7
    \tuplet 3/2 { mi8(fad sold) } fad4 mi
    red2._+ red
    mi4 mi mi

    %10
    r8 la sold la fad4
    dod' dod dod
    r8 si la si sold4

    %13
    sold dod, fad
    si,4. dod8 red4
    si2 si4

    %16
    si2.

}

IIItln =  \relative do' {

    mi2 mi4
    mi2 mi4
    mi fad si,

    %4
    si2 si4
    si2 si4
    si2 si4

    %7
    si si si
    si2. si
    si4 si si

    %10
    r8 la' sold la fad4
    fad fad fad
    r8 si la si sold4

    %13
    mi4. mi8 la fad
    sold4 fad2
    mi4 mi red

    %16
    mi2.

}

IIIbcn = \relative do {

    mi2 la4
    mi8 red mi fad sold mi
    la sold fad4 mi

    %4
    si si' la
    sold mi sold
    si red, si

    %7
    mi red mi
    si red si si2.
    mi4 mi mi

    %10
    r8 la sold la fad4
    fad fad fad
    r8 si la si sold4

    %13
    dod8 si la sold fad la
    sold mi si'4 si,
    mi si' si,

    %16
    mi2.

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <4>4 <3> s
    <9> <6\\> s
    s2.
    <6>
    s
    s4 <5/> s
    s2.*6
    s4 <6\\>2
    <6>2.
    s4 <6 4> <7>

}

forma = {

    \key mi\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 67
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}\set Score.currentBarNumber = #9
    \bar ".|:"
    s2.*8
    \bar ":|."

}

IIIds = {
    \IIIglobal
    <<\IIIdsn \forma>>

}

IIIhc = {
    \IIIglobal
    <<\IIIhcn \forma>>

}

IIItl = {
    \IIIglobal
    \clef alto
    <<\IIItln \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

}



IVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

IVdsn =  \relative do'' {

    mi8 fad sol mi mi mi
    mi, fad sol mi si' mi,
    do' si la sol fad mi

    %4
    red' mi fad2
    sol8 fad mi re dod si
    mi re dod si dod lad

    %7
    si dod re4 dod-+
    si2. si
    re8 do si la sol4

    %10
    \tuplet 3/2 { sol8 la fad } sol2
    mi'8 re do si la4
    \tuplet 3/2 { la8 si sold } la2

    %13
    la'8 sol fad mi red dod
    red si dod red mi si
    do? fad, sol mi fad red

    %16
    mi2.

}

IVhcn = \relative do'' {

    si2 r4
    sol si, si
    la2 do4

    %4
    si si'2
    si4 si si
    si-+lad4. dod8

    %7
    re dod si4 lad
    si2. si
    si2 si4

    %10
    mi,8 re re2
    do' do4
    fa,8 mi mi2

    %13
    fad fad4
    fad2 sol4
    fad mi si

    %16
    si2.

}

IVtln =  \relative do' {

    sol'2 r4
    mi mi mi
    mi fad8 sol la sol

    %4
    fad2 red4
    mi mi mi
    mi fad fad

    %7
    fad2 fad4
    red2. red
    sol2 re4

    %10
    do si2
    la' mi4
    re do2

    %13
    do do4
    si2 si4
    la8 do si4 la

    %16
    si2.

}

IVbcn = \relative do {

    mi2 r4
    mi mi sol
    la, do la

    %4
    si red si
    mi4. fad8 sol4
    dod, fad mi

    %7
    re8 mi fad4 fad,
    si si'8 la sol fad si,2.
    sol'4 sol si,

    %10
    do8 re sol,2
    la'4 la do,
    re8 mi la,2

    %13
    fad'8 sol la4 fad
    si la sol
    la si si,

    %16
    mi2.
    _\markup\italic "au premier"

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*2
    <6 5>2.
    <_+>
    s
    <7>4 <_+> s
    <6> <6 4> <7 _+>
    <_+>2.
    s
    s
    <6 5>
    s
    <6 5 _->8 <_+> s2
    s2.
    <_+>2 <6>4
    <6 5> <6 4> <7 _+>

}

forma = {

    \key mi\minor
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 67
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}\set Score.currentBarNumber = #9
    \bar ".|:"
    s2.*8
    \bar ":|."

}

IVds = {
    \IVglobal
    <<\IVdsn \forma>>

}

IVhc = {
    \IVglobal
    <<\IVhcn \forma>>

}

IVtl = {
    \IVglobal
    \clef alto
    <<\IVtln \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma \IVbfn>>

}



Vglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Vdsn =  \relative do'' {

    mi,8 fad4
    sol4. fad8 mi4 si'4. mi8 red4
    mi2. fad4.-+ mi8 fad4
    sol4. fad8 mi4 re?2 do4

    %4
    si4.-+ la8 sol4 si4. do8 si4
    la fad'2 la,4. si8 la4
    sol mi'2 sol,4. la8 sol4\mbreak

    %7
    fad si la sol fad mi
    red'2. mi
    fad4. sol8 fad4 si,2 dod4

    %10
    lad2 fad4 fad'8 mi re dod si4
    sol2. mi'8 re dod si lad4
    fad2. fad'8 mi re dod si4

    %13
    mi4. fad8 re4 dod4.-+ si8 lad4\mbreak
    si si' si, si dod2-+
    re4. mi8 fad4 sol re dod

    %16
    si2. ~si4. si8 do!4
    re2 re4 re2 sol,4
    fad4._+ mi8 re4 la'2 si4

    %19
    do2 do4 do4. si8 la4\mbreak
    si2 sol4 sol'8 la si4 re,
    mi do si la'8 si do4 mi,

    %22
    fad re do si'8 do re4 fad,
    sol do si la4.-+ sol8 fad4
    sol2 sol,4 sol si re

    %25
    sol4. fad8 mi4 si mi re
    re-+ dod la la dod mi\mbreak
    la4. sol8 fad4 dod fad mi

    %28
    mi-+ red si mi4. fad8 sol4
    la,2 la4 red4. mi8 fad4
    sol,2 sol4 do4. si8 la4

    %31
    si4. mi8 sol,4 fad mi' red
    mi, mi' mi, mi fad2_+
    sol4. la8 si4 do sol fad_+

    %34
    mi2.~mi4.

}

Vhcn = \relative do'' {

    r8 r4
    r1 r8 si do4
    si2 mi4 red4. si8 si4
    si2. la2 la4

    %4
    sol2 sol4 sol2 sol4
    fad2 fad4 fad2 red4
    mi2 mi4 mi4. red8 mi4

    %7
    si4. dod8 red4 mi si la\mbreak
    si4 fad' fad sol2.
    la sol

    %10
    fad2 dod4 re2.
    dod dod4. re8 mi4
    re2. re4.  mi8 fad4

    %13
    sol fad fad sol fad2
    re sol4 fad sol fad\mbreak
    fad2 fad4 mi mi2

    %16
    red2.~red4. r8 r4 %OOKK
    r1 r8 sol mi4
    re4. mi8 fad4 fad2 sol4

    %19
    la4. sol8 fad4 fad4. sol8 la4
    sol2 sol4 re2 r4\mbreak
    r do' si la2 r4

    %22
    r re do si2 la4
    do8 si la4 si do4. re8 do4
    si2. sol

    %25
    sol sol2 sol4
    mi2. la
    la la2 la4\mbreak

    %28
    fad2 fad4 sol2.
    fad fad4. mi8 red4
    mi2 mi4 mi2 red4

    %31
    mi2 mi4 do2 si4
    sol2 mi'4 mi mi red
    mi2 mi4 mi mi red

    %34
    mi2. ~mi4.

}

Vtln =  \relative do' {

    r8 r4
    r1 r8 sol' fad4
    mi4. fad8 sol4 fad4. sol8 la4
    sol2. fad2 fad4
    re4. do8 si4 re2 re4
    re2 re4 si2 si4
    si2 si4 si4. si8 si4
    la fad fad sol sol do\mbreak
    fad, si si si2.
    si si4 mi2
    dod4.-+ si8 lad4 si2.
    si lad4. si8 dod4
    si2. si4. lad8 si4
    lad dod re mi4. re8 dod4-+
    si2 re4 si si lad\mbreak
    si2 si4 si si lad
    si2.~si4. r8 r4
    r1 r8 re do4
    do2 do4 do2 si4
    la2 re4 re2 re4
    re2 re4 si2 r4\mbreak
    r do si la2 r4
    r re do si4. re8 fad4
    mi la sol mi re2
    re2. si
    si si
    la dod
    dod dod\mbreak
    si si
    do! si
    si la2 do4
    si2 si4 la4. sol8 fad4
    mi2 do'4 si do si
    si2 si4 la la2
    sol2.~sol4.

}

Vbcn = \relative do {

    r8 r4
    r1 r8 mi fad4
    sol4. fad8 mi4 si'4.-+ mi8 red4
    mi2. fad

    %4
    sol,2 sol4 sol2 sol,4
    re'2 red4 red2 si4
    mi2 mi4 mi4. fad8 mi4\mbreak

    %7
    red2 si4 mi re do
    si si' la sol fad mi
    red2. mi

    %10
    fad8 sol fad4 mi re2.
    mi8 fad sol fad mi4 dod2.
    re8 mi fad mi re4 si4. dod8 re4

    %13
    dod lad si mi fad fad,\mbreak
    sol2 sol'4 re mi fad
    si,4. dod8 re4 mi fad fad,

    %16
    si red fad si,4. r8 r4
    r1 r8 si' do4
    re2 re4 re2 sol,4

    %19
    fad4. mi8 re4 re4. mi8 fad4\mbreak
    sol2 sol,4 si'2 r4
    r do si la2 r4

    %22
    r re do si4. do8 re4
    mi fad sol do, re re,
    sol2. sol2 fad4

    %25
    mi2 fad4 sol2 mi4
    la2. la2 sol4\mbreak
    fad2 sol4 la2 fad4

    %28
    si2 la4 sol4. fad8 mi4
    fad4. sol8 la4 si,2 si4
    mi4. fad8 sol4 la,2 fad'4

    %31
    sol,2 mi'4 la,2 si4
    do2 do'4 sol la si
    mi,4. fad8 sol4 la si si,

    %34
    mi sol, si mi,4.

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4.
    s2. s2 <6\+>4
    <6>2. s2 <5/>4
    s2 <6>4 <5/>2.
    s1.
    s2 <5/>4 s2.
    s1.
    <5/>2. s4 <6> <6\\>
    <_+>2. <6>
    <5/> s2 <6\+ 5>4
    <_+>2. <6>
    <6\+ 5> <6\\\+>
    <6>1.
    <7>4 <5/> s <6\+ 5> <4> <_+>
    s2. <6>4 <6\+ 5> <_+>
    s2. <6\+ 5>4 <6 4> <_+>8 s
    \bassFigureExtendersOn <_+>2. <_+>\bassFigureExtendersOff
    s1 s8 <6> <6 5>4
    s1.
    \bassFigureExtendersOn <5/>2. <5/>\bassFigureExtendersOff
    s <6>
    s s
    s s
    <7>4 <5/> s <6 5> <4> <7>
    s1.
    s
    <4>4 <_+> s s2.
    s2. <_+>
    <4>4 <_+> s <6>2.
    <7> <7 _+>
    s
    <6 5>2 <6\+>4
    <6>2. <6 5>2 <_+>4
    s2.  <6>4 <6 5> <_+>
    s2. <6 5>4 <6 4> <7 _+>
    \bassFigureExtendersOn <_>2. <_>4.

}

forma = {

    \key mi\minor
    \time 6/4
    \tempo 2. = 60
    \partial 4. s4.
    s1.*15
    s1 s8
    \bar ":..:"%\break
    s4.
    s1.*17
    s1 s8
    \bar ":|."

}

Vds = {
    \Vglobal
    <<\Vdsn \forma>>

}

Vhc = {
    \Vglobal
    <<\Vhcn \forma>>

}

Vtl = {
    \Vglobal
    \clef alto
    <<\Vtln \forma>>

}

Vbc = {
    \Vglobal
    \clef bass
    <<\Vbcn \forma \Vbfn>>

}



VIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIdsn =  \relative do'' {

    mi2 mi
    mi4 sold8 fad mi red dod si
    la4 sold fad si

    %4
    sold mi sold la
    si mi8 red dod4 fad
    red-+ si fad' fad

    %7
    fad2 si
    fad4 mi8 red dod4 si
    dod2 lad

    %10
    si8 si' lad sold fad mi red dod
    si4 red8 dod si4 si
    si1-+

    %13
    fad'2 fad
    fad8 mi red dod si4 la
    la2_+ sold

    %16
    sold' sold
    sold8 fad mi red dod4 dod
    dod2-+ sid4 sold'

    %19
    la-+ sold mi-+red
    fad-+ mi sold8 dod, sold' dod,
    la' sold fad mi  red4 sold8 fad

    %22
    mi4.-+ red8 dod2
    mi mi\mbreak
    mi4 dod8 si la sold fad mi

    %25
    fad'2 fad
    fad4 red8 dod si la sold fad
    sold'4 fad mi red

    %28
    dod fad red si
    mi sold,8 fad mi4 dod'
    si la sold fad

    %31
    sold2 fad
    mi8 mi' red dod si la sold fad
    mi4 sold8 fad mi4 mi

    %34
    mi1-+

}

VIhcn = \relative do'' {

    si2 si
    si4 sold sold sold
    la red, red red

    %4
    red2 red4 dod
    si red dod mi
    red2 mi

    %7
    red red
    red dod4 red
    sold2 mi_+

    %10
    fad fad
    fad2. fad4\mbreak
    fad1

    %13
    red'2 mi
    red8 dod si4 fad fad
    mi2 mi

    %16
    mi fad
    mi4 sold mi la
    sold2 sold4 dod

    %19
    sid dod dod sid
    red4 dod8 sid dod4 dod
    dod2 sid

    %22
    dod2. dod4
    si2 si\mbreak
    dod2. dod4

    %25
    mi2 mi
    red red
    si si

    %28
    la4 dod si2
    si2. mi,4
    sold red mi mi

    %31
    mi2 red_+
    mi mi
    si2. si4

    %34
    si1

}

VItln =  \relative do' {

    sold'2 sold
    sold4 mi mi mi
    fad4 si, si si

    %4
    si2 si4 la
    sold si la dod
    si2 dod

    %7
    si si
    si lad4 si
    mi2 dod-+

    %10
    red red
    red2. red4\mbreak
    red1

    %13
    si'2 dod
    si4 fad fad red
    si2 si

    %16
    dod red
    dod4 sid dod fad
    red2-+ red4 mi

    %19
    red mi dod red
    sid dod8 red mi4 mi
    dod la' sold sold

    %22
    sold2. sold4
    sold2 sold\mbreak
    la2. la4

    %25
    dod2. lad4
    si2 si
    si4 la sold fad

    %28
    mi la fad2
    sold2. dod,8 red
    mi4 fad si, dod

    %31
    si2 si
    sold sold
    sold2. sold4

    %34
    sold1

}

VIbcn = \relative do {

    mi4 si sold mi
    mi'2 sold
    fad4 mi si' si,

    %4
    mi mi, mi' fad
    sold mi la fad
    si2 lad

    %7
    si sold
    red4 mi fad sold
    mi dod fad fad,

    %10
    si2 si
    si2. si4
    si1\mbreak

    %13
    si'2 lad
    si4 si,8 dod red4 si
    mi si mi,2

    %16
    dod'' sid
    dod4 sold la fad
    sold red sold, mi'

    %19
    fad mi sold fad
    la sold8 fad mi4 dod
    fad red sold sold,

    %22
    dod2. dod'4
    sold si sold mi\mbreak
    la2. la4

    %25
    lad dod lad fad
    si si,8 dod red4 si
    mi fad sold mi

    %28
    la fad si la
    sold2. la4
    sold fad mi la

    %31
    si2 si,
    mi mi
    mi2. mi4

    %34
    mi1

}

VIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    <_>4 <_>4 <_> s
    <_>4 <_> <_>4 s\bassFigureExtendersOff
    s4 <5/> <4> <7>
    s1
    <6>2 <6 5>
    s <5/>
    s s
    <6>4 <6 5> <_+> s
    <6 5>2 <_+>
    s1*3
    s2 <5/>
    s <5/>
    <4> <5>
    s <5/>
    s <6\\>
    <4>4  s <_+> <6>
    <6 5> <6>  <6 4> <4\+>
    <6 2\+> <6 4> <6> s
    <6 5>2 <4>4 <7 _+>
    s1
    \bassFigureExtendersOn <6>2 <6>4 s\bassFigureExtendersOff
    s1
    <5/>
    s
    s
    <6>
    <6>
    <6>2 s4 <6 5>
    <6 4>2 <7>

}

forma = {

    \key mi\major
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 60
    s1*12
    \bar ":..:"
    s1*22
    \bar ":|."

}

VIds = {
    \VIglobal
    <<\VIdsn \forma>>

}

VIhc = {
    \VIglobal
    <<\VIhcn \forma>>

}

VItl = {
    \VIglobal
    \clef alto
    <<\VItln \forma>>

}

VIbc = {
    \VIglobal
    \clef bass
    <<\VIbcn \forma \VIbfn>>

}



VIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIdsn =  \relative do'' {

    sol8 fad sol la
    sol4 mi si' si
    si2 mi
    si4 la sol fad

    %4
    sol mi sol8 fad sol la
    sol4 mi si' si
    si2 mi

    %7
    si4 la sol fad
    mi2 \mbreak sol8 la si do %% fin qui
    re4 sol fad mi

    %10
    re4 si8 sol la2_+
    sol4 si8 sol la2_+
    sol sol'8 la sol4

    %13
    la,8 sol fad4 fad'8 sol fad4
    sol,8 fad mi4 mi'8 fad mi4
    dod red mi fad

    %16
    si,2 mi8 red mi fad
    sol4 mi si' si,
    mi2 fad

    %19
    sol4 fad mi re
    dod re8 mi fad4 fad,
    si8 dod re mi fad4 fad,

    %22
    sol mi' re dod
    re sol dod,8 si dod re
    si2

}

VIIhcn = \relative do'' {

    r2
    r sol4 sol
    sol2 sol
    sol4 fad mi red

    %4
    mi si r2
    r sol'4 sol
    sol2 sol

    %7
    sol4 fad mi red
    mi2 re4 re\mbreak
    re re re re

    %10
    sol2 re
    sol sol4 fad
    sol2 r

    %13
    la8 sol fad4 r2
    sol8 fad mi4 r mi
    mi fad si, red

    %16
    mi2\mbreak r
    r sol8 fad sol la
    sol2 red

    %19
    mi2. sol4
    fad8 mi re dod si4 si
    si2 si

    %22
    dod4 sol' fad fad
    fad si si lad
    si2

}

VIItln =  \relative do' {

    r2
    r mi4 mi
    mi2 mi
    mi4 do si si

    %4
    si sol r2
    r mi'4 mi
    mi2 mi

    %7
    mi4 do si si
    si2 si4 si\mbreak
    la la la la

    %10
    si2 do
    si mi4 re8 do
    si2 r

    %13
    la'8 sol fad4 r2
    sol8 fad mi4 r si
    la la' sol fad

    %16
    sol2\mbreak r
    r2 si,4 si
    si2. si'4

    %19
    si re do si
    lad2 fad
    re re

    %22
    dod si4 lad
    si2 fad'4 mi
    red2

}

VIIbcn = \relative do {

    r2
    r sol'8 fad sol la
    sol4 mi do' si8 la
    sol4 la si si,

    %4
    mi mi, r2
    r sol'8 fad sol la
    sol4 mi do' si8 la

    %7
    sol4 la si si,
    mi2\mbreak sol4 sol
    fad mi re do

    %10
    si sol' fad re
    mi si do re
    sol,2 r

    %13
    la'8 sol fad4 r2
    sol8 fad mi4 r mi
    la fad sol la

    %16
    sol mi\mbreak r2
    r mi8 red mi fad
    sol4 mi si' si,

    %19
    mi fad sol mi
    fad2 re
    sol re

    %22
    mi fad
    si4 mi, fad fad,
    si2

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1
    <6>2
    <6>1
    <6>4 <6 5> <6 4> <7 _+>
    s1
    s2 <6>
    <6>1
    <6>4 <6 5> <6 4> <7 _+>
    \bassFigureExtendersOn s1<6>2 <6>8 s s4\bassFigureExtendersOff
    <6>2 <6>
    s <6 5>
    s1
    <6 5> <6>
    <_+>4 <6\\> <6> <4\+>
    <6>1
    s
    <6>2 <4>4 <7 _+>
    s2 <6>
    <_+> <6>
    s <6>
    <6\+ 5> <6 4>4 <7 _+>
    s <6\+ 5> <4> <7 _+>
    <_+>2

}

forma = {

    \key mi\minor
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 65
    \partial 2 s2\once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\segno
    s1*7
    \once \override Score.RehearsalMark.extra-offset = #'(+3 . 0)
    \mark\markup "Fin"
    s2
    \bar ":|."\break
    s
    s1*7
    s2
    \bar"||"
    s
    s1*7
    s2
    \bar"||"
    \mark\markup\segno

}

VIIds = {
    \VIIglobal
    <<\VIIdsn \forma>>

}

VIIhc = {
    \VIIglobal
    <<\VIIhcn \forma>>

}

VIItl = {
    \VIIglobal
    \clef alto
    <<\VIItln \forma>>

}

VIIbc = {
    \VIIglobal
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}



VIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

VIIIdsn =  \relative do'' {

    si8 si si re16 dod si8 fad
    re si re fad si,[si']
    dod16(si dod mi) dod16(si dod mi) dod16(si dod mi)

    %4
    re dod re fad re dod re fad re dod re fad
    mi re mi sol mi re mi sol mi re mi sol
    fad2\mbreak r16 re mi fad

    %7
    sol la sol fad mi fad mi re dod re dod si
    lad2 r16 fad' sold lad
    si lad si fad si fad mi fad si la sol fad

    %10
    sol fad sol si sol fad sol si sol fad sol si
    sol fad sol la sol fad sol la sol fad sol la\mbreak
    fad mi fad la fad mi fad la fad re mi fad

    %13
    sol fad sol re sol re dod re sol fad mi re
    mi re mi sol mi re mi sol mi re mi sol
    mi re mi fad  mi re mi fad  mi re mi fad

    %16
    re dod re fad re dod re fad mi sol fad mi\mbreak
    fad8 mi16 re dod2-+
    si8 si si re16 dod si8 fad

    %19
    re si re fad si,4

}

VIIIhcn = \relative do'' {

    si8 si si re16 dod si8 fad
    re si re fad si, fad'
    sol4 fad fad

    %4
    fad si si
    si lad lad
    si si  si

    %7
    si sol sol
    fad fad fad
    fad fad fad

    %10
    mi mi mi
    mi mi mi
    re re re

    %13
    re re re
    dod dod dod
    dod dod dod

    %16
    si si' lad
    si lad2_+
    si8 si si re16 dod si8 fad

    %19
    re si re fad si,4

}

VIIItln =  \relative do' {

    si'8 si si re16 dod si8 fad
    re si re fad si, re
    mi4 mi mi

    %4
    re fad fad
    sol sol dod,
    fad fad re

    %7
    re dod dod
    dod dod dod
    si si si

    %10
    si si si
    la la la
    la la la

    %13
    sol sol sol
    sol sol sol
    fad fad fad

    %16
    fad4. re'8 dod4
    si8 sol' fad4 fad
    si8 si si re16 dod si8 fad

    %19
    re si re fad si,4

}

VIIIbcn = \relative do {

    si'8 si si re16 dod si8 fad
    re si re fad si, si'
    si4 lad fad

    %4
    si8 si, si si' si, si'
    dod dod, dod dod' dod, dod'
    re16 dod re mi re mi re dod\mbreak si la sol fad

    %7
    mi4 sol mi
    fad16 mi fad sol fad mi fad sol fad sol mi fad
    red4. si'8 red si

    %10
    mi mi, mi mi' mi, mi'
    dod la la dod la dod\mbreak
    re re, re re' re, re'

    %13
    si sol sol si sol si
    dod dod, dod dod' dod, dod'
    lad fad fad lad fad lad

    %16
    si4 si, dod
    re8 mi fad4 fad,
    si'8 si si re16 dod si8 fad

    %19
    re si re fad si,4

}

VIIIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    <_>4 <_> <_>8 s
    <6>4 <6> <6>8 s\bassFigureExtendersOff
    <2>4 <5/> s
    s2.
    <7>4 s8 <6\+ 5/> s4
    <6>2.
    <6 5>
    <_+>
    <5/>
    s
    <5/>
    s
    <6 5>
    <7>
    <5/>
    s2 <6\+ 5>4
    <6> <4> <7 _+>
    \bassFigureExtendersOn <_>4 <_> <_>8 s
    <6>

}

forma = {

    \key si\minor
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 40
    s2.*19
    \bar"|."


}

VIIIds = {
    \VIIIglobal
    <<\VIIIdsn \forma>>

}

VIIIhc = {
    \VIIIglobal
    <<\VIIIhcn \forma>>

}

VIIItl = {
    \VIIIglobal
    \clef alto
    <<\VIIItln \forma>>

}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>

}



IXglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \override Slur.outside-staff-priority = #500
}

IXflIn =  \relative do'' {

    r4 fad fad
    fad2.
    fad4 re' dod

    %4
    si8.(lad16) si8.(dod32 re) dod8. (re32 si)
    lad4-+ \appoggiatura sol8 fad4 r

    %6
    R2.\mbreak
    r4 re8. mi16 fad8.(mi32-+ re)
    mi4 mi8. fad16 sol8.(fad32\prall mi)

    %9
    fad4 la la
    la2.~
    la4 re8.(dod16) si8.(la16)

    %12
    sol8.(fad16) mi4.-+ re8
    re4 re' re
    re dod dod

    %15
    dod si8. la16 sold8. fad16
    mid4 re'(dod)
    r re(dod)\mbreak

    %18
    r re(dod)
    la8.-+ sold16 sold4.-+ fad8
    fad4 r r

    %21
    r fad8.(sol?32 fad) fad8.-+(mi32 fad)
    sol4 r r
    r mi8.(fad32 mi) mi8.-+(re32 mi)

    %24
    fad4 re' re
    re dod si
    lad \appoggiatura sol8 fad4 r

    %27
    r fad fad\mbreak
    fad re'8. dod16 re8. si16
    dod4 fad, re'~

    %30
    re8. dod16 dod4.-+ si8
    si2 r4

}

IXflIIn =  \relative do'' {

    R2.*2
    r4 fad fad
    fad8. sol16 mi4.-+(re16 mi)

    %5
    fad2 r4
    R2.\mbreak
    r4 si,8. dod16 re8.(dod32-+ si)

    %8
    dod4 dod8. re16 mi8.(re32\prall dod)
    re4 re, r
    R2.

    %11
    r4 la'' re,~
    re dod4.-+ re8
    re2 r4

    %14
    R2.*2
    r4 la' (sold)
    r la(sold)\mbreak

    %18
    r la(sold)
    dod,8 fad mid4.-+ fad8
    fad4 r r

    %21
    r red8.(mi32 red) red8.-+(dod32 red)
    mi4 r r
    r dod8.(re32 dod) dod8.-+(si32 dod)

    %24
    re4 fad fad
    fad mi re
    dod2-+ r4

    %27
    R2.\mbreak
    r4 si' si
    lad8. si16 dod8. lad16 si4~

    %30
    si8. dod16 lad4.-+ si8
    si2 r4

}

IXflIIIn =  \relative do'' {

    R2.*2
    r4 si la
    sol sol2_+

    %5
    fad r4
    R2.\mbreak
    r4 si si

    %8
    la la la
    re,2 r4
    R2.

    %11
    r4 fad sol
    mi la la
    re,2 r4

    %14
    R2.*2
    r4 fad'(mid)
    r la(sold)\mbreak

    %18
    r fad(mid)
    fad, dod' dod
    fad, r r

    %21
    r si si
    mi, r r
    r la la

    %24
    re, re re
    mi8 re mi fad sol mi
    fad2 r4

    %27
    R2.\mbreak
    r4 fad' fad
    fad2 fad4

    %30
    mi mi dod
    re2 r4

}

IXvlIn = \relative do'' {

    R2.
    r4 re8.(mi16) dod8.(mi16)
    re4-+ \appoggiatura dod8 si4 r

    %4
    R2.
    r4 dod8.(re16) dod8.(re16)
    mi4 dod8.(re32 mi) re8.-+ \parenthesize (dod16)\mbreak

    %7
    re4\appoggiatura dod8 si4 r
    R2.*2
    r4 fad'8.(sol16) mi8.(sol16)

    %11
    fad4 \appoggiatura mi8 re4 r
    R2.
    r4 fad8.(mi16) fad8.(sol16)

    %14
    mi4-+ mi8.(re16) mi8.(fad16)
    re4-+ re8. dod16 si8. la16
    sold4 r dod8. sold16

    %17
    la4 r dod8. sold16\mbreak
    la4 r r
    R2.

    %20
    r4 fad'8. sol16 sol8.(fad32\prall mi)
    red4 r r
    r mi8. fad16 fad8.(mi32\prall re)

    %23
    dod4 r r
    R2.*2
    r4 dod8.(re16) dod8.(re16)

    %27
    mi4 dod8.(re32 mi) re8.-+ \parenthesize (dod16)\mbreak
    re4 re re
    dod2 si4~

    %30
    si8. mi,16 dod4 fad
    fad2 r4

}

IXvlIIn = \relative do'' {

    R2.
    r4 si8.(dod16) lad8.(dod16)
    si4 si, r

    %4
    R2.
    r4 lad'8.(si16) lad8.(si16)
    dod4 lad8.(si32 dod) si8._+(lad16)\mbreak

    %7
    si4 si, r
    R2.*2
    r4 re'8.(mi16) dod8.(mi16)

    %11
    re4 re, r
    R2.
    r4 la' la

    %14
    la fad fad
    fad re re
    dod r dod

    %17
    dod r dod\mbreak
    dod r r
    R2.

    %20
    r4 lad'4 lad
    si r r
    r sold sold

    %23
    la r r
    R2.*2
    r4 lad8.(si16) lad8.(si16)

    %27
    dod4 lad8.(si32 dod) si8._+(lad16)\mbreak
    si4 si si,
    fad'8. [sold16 lad8. fad16 si8. fad16]

    %30
    sol4 fad fad
    fad2 r4

}

IXbcn = \relative do {

    si2 r4
    r si' fad
    si,2 r4
    R2.

    %5
    r4 fad' fad
    fad2.\mbreak
    si,2 r4

    %8
    R2.*2
    r4 re' la
    re,2 r4

    %12
    R2.
    r4 re re
    la' lad lad

    %15
    si si, si
    dod r dod
    fad, r dod'\mbreak

    %18
    fad, r r
    R2.
    r4 fad' fad

    %21
    si, r r
    r mi mi
    la, r r

    %24
    R2.*2
    r4 fad' fad
    fad2.~\mbreak

    %28
    fad~
    fad2 re4
    mi fad fad,

    %31
    si2 r4

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    s2 <_+>4
    s2.
    s
    s4 <_+>2
    <7 _+>2.
    s2.*7
    <4>4 <5/> s
    <9> <8 6\+ 5> s
    <_+>2.
    s2 <_+>4
    s2.
    s
    s4 <_+>2
    s2.
    s4 <_+>2
    s2.*3
    s4 <_+>2
    <7 _+>2.
    <6 4>
    <_+>2 <6>4
    <7>8 <6 5> <_+>4

}

forma = {

    \key si\minor
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 4 = 62
    s2.*31
    \bar "|."

}

IXflI = {
    \IXglobal
    <<\IXflIn \forma>>

}

IXflII = {
    \IXglobal
    <<\IXflIIn \forma>>

}

IXflIII = {
    \IXglobal
    <<\IXflIIIn \forma>>

}

IXvlI = {
    \IXglobal
    <<\IXvlIn \forma>>

}

IXvlII = {
    \IXglobal
    <<\IXvlIIn \forma>>

}

IXbc = {
    \IXglobal
    \clef bass
    <<\IXbcn \forma \IXbfn>>

}



Xglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

Xdsn =  \relative do'' {

    re4 dod8 si la sol
    fa sol la sol fa mi
    re4 re' dod

    %4
    re2 re4
    fa8 re sol mi fa re
    mi4 dod re

    %7
    sib8 la sol fa mi re
    la'2. la
    fa8 sol la sib do fa,

    %10
    mi4_+ fa2\mbreak
    re'8 do sib la sol fa
    mi4_+ fa2

    %13
    fa'8 mi re do sib la
    re mi fa4 fa,
    sib8 sol la fa sol mi

    %16
    fa2.
    fa'8 la, fa' la, fa' la,
    sol fa mi fa sol4

    %19
    mi'8 sol, mi' sol, mi' sol,
    fa mi re mi fa4
    la8 re do re si mi

    %22
    dod4-+ la re\mbreak
    re,8 mi fa4 mi
    re2.

}

Xhcn = \relative do'' {

    fa,4 r r
    re mi dod
    re8 mi mi2_+

    %4
    fa8 mi re4 dod
    re mi re
    dod mi fa

    %7
    mi re2
    dod4 dod8 dod re mi dod2.
    do!

    %10
    do4 do do\mbreak
    re re re
    do la2

    %13
    do4 do do
    sib do re
    re do2

    %16
    do2.
    re4 re re
    dod4. re8 mi4

    %19
    mi2.
    re4. dod8 re4\mbreak
    re2 mi4

    %22
    mi2 re4
    re re dod
    re2.

}

Xtln =  \relative do' {

    la4 r r
    re la la
    la8 sib la4 la

    %4
    la2 la4
    la2 la4
    la2 la4

    %7
    sol4. la8 sib4
    mi, mi8 mi fa sol mi2.
    la4. sol8 fa4

    %10
    do fa la\mbreak
    sib4 sib sib
    sol fa2

    %13
    la4 la la
    fa la la
    sol8 sib la do sib sol

    %16
    la2.
    la4 la la
    sib sib sib

    %19
    sib2.
    la4 la la\mbreak
    la2 sol4

    %22
    sol2 fa4
    sib la la
    la2.

}

Xbcn = \relative do {

    re4 r r
    re' dod8 si la sol
    fa sol la4 la,

    %4
    re8 mi fa4 mi
    re dod re
    la2 fa4

    %7
    sol8 la sib2
    la4 la'8 sol fa mi la,2.
    fa'4. sol8 la sib

    %10
    do4 la fa\mbreak
    sib, re sib
    do re2

    %13
    la4 la fa
    sib la re
    sib do do,

    %16
    fa fa'8 sol fa mi
    re2.
    mi4 sol8 fa mi re

    %19
    dod2.
    re4 fa8 mi re4
    fa,2 sol4

    %22
    la2 sib4\mbreak
    sol la2
    re,2.

}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s2.
    s4 <6>2
    <6>4 <4> <7 _+>
    s s <6\\\+>
    s <5/> s
    <_+>2.
    \bassFigureExtendersOn <6 5 _->4 <_->8 s s4 \bassFigureExtendersOff
    <_+>2.
    <_+>
    <5>
    s4 <6> s
    <6 5>2.
    s
    <6>
    <6 5>4 <6> s
    <6 5> <6 4> <7>
    s2.
    s
    <7>
    <5/>
    s
    <6>4 s <6 5>
    <7 _+>2.
    <6 5>4 <6 4> <7 _+>

}

forma = {

    \key do\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 67
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}\set Score.currentBarNumber = #9
    \bar ".|:"
    s2.*16
    \bar ":|."

}

Xds = {
    \Xglobal
    <<\Xdsn \forma>>

}

Xhc = {
    \Xglobal
    <<\Xhcn \forma>>

}

Xtl = {
    \Xglobal
    \clef alto
    <<\Xtln \forma>>

}

Xbc = {
    \Xglobal
    \clef bass
    <<\Xbcn \forma \Xbfn>>

}



XIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIobIn =  \relative do'' {

    fad2 mi4
    re la si
    la sol2_+

    %4
    fad4. mi8 fad sol
    la4 si do
    si sol'8 fad mi re

    %7
    dod?2-+ re4
    mi2 la,4 mi'2.-+
    mi8 fad sol2

    %10
    fad8 sol la2
    re,4 re re
    si_+ la2

    %13
    si4 dod re
    dod-+ \appoggiatura si8 la4 la'
    sol fad2

    %16
    mi2.-+\mbreak
    mi8 fad sol2
    fad8 sol la2

    %19
    re,4 re re
    si_+ la2
    si8 la si dod re mi

    %22
    la,4 sol' fad
    mi4.-+ re8 dod4
    re2. re

}

XIhcn = \relative do'' {

    la,2.~
    \repeat unfold 24 {la~}
    la

}

XIfgn =  \relative do {

    re'8 re, fad re sol mi
    fad re fad re sol mi
    fad re' dod re mi, dod'

    %4
    re, la si dod re mi
    fad re' re, re' fad, re'
    sol, la si la sol fad

    %7
    mi sol fad mi fad re
    la' sol la si dod la la4 la,2
    dod'8 re mi re mi dod

    %10
    re mi fad mi fad re
    fad, mi fad re fad re
    sol mi fad re fad re

    %13
    sol fad mi4 re
    la'8 mi' sol, mi' fad,  mi'
    mi, dod' re4 re,

    %16
    la'8 mi fad sol la si \mbreak
    dod re mi re mi dod
    re mi fad mi fad re

    %19
    fad, mi fad re fad re
    sol mi fad re fad re
    sol fad sol la si sol

    %22
    fad re' mi, dod' re fad,
    sol mi la4 la,
    re8 mi fad sol la si re,2.

}

XIbcn = \relative do {

    re,2.~
    \repeat unfold 24 {re~}
    re

}

XIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 67
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}\set Score.currentBarNumber = #9
    \repeat volta 2 {s2.*15}
    \alternative {{s2.}{s}}
    \bar "|."
    \once \override Score.RehearsalMark.extra-offset = #'(-3 . 0) \mark\markup\smaller "Au premier"

}

XIobI = {
    \XIglobal
    <<\XIobIn \forma>>

}

XIhc = {
    \XIglobal
    <<\XIhcn \forma>>

}

XIfg = {
    \XIglobal
    \clef bass
    <<\XIfgn \forma>>

}

XIbc = {
    \XIglobal
    \clef bass
    <<\XIbcn \forma \XIbfn>>

}



XIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIIdsn =  \relative do'' {

    la4 re
    re mi dod
    re mi fa
    mi fa sol

    %4
    fa-+ mi la
    sib,8(la) sib4 sol'
    la,8(sol) la4 fa'

    %7
    fa mi re
    mi dod re~
    re8 sib' mi,4.-+ re8

    %10
    re4\fermata fa,8 la la do
    do fa, fa4 fa'\mbreak

    %12
    mi8 fa fa4.-+ mi16 fa
    sol8 do sib4 la
    sol4.-+ do,8 do do

    %15
    re16 do sib la sol8 sol' sol sol
    sol16 fa mi re do8.[fa16 sol8. la16]
    fa8. sib16 sol4.-+ fa8

    %18
    fa4 la la,
    re8 mi mi4.-+(re16 mi)
    fa2.

    %21
    mi8 fa sol fa mi re
    dod4 fa,8 la16 sol fa8 mi
    re4 re'4. mi8

    %24
    fa4. la,8 re4
    si dod re
    dod la'8 la, la' la,

    %27
    la' fad16 mi re8 do sib la
    sib sol sol' sol, sol' sol,
    sol' mi16 re do8 sib la sol

    %30
    la fa fa' fa, fa' fa,
    fa' re16 do si8 re do mi
    re fa si,4._+ la8

    %33
    la4

}

XIIhcn = \relative do'' {

    fa,4 la
    sib2 sib4
    la sol fa
    la2 la4

    %4
    la la la
    sol2 sol4
    sol mi re

    %7
    re la' sold
    la2 la4
    sib  la2

    %10
    fa4 r r
    r do la'4
    sol8 la la4 do

    %13
    do2 do4
    do sol la
    fa re sib'

    %16
    mi,4. do'8 sib4
    la8. re16 do4 sib
    la2_+ r4

    %19
    r dod dod
    re2 re4
    sib2.\mbreak

    %22
    la4 r r
    r la2
    la la4

    %25
    la sol fa
    mi mi mi
    fad la fad

    %28
    sol re re
    mi sol mi
    fa do re

    %31
    re fa mi8 la
    la4 sold4. la8
    la4

}

XIItln =  \relative do' {

    re4 fa
    sol4. sol8 fa mi
    fa4 dod re
    mi re dod

    %4
    re dod re
    mi4. re8 dod re
    mi2 la,4

    %7
    si dod re
    dod mi fa
    re dod4. re8

    %10
    re4 r r
    r la do
    do fa la

    %13
    sib8 la sol4 fa
    mi-+ mi fa
    re sib re

    %16
    do4. do8 re4
    re8. fa16 fa4 mi-+
    fa2 r4

    %19
    r la la
    la2 la4
    sol2 sol4\mbreak

    %22
    mi r r
    r fa4. dod8\mbreak
    re4 fa fa

    %25
    re mi la,
    la2 dod4-+
    re re re

    %28
    re2 sib4
    do do do
    do la la

    %31
    si?2 la8 do
    fa4 mi2
    dod4

}

XIIbcn = \relative do {

    fa4 re
    sib'8 la sol sib la sol
    fa4 mi re
    dod si la

    %4
    re la fa'
    sol4. fa8 mi re
    dod2 re4

    %7
    sol la sib
    la sol fa
    sol la la,

    %10
    re r r
    r fa8 la la do\mbreak
    do fa, fa4 fa'

    %13
    mi2 fa4
    do sib la
    sib2 sol4

    %16
    do4. la8 sib do
    re sib do4 do,
    fa2 r4

    %19
    r la la,
    re8 dod re mi fa re
    sol4. la8 sib sol

    %22
    la4 r r
    r fa8 la16 sol fa8 mi
    re dod re mi fa re

    %25
    sol fa mi4 re
    la' dod la
    re fad, re

    %28
    sol sib sol
    do mi, do
    fa2 re4

    %31
    sold,2 la4
    re mi mi,
    la

}

XIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    <6>2
    <6\\> <_+>4
    <6> <6\\\+> s
    \bassFigureExtendersOn <5/>4 <5/> <5/>8 s\bassFigureExtendersOff
    s4 <_+> <6>
    <9 _-> <8> s
    <5/>2.
    <7 _->4 <_+> <6\\>
    <_+> s <6>
    <6 5 _-> <4> <7 _+>
    s2.*3
    <5/>2.
    s2 <6>4
    <9> <8> s
    s4. <6>8 <6> <6 4>
    s <6 5> <4>4 <7>
    s2. s4 <4> <7 _+>
    s2.
    <6 5 _->
    <_+>
    s4 <6> s8 <6\\\+>
    s2.
    <9>4 <6\\\+> s
    <_+>2.
    <_+>
    <_->
    <7> s <7>
    <6 5>4 <4> <7 _+>
    <_+>

}

forma = {

    \key do\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 60
    \mark\markup\segno
    \partial 2 s2
    s2.*9
    \once \override Score.RehearsalMark.extra-offset = #'(+3 . 0)
    \mark\markup "Fin"
    s4\fermata
    \bar ":|."\break
    s2
    s2.*11
    s4
    \bar"||"%\break
    \mark\markup\segno
    s2
    s1*10
    s4
    \bar"||"
    \mark\markup\segno

}

XIIds = {
    \XIIglobal
    <<\XIIdsn \forma>>

}

XIIhc = {
    \XIIglobal
    <<\XIIhcn \forma>>

}

XIItl = {
    \XIIglobal
    \clef alto
    <<\XIItln \forma>>

}

XIIbc = {
    \XIIglobal
    \clef bass
    <<\XIIbcn \forma \XIIbfn>>

}



XIIIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIIIdsn =  \relative do'' {

    re4 re
    re la
    si8 [dod re mi]

    %4
    la,2
    si8[dod re mi]
    dod[re mi fad]

    %7
    re[sol sol fad]
    mi4-+ mi
    la re,

    %10
    re16 mi dod8 re16 mi dod8\mbreak
    re[mi fad sol]
    la4 re,

    %13
    re16 mi dod8 re16 mi dod8
    re[mi fad sol]
    la[si la sol]

    %16
    fad[la sol fad]
    mi\prall[re mi dod]
    re la'16 sol fad8 mi

    %19
    re la'16 sol fad8 mi
    re4 re

}

XIIIhcn = \relative do'' {

    fad,4 fad
    fad fad
    sol sol

    %4
    fad fad
    sol si
    la dod

    %7
    si8[re mi re]
    dod4-+ dod
    re, fad

    %10
    fad8[sol fad mi]\mbreak
    fad[mi re dod]
    re4 re

    %13
    fad8[sol fad mi]
    fad[mi re dod]
    re4 re

    %16
    la'8[fad sol la]
    la[fad sol mi]
    fad4 fad

    %19
    fad fad
    fad fad

}

XIIItln =  \relative do' {

    la4 la
    la re
    re re

    %4
    re re
    re sol
    mi la

    %7
    fad8[si la la]
    la4 la,
    fad la

    %10
    la la\mbreak
    la la
    fad la

    %13
    la la
    la la
    fad fad

    %16
    re' dod8 re
    dod[si si la]
    la4 la

    %19
    la la
    la la

}

XIIIbcn = \relative do {

    re4 re
    re re
    sol8[sol fad mi]

    %4
    fad4 re
    sol mi
    la fad

    %7
    si8[si dod re]
    la4 la,
    fad' fad

    %10
    fad8[mi fad sol]
    fad[sol fad mi]
    re4 fad

    %13
    fad8[mi fad sol]
    fad[sol fad mi]
    re4 re\mbreak

    %16
    re8[fad mi re]
    la'[si sol la]
    re,4 re

    %19
    re re
    re re,

}

XIIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    s
    <6 5>8 <4\+> <6> <6\\>
    <6>2
    s
    s
    <7>8 <6> <5/> s
    <4>4 <3>
    <6>2
    <6>4 s8 <4\+>
    <6>2
    s
    <6>4 s8 <4\+>
    <6>2
    s
    s4 <6\\>
    s <6 5>

}

forma = {

    \key re\major
    \time 2/4
    \tempo 2 = 70
    s2*8
    \bar ":..:"
    s2*12
    \bar":|."

}

XIIIds = {
    \XIIIglobal
    <<\XIIIdsn \forma>>

}

XIIIhc = {
    \XIIIglobal
    <<\XIIIhcn \forma>>

}

XIIItl = {
    \XIIIglobal
    \clef alto
    <<\XIIItln \forma>>

}

XIIIbc = {
    \XIIIglobal
    \clef bass
    <<\XIIIbcn \forma \XIIIbfn>>

}



XIVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XIVdsn =  \relative do'' {

    la'4 \appoggiatura sol8 fa4 \appoggiatura mi8 re4
    dod \appoggiatura si8 la4 sib
    \appoggiatura la8 sol4 \appoggiatura fa8 mi4 la8 sib

    %4
    mi,2_+ re4
    la' re \appoggiatura do8 si4
    mi dod re\mbreak

    %7
    sol fa4.-+(mi16 fa)
    mi2.-+ mi
    la,8 sib do4 fa,

    %10
    re' do fa
    \appoggiatura mi8 re4 mi4. fa8

    %12
    mi4.-+ re8 do4
    sib' la sol
    la mi fa4~\mbreak

    %15
    fa8 sib sol4.-+ fa8
    fa4 la la,
    sib re sol

    %18
    si,!2 dod4
    re mi fa
    dod4.-+ si8 la4

    %21
    sib la \appoggiatura sol8 fad4
    sol \appoggiatura fa?8 mi4 la
    sol8 fa mi4._+ re8

    %24
    re2.

}

XIVhcn = \relative do'' {

    fa,2 fa4
    mi fa re
    re dod re

    %4
    dod2_+ re4
    re fa re
    sol mi fa

    %7
    mi re2
    dod4. dod8 re mi dod2.\mbreak
    fa

    %10
    fa4 la2
    fa4 sol la
    sol2 la4

    %13
    sol2.
    fa4 sib la
    fa mi4._+ fa8

    %16
    fa2 fad4
    sol2 r4
    sol2 sol4

    %19
    fa dod re\mbreak
    mi2 re4
    re dod2

    %22
    re4 dod re
    re dod4. re8
    re2.

}

XIVtln =  \relative do' {

    re2 la4
    la la sol
    sol la la

    %4
    la2 la4
    la2 sol4
    si la si

    %7
    la la2
    la4. la8 si dod la2.\mbreak
    do?

    %10
    sib4 do2
    sib4 sib do
    do2 do4

    %13
    do2.
    do
    re4 do2

    %16
    la re4
    re2 r4
    re2 mi4

    %19
    la,2 la4\mbreak
    la2 la4
    sol fad la

    %22
    sol sib la
    sib la la
    fa?2.

}

XIVbcn = \relative do {

    re8 dod re mi fa sol
    la4 fa sol
    mi la8 mi fa sol

    %4
    la4 la, re
    fa re sol
    mi la re,\mbreak

    %7
    dod re re,
    la' la'8 sol fa mi la,4 la'8 sib la sol
    fa sol la sol la fa

    %10
    sib4 la fa
    sib8 la sol4 fa
    do'8 re do sib la4

    %13
    mi2.
    fa4 sol la\mbreak
    sib do do,

    %16
    fa2 re4
    sol2 r4
    sol fa mi

    %19
    fa mi re
    la' sol fad
    sol la2

    %22
    sib fa4
    sol la la,
    re2.

}

XIVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.
    <_+>4 <6> <_->
    <7> <_+> <6>8 <6 5 _->
    <4>4 <7 _+> s
    <6> s s
    <7> <7 _+> s
    <5/>2.
    <_+>
    <_+>
    <5>
    <6 5>4 <6> s
    <9> <6\\> s
    s2 <6>4
    <5/>2.
    s4 <6 _-> <6>
    <6 5> s <7>
    s2.
    <_->
    <_!>4 s <6\\\+>
    <6> <6\\\+> s
    <_+> s <6>
    <_-> <6\\\+> s
    <6> <2\+> <6>
    <6 5 _-> <4> <7 _+>

}

forma = {

    \key do\major
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2 = 50
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}\set Score.currentBarNumber = #9
    \repeat volta 2 { s2.*16}

}

XIVds = {
    \XIVglobal
    <<\XIVdsn \forma>>

}

XIVhc = {
    \XIVglobal
    <<\XIVhcn \forma>>

}

XIVtl = {
    \XIVglobal
    \clef alto
    <<\XIVtln \forma>>

}

XIVbc = {
    \XIVglobal
    \clef bass
    <<\XIVbcn \forma \XIVbfn>>

}



XVglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XVobIn =  \relative do'' {

    re4 re
    la si8 la sol4 la
    fad re fad sol
    la si8 la sol4 fad

    %4
    mi_+re re' re
    la si8 la sol4 la
    fad re fad sol

    %7
    la si8 la sol4 fad
    mi2_+ mi'4 fad\mbreak  %% fin qui
    mi re8 dod si 4 mi

    %10
    dod la mi' fad
    mi la8 dod, re4 dod
    si2-+ mi8 fad mi4

    %13
    la la, si-+ la
    la' la, si-+ la
    re dod si8\prall la si dod

    %16
    la2 re4 la\mbreak  %% da qui
    si8 la sol fad mi4 si'
    la8 sol fad mi re4 la'

    %19
    sol fad mi re
    la'2 la8 si la4
    si8 dod si4 dod8 re dod4

    %22
    re8 mi re4 mi8 fad mi4
    fad8 mi re4 mi dod-+
    re2

}

XVobIIn =  \relative do'' {

    re4 re
    la si8 la sol4 la
    fad re fad sol
    la si8 la sol4 fad

    %4
    mi_+re re' re
    la si8 la sol4 la
    fad re fad sol

    %7
    la si8 la sol4 fad
    mi2_+ dod'4 re\mbreak
    dod si8 la sold la si sold

    %10
    la4 mi dod' re
    dod mi sold, la
    sold_+ mi r2

    %13
    r4 mi fad mi
    r mi fad mi
    sold la sold4. la8

    %16
    la2 re4 la\mbreak  %% da qui
    si8 la sol fad mi4 si'
    la8 sol fad mi re4 la'

    %19
    sol fad mi re
    la'2 la8 si la4
    si8 dod si4 dod8 re dod4

    %22
    re8 mi re4 mi8 fad mi4
    fad8 mi re4 mi dod-+
    re2

}

XVdsn =  \relative do'' {

    re4 re
    la si8 la sol4 la
    fad re fad sol
    la si8 la sol4 fad

    %4
    mi_+re re' re
    la si8 la sol4 la
    fad re fad sol

    %7
    la si8 la sol4 fad
    mi2_+ r\mbreak  %% fin qui
    R1*7

    %16
    r2 re'4 la\mbreak  %% da qui
    si8 la sol fad mi4 si'
    la8 sol fad mi re4 la'

    %19
    sol fad mi re
    la'2 la8 si la4
    si8 dod si4 dod8 re dod4

    %22
    re8 mi re4 mi8 fad mi4
    fad8 mi re4 mi dod-+
    re2

}

XVhcn = \relative do'' {

    r2
    r dod,4 dod
    re2 re4 dod
    re2 dod4 re

    %4
    dod re r2
    r dod4 dod
    re2 re4 dod\mbreak

    %7
    re2 dod4 re
    dod2_+ r
    R1*7

    %16
    r2 fad4 fad\mbreak
    sol2. mi4
    fad2. re4

    %19
    dod re la si
    dod mi fad2
    sol mi4 la

    %22
    fad si la la
    la la sol mi
    fad2

}

XVtln =  \relative do' {

    r2
    r la4 la
    la2 la4 sol
    fad re' mi la,

    %4
    sol fad r2
    r la4 la
    la2 la4 sol\mbreak

    %7
    fad re' mi la,
    la2 r
    R1*7

    %16
    r2 re
    re4 si2 sol4
    la2. fad4

    %19
    sol la la sold
    la dod re2
    re dod

    %22
    si4 sol' sol dod,
    re dod si la
    la2

}

XVfgn = \relative do {

    r2
    r la'4 la
    re, fad8 mi re4 mi
    fad sol8 fad mi4 re

    %4
    la' re, r2
    r la'4 la
    re, fad8 mi re4 mi

    %7
    fad sol8 fad mi4 re
    la2 la'4 re,\mbreak %% fin qui
    la' re, mi mi,

    %10
    la2 la'4 re,
    la' dod, si la
    mi'2 r

    %13
    r4 dod' re dod
    r dod re dod
    si la mi' mi,

    %16
    la, la' fad re\mbreak %% da qui
    sol2. sol4
    fad2. fad4

    %19
    mi re dod si
    la la' fad re
    sol, sol' la la,

    %22
    si si' dod la
    re fad, sol la
    re,2

}

XVbcn = \relative do {

    r2
    r la'4 la
    re, fad8 mi re4 mi
    fad sol8 fad mi4 re

    %4
    la' re, r2
    r la'4 la
    re, fad8 mi re4 mi

    %7
    fad sol8 fad mi4 re
    la2 la'4 re,\mbreak %% fin qui
    la' re, mi mi,

    %10
    la2 la'4 re,
    la' dod, si la
    mi'2 r

    %13
    r4 dod' re dod
    r dod re dod
    si la mi' mi,

    %16
    la, la'  fad4 re\mbreak %% da qui
    sol2. sol4
    fad2. fad4

    %19
    mi re dod si
    la la' fad re
    sol, sol' la la,

    %22
    si si' dod la
    re fad, sol la
    re,2

}

XVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2
    s <7>
    s2 s4 <6\\>
    <6>2 <6\\>
    s1
    s2 <7>
    s2 s4 <6\\>
    <6>2 <6\\>
    s1
    s4 <6 5> <_+>2
    s1
    s2 <6\+>
    <_+>1
    s4 <6> <6> <6>
    s <6> <6> <6>
    <6\+>2 <_+>
    s <6>
    <6 5>1
    <6>
    <6\\>2 <6>4 <6\\\+>
    s2 <6>
    <6 5>1
    <7>2 <5/>
    s2 <6 5>

}

forma = {

    \key re\major
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 50
    \partial 2 s2
    s1*7
    s2
    \bar ":..:"
    s
    s1*15
    s2
    \bar":|."

}

XVobI = {
    \XVglobal
    <<\XVobIn \forma>>

}

XVobII = {
    \XVglobal
    <<\XVobIIn \forma>>

}

XVds = {
    \XVglobal
    <<\XVdsn \forma>>

}

XVhc = {
    \XVglobal
    <<\XVhcn \forma>>

}

XVtl = {
    \XVglobal
    \clef alto
    <<\XVtln \forma>>

}

XVfg = {
    \XVglobal
    \clef bass
    <<\XVfgn \forma>>

}

XVbc = {
    \XVglobal
    \clef bass
    <<\XVbcn \forma \XVbfn>>

}



XVIglobal = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

XVIdsn =  \relative do'' {

    la8 sib
    do4 fa, fa fa'8 mi
    fa4 do do fa8 mi
    re fa sib, re sol, do sib do

    %4
    la sib la sol fa do' re mi
    fa sol fa mi re mi re do
    si do si la sol la sol fa

    %7
    mi4 do' re si
    do4 do,2 sol''8 fa\mbreak
    mi4 sol do, sib

    %10
    la sol fa fa'8 mi
    re4 fa sib, la
    sol fa mi mi'8 re

    %13
    dod4 mi la, sol
    fa mi re re'8 do
    sib la sol fa mi4._+ re8

    %16
    re2 r8 re' mi fa
    do4 sol' sib, sib\mbreak
    sib la8 sol la4 fa'8 mi

    %19
    re 4sib'8 la sol fa mi re
    mi4.-+ re8 do mi re mi
    fa4 do fa,8 fa' mi fa

    %22
    sol4 do, \once \stemUp mi,8 sib'' la sol
    la sol fa4 sol mi
    fa fa,2

}

XVIhcn = \relative do'' {

    r4
    r2 r4 la8 sib
    do sib la sol fa4 fa
    fa2 mi

    %4
    fa2. la4
    la2 fa
    re2. si4

    %7
    do mi re fa
    mi2. r4\mbreak
    sol4 mi8 fa sol4 mi

    %10
    fa2. la8 sol
    fa4 re8 mi fa4 re
    mi2. sol8 fa

    %13
    mi4 dod8 re mi4 dod
    re2. fa8 mi
    re4 re dod4._+ re8

    %16
    re2. re4\mbreak
    sol2. mi4
    fa2. fa4

    %19
    sol2. sib8 la
    sol4._+ fa8 mi4 sol
    la2. la4

    %22
    sol2. sol4
    fa la sol sib
    la2.

}

XVItln =  \relative do' {

    r4
    r2 r4 do8 sib
    la4 la la do

    %3
    re2 do
    do2. do4
    re2 la

    %6
    sol2. sol4
    sol sol la sol
    sol2. r4\mbreak

    %9
    do2. do4
    do2. do4
    sib2. sib4

    %12
    sib2. sib4
    la2. la4
    la2. la4

    %15
    sib sib la la
    fa2 la\mbreak
    sol2. do4

    %18
    do2. do4
    sib2 re
    do2. do4

    %21
    do2. do4
    do2. do4
    do2 re4 do

    %24
    la2.

}

XVIbcn = \relative do {

    r4
    r2 r4 fa8 sol
    la4 fa fa, la'
    sib,8 sol' sib sol do4 do,

    %4
    fa do fa, fa'8 mi
    re4 re, re re'
    sol sol,8 la si4 sol

    %7
    do  mi, fa sol
    do,2. r4
    do'' do,8 re mi4 do

    %10
    fa sol la fa
    sib sib,8 do re4 sib
    mi fa sol mi

    %13
    la la,8 si dod4 la
    re mi fa re
    sol mi la la,

    %16
    re mi fa re
    mi re mi do\mbreak
    fa do fa, la'

    %19
    sib sol8 la sib4 sol
    do do, do' sib
    la sol la fa

    %22
    mi8 fa mi re do4 mi
    fa la, sib do
    fa,2.

}

XVIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown
    s4
    s1
    <6>2 s
    <6 5>2 <4>4 <7>
    <_> <_> <_> <_>8 s
    s1
    <_!>
    s4 s <6 5> <7>
    s1*4
    <7>4 <7>4 <7>8 s s4
    <_+>1
    s
    <6 5>4 s <4> <7 _+>
    <_>2 <_>8 s s4
    <5/>1
    <4>2 <3>
    <6 5>1
    s
    <6>
    <5/>8 <5/> <5/>8 s s2
    s2 <6 5>

}

forma = {

    \key fa\major
    \time 2/2
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 1 = 60
    \partial 4 s4
    s1*7
    s2. \bar ":..:" s4
    s1*15
    s2.
    \bar ":|."

}

XVIds = {
    \XVIglobal
    <<\XVIdsn \forma>>

}

XVIhc = {
    \XVIglobal
    <<\XVIhcn \forma>>

}

XVItl = {
    \XVIglobal
    \clef alto
    <<\XVItln \forma>>

}

XVIbc = {
    \XVIglobal
    \clef bass
    <<\XVIbcn \forma \XVIbfn>>

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper {
    print-first-page-number = ##t
    first-page-number = #2
}

\bookpart {

    \paper {
        systems-per-page = #4
    }

    \header {
        title = \markup\column\smaller { "Les Voyages de l'Amour - Suite - Parte II"}
        composer = \markup \center-column{"J, B. Boismortier (1689-1755)"}
    }

    \markup \huge  {"[II.1] Air en rondeau - Gracieusement"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key la\minor \time 2/2 mi''4^\markup \center-align\center-column {"[Dessus]"} fa''}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ids
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key la\minor \time 2/2 do''4^\markup \center-align\column\smaller{"[Haute-contre]"} si'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Ihc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key la\minor \time 2/2 mi'4^\markup \center-align\column\smaller{"[Taille]"} re'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Itl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.2] Marche"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key sol\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi sol''16^\markup \center-align\center-column {"[Dessus]"} [fad'' mi''8]}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key sol\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r2 r^\markup \center-align\column\smaller{"[Haute-contre]"}mi'4 red'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key sol\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi r2 r^\markup \center-align\column\smaller{"[Taille]"} si4 si}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.3] Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key mi\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi''8^\markup \center-align\center-column {"[Dessus]"} [fad'']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sold'4.^\markup \center-align\column\smaller{"[Haute-contre]"} sold'8}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key mi\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi'2^\markup \center-align\column\smaller{"[Taille]"} mi'4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.4] 2" \super e "Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key mi\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi''8^\markup \center-align\center-column {"[Dessus]"} [fad'']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit si'2^\markup \center-align\column\smaller{"[Haute-contre]"} }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \IVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key mi\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'2^\markup \center-align\column\smaller{"[Taille]"} }
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \IVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IVbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.5] Loure"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key mi\minor \time 6/4\numericTimeSignature mi'8^\markup \center-align\center-column {"[Dessus]"} fad'4}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Vds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor \time 6/4\numericTimeSignature r8 r4 ^\markup \center-align\column\smaller{"[Haute-contre]"} r2 r8 si' do''4 }
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Vhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key mi\minor \time 6/4\numericTimeSignature r8 r4 ^\markup \center-align\column\smaller{"[Taille]"} r2 r8 sol' fad'4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Vtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Vbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.6] Païsanne"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key mi\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit mi''2^\markup \center-align\center-column {"[Dessus]"} mi''}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit si'2^\markup \center-align\column\smaller{"[Haute-contre]"} si'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key mi\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sold'2^\markup \center-align\column\smaller{"[Taille]"} sold'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \VItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.7] Contredance"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key mi\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'8^\markup \center-align\center-column {"[Dessus]"} [fad']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1^\markup \center-align\column\smaller{"[Haute-contre]"} sol'4 sol'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key mi\minor \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1^\markup \center-align\column\smaller{"[Taille]"} mi'4 mi'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \VIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.8] Acte  IV: Prélude"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key si\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit sol'8^\markup \center-align\center-column {"[Dessus]"} [fad']}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key si\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1^\markup \center-align\column\smaller{"[Haute-contre]"} sol'4 sol'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \VIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key si\minor \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r1^\markup \center-align\column\smaller{"[Taille]"} mi'4 mi'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \VIIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.9] Sommeil"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key si\minor \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 r4^\markup \center-align\tiny {"P." \super ere"Flûte seule"}  fad''4 fad''}
                    \set Staff.shortInstrumentName = "fl1"
                    \clef violin
                    \set Staff.midiInstrument = #"flute"
                    \IXflI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key si\minor \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 r2.^\markup \center-align\tiny {"2." \super e"Flûte seule"}  r r4 fad'' fad''}
                    \set Staff.shortInstrumentName = "fl2"
                    \clef violin
                    \set Staff.midiInstrument = #"flute"
                    \IXflII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key si\minor \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 r2.^\markup \center-align\tiny {"3." \super e"Flûte seule"} r r4 si' la'}
                    \set Staff.shortInstrumentName = "fl3"
                    \clef violin
                    \set Staff.midiInstrument = #"flute"
                    \IXflIII
                >>
            >>

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key si\minor \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 r2.^\markup \center-align {"Violon [I]"} r4 re''8. [(mi''16)]}
                    \set Staff.shortInstrumentName = "vl1"
                    \clef violin
                    \set Staff.midiInstrument = #"violin"
                    \IXvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key si\minor \once\override Staff.TimeSignature.style = #'single-digit \time 3/4 r2.^\markup \center-align {"Violon [II]"} r4 si'8. [(dod''16)]}
                    \set Staff.shortInstrumentName = "vl2"
                    \clef violin
                    \set Staff.midiInstrument = #"violin"
                    \IXvlII
                >>
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IXbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #4
    }

    \markup \huge  {"[II.10] Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''4^\markup \center-align\center-column {"[Dessus]"} dod''8}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Xds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'4^\markup \center-align\column\smaller{"[Haute-contre]"} r}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \Xhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la4^\markup \center-align\column\smaller{"[Taille]"} r}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \Xtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Xbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.11] 2" \super e "Menuet"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fad''2^\markup \center-align\center-column {"Haubois"} mi''4}
                \set Staff.shortInstrumentName = "ob"
                \clef violin
                \set Staff.midiInstrument = #"oboe"
                \XIobI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la2.^\markup \center-align\column\smaller{"Violons"} }
                \set Staff.shortInstrumentName = "vl"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIhc
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XIfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.12] Air en Rondeau"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'4^\markup \center-align\center-column {"[Dessus]"} re''}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'4^\markup \center-align\column\smaller{"[Haute-contre]"} la'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'4^\markup \center-align\column\smaller{"[Taille]"} fa'}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.13] Tambourin"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi re''4^\markup \center-align\center-column {"[Dessus]"} re''}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi fad'4^\markup \center-align\column\smaller{"[Haute-contre]"} fad'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIIIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key re\major \time 2/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digi la4^\markup \center-align\column\smaller{"[Taille]"} la}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XIIItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIIIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

    \markup \huge  {"[II.14] Sarabande"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la''4^\markup \center-align\center-column {"[Dessus]"} fa''}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit fa'4^\markup \center-align\column\smaller{"[Haute-contre]"} fa'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XIVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key do\major \time 3/4\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re'2^\markup \center-align\column\smaller{"[Taille]"} la4}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XIVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XIVbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 17)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

}\bookpart {

    \paper {
        systems-per-page = #3
    }

    \markup \huge  {"[II.15] Gavotte"}

    \score {

        \new ChoirStaff <<

            \new PianoStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key re\major \time 2/2 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''4^\markup \center-align {"Haubois [I]"}  re''}
                    \set Staff.shortInstrumentName = "ob1"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \XVobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef french \key re\major \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit \time 2/2 re''4^\markup \center-align {"Haubois [II]"}  re''4}
                    \set Staff.shortInstrumentName = "ob2"
                    \clef violin
                    \set Staff.midiInstrument = #"oboe"
                    \XVobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key re\major \time 2/2 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit re''4^\markup \center-align {"[Dessus]"}  re''4}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major \time 2/2 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r2^\markup \center-align{"[Haute-contre]"} r dod'4 dod'}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key re\major \time 2/2 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r2^\markup \center-align{"[Taille]"} r la4 la}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XVtl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"Bassons"}
                \set Staff.shortInstrumentName = "fg"
                \set Staff.midiInstrument = #"bassoon"
                \XVfg
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XVbc
            >>
        >>

        \layout {
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
        systems-per-page = #4
    }

    \markup \huge  {"[II.16] Bourrée"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef french \key fa\major \time 2/2 \numericTimeSignature\override Staff.TimeSignature.style = #'single-digit la'8^\markup \center-align\center-column {"[Dessus]"} [sib'8]}
                \set Staff.shortInstrumentName = "ds"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIds
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4^\markup \center-align\column\smaller{"[Haute-contre]"} r2. la'8[sib']}
                \set Staff.shortInstrumentName = "hc"
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \XVIhc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef mezzosoprano \key fa\major \time 2/2\numericTimeSignature\override Staff.TimeSignature.style = #'single-digit r4^\markup \center-align\column\smaller{"[Taille]"} r2. do'8[sib]}
                \set Staff.shortInstrumentName = "tl"
                \clef alto
                \set Staff.midiInstrument = #"viola"
                \XVItl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup  \center-column{"[Basse]"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \XVIbc
            >>
        >>

        \layout {
            #(layout-set-staff-size 18)
            indent = 2.5\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.uniform-stretching = ##f
                \override BarLine.hair-thickness = #1.2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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
