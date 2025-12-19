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

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "Pizzicati"

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



Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzinequarto \senza
}


Ifln = \relative do'' {

    R2.*6
    r8 la' la la la la
    sib sib16 la sol8 sib la sol

    %9
    la la16 sol  fa8 la sol fa
    sol sol16 fa mi8 sol fa mi
    fa la re dod re re,

    %12
    sol16 la sib sol mi fa sol mi dod re mi dod
    sol4 r r
    r r8 sol' fa[mi]

    %15
    fa mi16 re la4 dod\tr
    re r8 la' re[dod]
    re re16 dod re8 re16 dod re8 re16 dod

    %18
    re4 re r
    R2.*24
    r8 mi,\noBeam la mi la mi

    %44
    fa la16 sol fa sol fa mi re mi re do
    si8 re sol re sol re
    mi sol16 fa mi fa mi re do re do si

    %47
    la8 do fa do fa do
    re fa16 mi re mi re do si do si la
    sold8 si mi si mi si

    %50
    do4 mi mi
    mi2.\tr
    r4 fa re'

    %53
    si2\tr r4\mbreak
    r8 mi, _\solo si'[mi,] si'4~
    si16 do si(do) la8 si do4 %OOKK

    %56
    r8 mi, si'[mi,] si'4~
    si16 do si(do) la8 si do4
    r8 re,\noBeam la' re, la'4~

    %59
    la16 sib la(sib) sol8 la sib4
    r8 re, la'[re,] la'4~
    la16 sib la(sib) sol8 la sib4\mbreak

    %62
    r8 do, sol'[do,] sol'4~
    sol16 la sol(la) fa8 sol la4
    r8 do, sol'[do,] sol'4~

    %65
    sol16 la sol(la) fa8 sol la4
    fa8 la16 sol fa8 fa fa fa
    fa re'16 do re8 fa, fa fa

    %68
    fa la16 sol fa8 fa fa fa
    fa sib16 la sib8 fa fa fa\mbreak
    fa la16 sol fa8 fa fa fa

    %71
    fa re'16 do re8 fa, fa fa
    do4 sol'2\tr
    fa2 r4

    %74
    r8 re fa[sib] re4
    R2.*2
    r8 do, mi[sol] do4

    %78
    R2.*2
    r8 re, fa[la] re4
    R2.*6

    %87
    r4 r r8 r16 fa,,
    fa4(mi) r8 r16 sol\mbreak
    sol4(fa) r8 r16 la

    %90
    la4(sol) r8 r16 sol'
    fa4(mib?) r8 r16 dod
    re2.

    %93
    mi
    la,8. re16 re4 dod\tr
    re2 r4

    %96
    R2.*5
    r8 la' la la la la
    sib sib16 la sol8 sib la sol

    %103
    la la16 sol  fa8 la sol fa
    sol sol16 fa mi8 sol fa mi
    fa la re dod re re,

    %106
    sol16 la sib sol mi fa sol mi dod re mi dod
    sol4 r r
    r r8 sol' fa[mi]

    %109
    fa mi16 re la4 dod\tr
    re r8 la' re[dod]
    re re16 dod re8 re16 dod re8 re16 dod

    %112
    re4 re r\fermopz

}

IvlIn = \relative do'' {

    r8 re,\solo re re re re
    \once\stemUp re fa'16 mi re8 fa16 mi re8 fa16 mi
    re8 re, re re re re

    %4
    \once\stemUp re la''16 sol fa8 la16 sol fa8 la16 sol
    \once\stemDown fa8 re, re re re re
    \once\stemUp re dod'' re dod re dod\mbreak

    %7
    re4 \once\stemUp fa,,16 la'\tu la la la la la la
    \once\stemUp sol, sib' sib sib \once\stemUp mi,, sol' sol sol sol sol sol sol
    \once\stemUp  fa, la' la la \once\stemUp re,, fa' fa fa fa fa fa fa

    %10
    \once\stemUp mi, sol' sol sol \once\stemUp dod,, mi' mi mi mi mi mi mi
    fa8 la re dod re re,
    sol16 la sib sol mi fa sol mi dod re mi dod

    %13
    sol la sib sol mi fa sol mi dod re mi dod
    la4. sol''8 fa[mi]
    fa mi16 re la4 dod\tr

    %16
    re8 do?16 sib la8 sol fa mi
    re fa16 mi re8 fa16 mi re8 fa16 mi
    re4 <<re\\\shiftOn re>> r

    %19
    R2.*3
    re16 fa la fa re fa la fa re fa la fa
    re8 sol\p sib re sol4

    %24
    r8 do,,\noBeam mi sol mi do
    r fa la[do] fa4
    r8 sib,,\noBeam re fa re sib

    %27
    r mi sol[sib] mi4
    r8 la,,\noBeam dod mi dod la
    r re fa[la] re4\mbreak

    %30
    R2.*3
    r4 mi la~
    la sold2\tr

    %35
    la4 mi mi,
    r8 si''\noBeam si si si si
    mi,8. la16 la4 sold\tr

    %38
    la2 r4
    R2.*2
    \tuplet 3/2 { si,8 do si mi[fa mi] sold la sold }

    %42
    la8. la,16 do4 si\tr
    la8 mi'\tu la mi la mi\mbreak
    fa la16 sol fa sol fa mi re mi re do

    %45
    si8 re sol re sol re
    mi sol16 fa mi fa mi re do re do si
    la8 do fa do fa do

    %48
    re fa16 mi re mi re do si do si la
    sold8 si mi si mi si
    do\p la la la la la\mbreak

    %51
    sold sold sold sold sold sold
    la la re re re re
    mi4 mi, r

    %54
    R2.*19
    r8 fa\noBeam la do fa do
    re fa re sib fa re

    %75
    sib16 la sib do sib la sib do sib do sib la
    sol8 sol' si! re sol re
    mi sol mi do sol mi\mbreak

    %78
    do16 sib do re do sib do re do re do sib
    la8 la' dod mi la mi
    fa la fa re la fa

    %81
    re4 r r
    R2.*6
    fa2.\pp

    %89
    sol
    la
    sib

    %92
    la
    re,
    la'

    %95
    la2 r4\mbreak
    R2.*3
    \tuplet 3/2 { mi'8(fa mi) la[(sib la)] dod(re dod) }

    %100
    re8. re,16 fa4 mi\tr
    re \once\stemUp fa,16 la'\tu la la la la la la
    \once\stemUp  sol,\parenthesize \f sib' sib sib \once\stemUp  mi,, sol' sol sol sol sol sol sol

    %103
    \once\stemUp fa, la' la la \once\stemUp re,, fa' fa fa fa fa fa fa
    \once\stemUp  mi, sol' sol sol \once\stemUp dod,, mi' mi mi mi mi mi mi
    fa8 la re dod re re,

    %106
    sol16 la sib sol mi fa sol mi dod re mi dod
    sol la sib sol mi fa sol mi dod re mi dod
    la4. sol''8 fa[mi]

    %109
    fa mi16 re la4 dod\tr
    re8 do?16 sib la8 sol fa mi\mbreak
    re8 fa16 mi re8 fa16 mi re8 fa16 mi

    %112
    re4 <<re\\re>> r\fermopz

}


IvlIIn = \relative do'' {

    R2.
    r8 re,\solo re re re re
    \once\stemUp re fa'16 mi re8 fa16 mi re8 fa16 mi

    %4
    re8 re, re re re re
    \once\stemUp re la''16 sol fa8 la16 sol fa8 la16 sol
    \once\stemDown fa8 re, re re re re

    %7
    re4 \once\stemUp fa16 la'\tu la la la la la la
    \once \stemUp sol, sib' sib sib \once\stemUp mi,, sol' sol sol sol sol sol sol
    \once \stemUp fa, la' la la \once \stemUp re,, fa' fa fa fa fa fa fa

    %10
    \once \stemUp mi, sol' sol sol \once \stemUp dod,, mi' mi mi mi mi mi mi
    fa8 la re dod re re,
    sol16 la sib sol mi fa sol mi dod re mi dod

    %13
    sol la sib sol mi fa sol mi dod re mi dod
    la4. sol''8 fa[mi]
    fa mi16 re la4 dod\tr

    %16
    re8 do?16 sib la8 sol fa mi
    re fa16 mi re8 fa16 mi re8 fa16 mi
    re4 re r

    %19
    R2.*24
    r8 mi'\noBeam la mi la mi
    fa la16 sol fa sol fa mi re mi re do

    %45
    si8 re sol re sol re
    mi sol16 fa mi fa mi re do re do si
    la8 do fa do fa do

    %48
    re fa16 mi re mi re do si do si la
    sold8 si mi si mi si
    do\p do do do do do

    %51
    mi mi mi mi mi mi
    mi mi fa fa fa fa
    mi4 mi, r

    %54
    R2.*19
    r8 la'\noBeam fa do la fa
    fa sib re fa sib4

    %75
    sib,,16 la sib do sib la sib do sib do sib la
    \once\stemUp sol8 si''! sol re si! sol
    sol do mi sol do4

    %78
    do,,16 sib do re do sib do re do re do sib
    \once\stemUp la8 dod'' la mi dod la
    la re fa la re4

    %81
    <fa, la, re,> r r\mbreak
    R2.*6
    la,2.\pp

    %89
    sib
    la4 fa2
    re4 sol2

    %92
    r4 mi2
    fa2.
    mi

    %95
    re4 r r
    R2.*5
    r4 \once\stemUp fa16 la'\tu la la la la la la

    %102
    \once\stemUp  sol,\f sib' sib sib \once\stemUp  mi,, sol' sol sol sol sol sol sol
    \once\stemUp fa, la' la la \once\stemUp re,, fa' fa fa fa fa fa fa
    \once\stemUp  mi, sol' sol sol \once\stemUp dod,, mi' mi mi mi mi mi mi
    fa8 la re dod re re,

    %106
    sol16 la sib sol mi fa sol mi dod re mi dod
    sol la sib sol mi fa sol mi dod re mi dod
    la4. sol''8 fa[mi]

    %109
    fa mi16 re la4 dod\tr
    re8 do?16 sib la8 sol fa mi\mbreak
    re8 fa16 mi re8 fa16 mi re8 fa16 mi

    %112
    re4 re r\fermopz

}


IvlIIIn = \relative do'' {

    R2.
    r8 re,\solo re re re re
    \once\stemUp re fa'16 mi re8 fa16 mi re8 fa16 mi

    %4
    re8 re, re re re re
    \once\stemUp re la''16 sol fa8 la16 sol fa8 la16 sol
    \once\stemDown fa8 re, re re re re

    %7
    re4 \once\stemUp fa16 la'\tu la la la la la la
    \once \stemUp sol, sib' sib sib \once\stemUp mi,, sol' sol sol sol sol sol sol
    \once \stemUp fa, la' la la \once \stemUp re,, fa' fa fa fa fa fa fa

    %10
    \once \stemUp mi, sol' sol sol \once \stemUp dod,, mi' mi mi mi mi mi mi
    fa8 la re dod re re,
    sol16 la sib sol mi fa sol mi dod re mi dod

    %13
    sol la sib sol mi fa sol mi dod re mi dod
    la4. sol''8 fa[mi]
    fa mi16 re la4 dod\tr

    %16
    re8 do?16 sib la8 sol fa mi
    re fa16 mi re8 fa16 mi re8 fa16 mi
    re4 re r

    %19
    R2.*24
    r8 mi'\noBeam la mi la mi
    fa la16 sol fa sol fa mi re mi re do

    %45
    si8 re sol re sol re
    mi sol16 fa mi fa mi re do re do si
    la8 do fa do fa do

    %48
    re fa16 mi re mi re do si do si la
    sold8 si mi si mi si
    do\p mi mi mi mi mi

    %51
    mi mi mi mi mi mi
    mi mi fa la la la
    sold4 mi, r

    %54
    R2.*19\mbreak
    r8 fa\noBeam la do fa do
    re fa re sib fa re

    %75
    sib16 la sib do sib la sib do sib do sib la
    sol8 sol' si! re sol re
    mi sol mi do sol mi\mbreak

    %78
    do16 sib do re do sib do re do re do sib
    la8 la' dod mi la mi
    fa la fa re la fa

    %81
    re4 r r
    R2.*6
    re2.\parenthesize \pp

    %89
    sol~
    sol4 fa2
    sib4 re2~

    %92
    re4 dod2\tr
    re2.
    la

    %95
    fa2 r4
    R2.*5
    r4 \once\stemUp fa16 la'\tu la la la la la la

    %102
    \once\stemUp  sol,\parenthesize \f sib' sib sib \once\stemUp  mi,, sol' sol sol sol sol sol sol
    \once\stemUp fa, la' la la \once\stemUp re,, fa' fa fa fa fa fa fa
    \once\stemUp  mi, sol' sol sol \once\stemUp dod,, mi' mi mi mi mi mi mi
    fa8 la re dod re re,

    %106
    sol16 la sib sol mi fa sol mi dod re mi dod
    sol la sib sol mi fa sol mi dod re mi dod
    la4. sol''8 fa[mi]

    %109
    fa mi16 re la4 dod\tr
    re8 do?16 sib la8 sol fa mi\mbreak
    re8 fa16 mi re8 fa16 mi re8 fa16 mi

    %112
    re4 re r\fermopz

}


Ivlan = \relative do' {

    R2.*6
    r8 la' la fa fa fa
    r sol sol mi mi mi

    %9
    r fa fa re re re
    r mi mi dod dod dod
    la4 la r

    %12
    R2.*2
    r8 dod mi mi la la\mbreak
    la sib la4 la

    %16
    <<la2\\fa>> r4
    la, la la
    la la r

    %19
    R2.*24
    r8 la' la la la la
    la4 la r

    %45
    r8 si si si si si
    sol4 sol r
    r8 la la la la la

    %48
    fa4 fa r
    r8 sold sold sold sold sold
    mi2 r4

    %51
    R2.*22
    la4 fa r
    fa fa r

    %75
    sib,16 la sib do sib la sib do sib do sib la
    sol4 sol r
    sol' sol r

    %78
    do,16 sib do re do sib do re do re do sib\mbreak
    la4 la r
    la' la r

    %81
    la r r
    R2.*6
    la,2.\pp

    %89
    sol2 dod4~
    dod re2~
    re4 mib2

    %92
    la,2.
    r4 sol'2
    mi4 la,2

    %95
    la r4
    R2.*5
    r8 la'\f la fa fa fa\mbreak

    %102
    r sol sol mi mi mi
    r fa fa re re re
    r mi mi dod dod dod

    %105
    la4 la r
    R2.*2
    r8 dod mi mi la la

    %109
    la sib la4 la
    <<la2\\fa>> r4
    la, la la

    %112
    fa fa r\fermopz

}


Ivcn = \relative do {

    R2.*6
    r8 la'\noBeam re re re re,
    r sol\noBeam do do do do,

    %9
    r fa\noBeam sib sib sib sib,
    r mi\noBeam la la la la,
    re4 re, r

    %12
    R2.*2
    r8 la' dod la dod la
    re sol la4 la,\mbreak

    %16
    re2 r4
    re re re
    re re, r
    R2.*24
    r16 la'' sold la la, la' sold la la, la' sold la
    re,4 re, r
    r16 sol' fa sol sol, sol' fa sol sol, sol' fa sol
    do,4 do, r
    r16 fa' mi fa fa, fa' mi fa fa, fa' mi fa
    si,4 si' r
    r16 mi, re mi mi, mi' re mi mi, mi' re mi
    la,2 r4
    R2.*22
    fa'4 fa, r
    sib' sib, r\mbreak
    sib16 la sib do sib la sib do sib do sib la
    sol2 r4
    do do, r
    do'16 sib do re do sib do re do re do sib
    la la' la la la la la la la la la la
    re, re' re re re re re re re re re re\mbreak
    re,4 r r
    R2.*6
    re,2.\pp
    mi
    fa
    sol
    la
    si
    dod
    re4 r r
    R2.*5
    r8 la'\f re re re re,

    %102
    r sol\noBeam do do do do,
    r fa\noBeam sib sib sib sib,
    r mi\noBeam la la la la,

    %105
    re4 re, r
    R2.*2
    r8 la' dod la dod la

    %109
    re sol la4 la,
    re2 r4
    re16 re re re re re re re re re re re

    %112
    re4 re r4\fermata

}

Imdn = \relative do'' {

    R2.*18
    \giu \stemUp la,16 \su re fa re \giu la \su re fa re \giu la \su re fa re
    \giu la \su re mi re \giu la \su re mi re \giu la \su re mi re

    %21
    \giu la \su dod mi dod \giu la \su dod mi dod \giu la \su dod mi dod
    <<fa2\\\shiftOn \stemUp re>> r4
    \stemNeutral r4 sol'8 la \mbreak sib[sol]

    %24
    \grace fa8 mi4. sib'8 la[sol]
    la4\mordent fa8 sol la fa
    \grace mi re4.\tr la'8 sol[fa]

    %27
    sol4\mordent mi8  fa sol mi
    \grace re dod4.\tr sol'8 fa[mi]
    fa16 sol fa mi\mbreak re mi re do si do si la

    %30
    sold mi sold si sold mi sold si sold mi sold si
    la mi la do la mi la do la mi la do
    si mi, si' re si mi, si' re si mi, si' re

    %33
    do si do mi do si do mi do si do mi
    re do re fa re do re fa re do re fa
    mi8. la16\mbreak la4.\tr sol16(la)

    %36
    \stemUp si8. re,16 re4.\tr do16(si)
    do8. la'16 do,4 si\tr\stemNeutral
    la8 fa' fa fa fa fa\stemUp

    %39
    r16 re mi fa r si, do re r sold, la si
    r re, mi fa \giu r si, do re r sold, la si\mbreak
    \su\stemNeutral r re' mi re sold re mi re si' re, mi re

    %42
    do8. la'16 la4.\tr sold8
    la8 mi\tu la mi la mi
    fa la16 sol fa sol fa mi re mi re do

    %45
    si8 re sol re sol re
    mi sol16 fa mi fa mi re do re do si
    la8 do fa do fa do

    %48
    re fa16 mi re mi re do si do si la
    sold8 si mi si mi si
    do8. la'16 \afterGrace la2\tr_\solo ({sold16[la)]}

    %51
    si8. mi,16 \afterGrace si'2\tr ({la16[si)]}
    do8 si16(do) re8 do si la
    la8. (sold32 fad) sold4\mordent r

    %54
    \once \override TextScript #'extra-offset = #'(0.0 . +1.0) si,16^\markup\italic "ad libitum" \startGroup  mi re mi si mi re mi si mi re mi
    do mi re mi do mi re mi do mi re mi
    si mi re mi si mi re mi si mi re mi

    %57
    do mi re mi do mi re mi do mi re mi
    la, re do re la re do re la re do re
    sib re do re sib re do re sib re do re

    %60
    la re do re la re do re la re do re
    sib re do re sib re do re sib re do re
    sol, do sib do sol do sib do sol do sib do

    %63
    la do sib do la do sib do la do sib do
    sol do sib do sol do sib do sol do sib do
    la do sib do la do sib do la do sib do\stopGroup

    %66
    fa, la do fa <<<fa do la>2\\fa,>>
    <<
        {
            fa'2.
            fa

            %69
            fa
            fa
            fa

            %72
            mi
            fa4_\tu fa \override Rest.staff-position = #-0.7 r
            re re r
        }\\{
            \stemUp \shiftOn re2.
            do
            re
            do
            re
            do
            do4 do s
            sib sib s
        }\\{
            \stemUp\shiftOnn sib2.
            la
            sib
            la
            sib
            \shiftOff sib
        }\\{
            fa2.
            fa
            fa
            fa
            fa sol
            la4 la s
            fa fa s
        }
    >>

    %75
    s2.*2
    mi4 mi r
    s2.

    %79
    s4 mi r
    <<
        {
            \senza \override TupletBracket.bracket-visibility = ##f fa fa r
            \tuplet 3/2 { r8 la^\solo fa s la fa r la fa }
        }\\{
            \senza \override TupletBracket.bracket-visibility = ##f \shiftOn\stemUp re4 re s\stemDown\shiftOff
            \tuplet 3/2 { <fa re>8 s s re' s s <fa, re> s s }
        }
    >>
    \tuplet 3/2 {

        %82
        \override TupletBracket.bracket-visibility = ##f \senza r sib sol re'\noBeam sib sol r sib sol
        \once \override Rest.staff-position = #+1 r sol mi do'\noBeam sol mi \once \override Rest.staff-position = #+1  r sol mi
        r la fa do'\noBeam la fa r la fa

        %85
        r fa re sib'\noBeam fa re r fa re\mbreak
        r sol mi sib'?\noBeam sol mi r sol mi
        r \stemUp mi\giu dod \su \stemDown la'\noBeam \stemUp mi \giu dod\su r mi\giu dod
    }

    %88
    \su \stemNeutral <<fa2_\markup\italic"Tutti piano"\\re>> r8 r16 re'
    re4(dod) r8 r16 mi
    mi4(re) r8 r16 fa

    %91
    fa4(mib) r8 r16 re\mbreak
    re4(dod) r8 r16 la'
    la8. re,16 sol4 r8 r16 sol

    %94
    sol2~sol8 fa16(mi)
    fa8. re'16 fa,4 mi
    re8 sib' sib sib sib sib

    %97
    \once \override Rest.staff-position = #+3  r16 sol la sib \once \override Rest.staff-position = #+2  r mi, fa sol \once \override Rest.staff-position = #+1  r dod, re mi
    r sol, la sib r mi, fa sol\mbreak \giu \stemUp \once \override Rest.staff-position = #+5.5 r dod, [\su re mi]
    \stemNeutral r16 sol'(la sol) dod\upl sol(la sol) mi'\upl sol,(la sol)

    %100
    fa8. re'16 re4.\tr dod8
    re4 r r
    R2.*11

}

Imsn = \relative do {

    R2.*6
    r8 la'\noBeam re re re re,
    r sol\noBeam do do do do,

    %9
    r fa\noBeam sib sib sib sib,
    r mi\noBeam la la la la,
    re4 re, r

    %12
    R2.*2
    r8 la' dod la dod la
    re sol la4 la,\mbreak

    %16
    re2 r4
    re re re
    re re, r

    %19
    <<
        {
            \shiftOn re' re re
            la la \once \override Rest.staff-position = #-2.5 r
            la la la

            %22
            la'2  r4
        }\\{
            re,, re re
            la la s
            la la la
            re16 re' \solo dod re re, re' dod re re, re' dod re
        }
    >>
    \stemDown sol, sol' fa sol sol, sol' fa sol\mbreak sol, sol' fa sol
    do, sol' mi sol do, sol' mi sol do, sol' mi sol  %%OOKK

    %25
    fa, fa' mi fa fa, fa' mi fa fa, fa' mi fa
    sib, fa' re fa sib, fa' re fa sib, fa' re fa
    mi, mi' re mi mi, mi' re mi mi, mi' re mi

    %28
    la, mi' dod mi la, mi' dod mi la, mi' dod mi
    \stemNeutral re,4 r8 re' re re
    <<mi4.\\\stemUp\shiftOn mi,4>> mi'8 mi re

    %31
    <<do4.\\\stemUp\shiftOn do,4>> do'8 do do
    sold4. sold8 sold sold
    la4 la la

    %34
    si si si
    \stemDown do16 la' mi la do, la' mi la do, la' mi la %% OK
    sold \su mi' \giu si \su mi  \giu sold, \su mi' \giu si \su mi \giu sold, \su mi' \giu si \su mi

    %37
    \giu la, \su mi' re mi \giu mi,\su mi' re mi \giu mi,\su mi' re mi\stemNeutral
    \giu la,4 r r
    \su \once\stemDown re \giu si sold

    %40
    re si sold\mbreak
    <<mi'2.\\\stemUp\shiftOn mi,>>
    la4 mi' mi,

    %43
    la16 la' sold la la, la' sold la la, la' sold la
    re,2 r4
    \stemDown sol,16 sol' fa sol sol, sol' fa sol sol, sol' fa sol

    %46
    \stemNeutral do,2 r4\mbreak
    \stemDown fa,16 fa' mi fa fa, fa' mi fa fa, fa' mi fa
    \stemNeutral si,2 r4

    %49
    \stemDown mi,16 mi' re mi mi, mi' re mi mi, mi' re mi
    \stemNeutral la,4 \clef violin <<
        {
            mi''' mi
            mi mi mi

            %52
            mi fa fa
            mi2
        }\\{\stemUp \shiftOn do4 do}\\{
            \stemDown la la
            sold sold sold
            la re re mi,2
        }
    >> r4
    sold sold' sold,

    %55
    la la' la,
    sold sold' sold,
    la la' la,

    %58
    fad fad' fad,
    sol? sol' sol,
    fad fad' fad,\mbreak

    %61
    sol sol' sol,
    mi mi' mi,
    fa fa' fa,

    %64
    mi mi' mi,
    fa fa' fa,
    \clef bass <<{la,8 la la4}\\{la,8 la la4}>> r
    <<
        {

            %67
            sib'8 sib sib4 \once \override Rest.staff-position = #-0.7 r
            do8 do do4 \once \override Rest.staff-position = #-0.7 r
            re8 re re4 \once \override Rest.staff-position = #-0.7 r

            %70
            la8 la la4 \once \override Rest.staff-position = #-0.7 r
            sib8 sib sib4 \once \override Rest.staff-position = #-0.7 r
            do8 do do4 \once \override Rest.staff-position = #-0.7 r
        }\\{
            sib,8 sib sib4 s
            do8 do do4 s
            re8 re re4 s
            la8 la la4 s
            sib8 sib sib4 s
            do8 do do4 s
        }
    >>

    %73
    fa fa, r
    sib' sib, r
    <<
        {
            sib'16 la sib do sib la sib do sib do sib la

            %76
            sol4 <re' si!> r
            do do r
            do16 sib do re do sib do re do re do sib

            %79
            la4 <dod la> r
            la la r
        }\\{
            sib,16 la sib do sib la sib do sib do sib la
            \shiftOn\stemUp  s4 sol' s
            sol sol s
            \stemDown do,16 sib do re do sib do re do re do sib
            \stemUp la4 la s
            \stemDown re \stemUp re, s
        }\\{
            s2.
            \stemUp\shiftOnn sol4 sol s
            \stemDown do \stemUp do, s
        }
    >>

    %81
    s2.
    \tuplet 3/2 {
        \override TupletBracket.bracket-visibility = ##f \senza <re'' sib>8 s s s s s <re sib> s s
        \su \stemDown <mi do> s s s s s <mi do> s s

        %84
        \giu <do la> s s s s s <do la> s s
        <re sib> s s s s s <re sib> s s
        <sib sol> s s s s s <sib sol> s s

        %87
        <dod la> s s s s s <dod la> s s
    }
    re,,16 re' dod re re, re' dod re re, re' dod re
    mi, mi' re mi mi, mi' re mi mi, mi' re mi

    %90
    fa, fa' mi fa fa, fa' mi fa fa, fa' mi fa
    sol, sol' fa sol sol, sol' fa sol sol, sol' fa sol\mbreak
    la, la' sol la la, la' sol la la, la' sol la

    %93
    si, si' la si si, si' la si si, si' la si
    dod, dod' si dod dod, dod' si dod dod, dod' si dod
    re,4 la' la,

    %96
    <<sib2\\\stemUp\shiftOn sib,>> r4
    \su\stemDown sol''' mi dod
    \giu sol mi\mbreak dod

    %99
    \stemNeutral <<la2.\\\stemUp\shiftOn la,>>
    re4 la'\tr la,
    \once\stemUp re8 la'' re\tu re re re,

    %102
    r sol do do do do,
    r fa sib sib sib sib,
    r mi la la la la,

    %105
    re4 re, r
    R2.*2
    r8 la' dod la dod la

    %109
    re sol la4 la,
    re2 r4
    re re re

    %112
    re2 r4\fermopz

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2.*6
    s8 <_+> s2
    s8 <_-> <7>2

    %9
    s4 <7>2
    s8 <7> <7 _+>2
    s2.*3

    %14
    s4 <5/>2
    s4 <4> <_+>
    s2.*16
    <8>2.
    <8>
    <8>
    s2.*44
    s4 <8>2
    s2.*21
    s8 <_+> s2
    s8 <_-> <7>2
    s4 <7>2
    s8 <7> <7_+>2
    s2.*3
    s4 <5/>2
    s4 <4> <_+>

}


forma = {

    \time 3/4
    \tempo 2 = 60
    \key do\major
    s2.*112
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

IvlIII = {
    \Iglobal
    <<\IvlIIIn \forma>>

}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Ivc = {
    \Iglobal
    \clef bass
    <<\Ivcn \forma>>

}

Imd = {
    \Iglobal
    \context Staff = up
    <<\Imdn \forma>>

}

Ims = {
    \Iglobal
    \clef bass
    \context Staff = down
    <<\Imsn \forma \Ibfn>>
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
  \override Score.BarNumber.padding = #1.4
  \override TupletBracket.bracket-visibility = ##f
  \terzine \senza
}


IIfln = \relative do'' {

    re16 mi re8 re
    re\tr dod r
    sol'16(sib) la(sol) fa(mi)

    %4
    fa8\tr \grace mi re r
    sib' la re
    re, sib'16 la sol fa

    %7
    mi la fa8.\tr (mi32 re)
    mi8 mi16 re mi8\tr
    fa4 r8

    %10
    r re16 do re8\tr
    mi4 r8
    r do16 si do8\tr \mbreak

    %13
    re16 si'32 \parentSlur (la)\mbreak sold32[(la sold fad?)] mi (fa? mi re)
    do16 mi la mi si' mi,
    \terzine\con  \tuplet 3/2 {  do'16 (si la)} do8[si\tr]

    %16
    la4.
    la16 sib la8 la
    la\tr sol r

    %19
    sib16 do sib8 sib
    sib?\tr la r
    r16 re32(do) sib[(do sib la)] sol(la sol fa)\mbreak

    %22
    mi16 do fa do sol' do,\mbreak
    \tuplet 3/2 { la'16 \parentSlur (sol fa) } la8 [sol]\tr
    fa la16 sib la8

    %25
    la\tr sol16 la sol8
    sol\tr fa16 sol la8
    la4 re8

    %28
    dod4\tr la8
    la4.~
    la~

    %31
    la4 la8
    re,4 r8
    R4.*2

    %35
    r8 re' dod\tr
    re4 r8

}


IIvlIn = \relative do'' {

    R4.*7
    r8 mi16 re mi8\tr
    \once\stemDown fa16 re, re mi fa re

    %10
    sol8 re'16 do re8\tr
    \once\stemDown mi16 do, do re mi do
    fa8 do'16 si do8_\tr

    %13
    re16 si'32 \parentSlur (la)\mbreak sold32[\parentSlur (la sold fad?)] mi \parentSlur (fa? mi re)
    do16 mi la mi si' mi,
    \terzine\con  \tuplet 3/2 {  do'16 (si la)} do8[si\tr]

    %16
    la4.
    r8 r fa,
    do' do, r

    %19
    r r sol'
    re' re, r
    r16 re''32 \parentSlur (do) sib[\parentSlur (do sib la)] sol \parentSlur (la sol fa)

    %22
    mi16 do fa do sol' do,\mbreak
    \tuplet 3/2 { la'16 \parentSlur (sol fa) } la8 [sol]\parenthesize \tr
    fa4 fa,8

    %25
    do' r dod\tr
    re re, r
    la' la, r

    %28
    r r mi''\pp
    <<{fa16 fa fa fa mi mi
       fa fa fa fa mi mi

       %31
       fa8}\\{la,16(la la la la la)
              la(la la la la la)
              la8}>> r r
    r sib,\f la
    sol16 sib'32 la sol[la sol fa] mi fa mi re

    %34
    dod16 la re la mi' la,
    \tuplet 3/2 { fa'16 (mi re) } fa8 [mi_\tr]
    re4.

}


IIvlIIn = \relative do'' {

    R4.*7
    r8 dod16 si dod8\tr
    re16 re, re mi fa re

    %10
    sol8 si16 la si8_\tr
    do16 do, do re mi do
    fa8 la16 sold la8_\tr

    %13
    re16 si'32 \parentSlur (la)\mbreak sold32[\parentSlur (la sold fad?)] mi \parentSlur (fa? mi re)
    do16 mi la mi si' mi,
    \terzine\con  \tuplet 3/2 {  do'16 (si la)} do8[si\tr]

    %16
    la4.
    R4.*4\mbreak
    r16 re32 \parentSlur (do) sib[\parentSlur (do sib la)] sol \parentSlur (la sol fa)

    %22
    mi16 do fa do sol' do,\mbreak
    \tuplet 3/2 { la'16 (sol fa) } la8 [sol] \tr
    fa4 r8

    %25
    R4.*3
    r8 r dod\pp
    re16(re re re dod dod)

    %30
    re(re re re dod dod)
    re8 r r
    r sib,\f la

    %33
    sol16 sib'32 la sol[la sol fa] mi fa mi re
    dod16 la re la mi' la,
    \tuplet 3/2 { fa'16 (mi re) } fa8 [mi_\tr]

    %36
    re4.

}


IIvlIIIn = \relative do'' {

    R4.*8
    r16 re, re mi fa re

    %10
    sol4 r8
    r16 do, do re mi do
    fa4 r8

    %13
    r16 si'32 \parentSlur (la)\mbreak sold32[\parentSlur (la sold fad?)] mi \parentSlur (fa? mi re)
    do16 mi la mi si' mi,
    \terzine\con  \tuplet 3/2 {  do'16 (si la)} do8[si\tr]

    %16
    la4.
    R4.*4\mbreak
    r16 re32 \parentSlur (do) sib[\parentSlur (do sib la)] sol \parentSlur (la sol fa)

    %22
    mi16 do fa do sol' do,\mbreak
    \tuplet 3/2 { la'16 (sol fa) } la8 [sol] \tr
    fa4 r8

    %25
    R4.*3
    r8 r la,\pp
    la16 la la la la la\mbreak

    %30
    la la la la la la
    la4 r8
    r sib,\f la

    %33
    sol16 sib'32 la sol[la sol fa] mi fa mi re
    dod16 la re la mi' la,
    \tuplet 3/2 { fa'16 (mi re) } fa8 [mi_\tr]

    %36
    re4.

}


IIvlan = \relative do' {

    R4.*7
    r8 la' la,
    r16 re re mi fa re

    %10
    sol8 sol sol,
    r16 do do re mi do
    fa8 fa fa,

    %13
    r16 fa' si,8 si'
    mi, mi mi
    mi la sold

    %16
    la4.
    R4.*4
    re,4 r8\mbreak

    %22
    sol la do
    do fa, mi
    fa4 r8

    %25
    R4.*3
    r8 r la\p
    la4.~

    %30
    la~
    la8 r r
    r sib,\f la

    %33
    \once\stemUp sol sib' sol
    mi fa la,
    la la' la

    %36
    fa4.

}


IIvcn = \relative do {

    R4.*7
    r8 la' la,
    r16 re re mi fa re

    %10
    sol4 r8
    r16 do, do re mi do
    fa4 r8

    %13
    r16 re mi8 sold,
    \once\stemUp la do' sold
    la mi' mi,\mbreak

    %16
    la4.
    R4.*4
    sib8 sib, r

    %22
    sib' la mi
    fa do' do,
    fa4 r8

    %25
    R4.*3
    r8 r la\pp
    re re la

    %30
    re re la
    re la la,
    sib\f sib la\mbreak

    %33
    sol4.~
    sol8 fa' dod
    re la' la,

    %36
    re4.

}

IImdn = \relative do'' {

    <<{fa16_\solo sol fa8 fa
       fa\tr <mi dod> r
       sol16 sib la sol fa mi

       %4
       fa8\tr \grace mi re \once \override Rest.staff-position = #-1  r
       sib' la re
       re, sib'16 la sol fa

       %7
       mi la fa8.\tr mi32 re}\\{re16 mi re8 re
                                re la s mi' dod la
                                re re, s
                                sol' re \once \override Rest.staff-position = #+2 r
                                sib16 la sol fa  mi re
                                dod8 re\giu \stemUp re,}>>
    \su mi'' mi16 re mi8\tr
    \once\stemDown fa16 re,_\tu re mi fa re

    %10
    sol8 re'16 do re8\tr
    \once \stemDown mi16 do, do re mi do\mbreak
    fa8 do'16 si do8_\tr

    %13
    re16 si'32 la sold[la sold fad] mi fa mi re
    do16 mi la mi si' mi,
    \tuplet 3/2 { do'(si la) } do8[si\tr]

    %16
    la4.
    <<{la16_\solo sib la8 la
       la\tr sol r

       %19
       sib16 do sib8 sib
       sib?\tr [la]}\\{fa16 sol fa8 fa
                     fa <mi do> s
                     sol16 la sol8 sol
                     sol [<fa re>]}>> r\mbreak
    r16 re'32 do sib[do sib la] sol la sol fa

    %22
    mi16 do fa do sol' do,\mbreak
    \tuplet 3/2 { la'16 (sol fa) } la8 [sol] \tr
    <<{fa la16_\solo sib la8

       %25
       la\tr sol16 la sol8
       sol\tr fa16 sol la re
       re16.(do32(sib la sol64 fa mi re)  mi32 [(re dod re)]

       %28
       mi4\mordent mi8_\markup\center-align\italic "Tutti"}\\{r8 fa16 sol fa8
                              fa mi16 fa mi8
                              mi re16 mi fa re
                              la4 sib8
                              la4 la8}\\{s4.*4 s4 \stemUp\shiftOn dod8}>>\mbreak
    fa32 la, re la fa'[la, re la] mi' la, dod la
    fa' la, re la fa'[la, re la] mi' la, dod la

    %31
    \tuplet 3/2 { fa'16(mi re) } fa8[mi\tr]
    re4 r8
    r16 sib32 la sol[la sol fa] mi fa mi re

    %34
    dod16 \giu la \su re \giu la \su mi'\giu la,
    \su \tuplet 3/2 { fa'16[(mi re)] } fa8[mi_\tr]
    re4.

}

IImsn = \relative do {

    s4.*7
    <<la'4\\\stemUp\shiftOn la,>> r8
    r16 re re mi fa re

    %10
    <<sol4\\\stemUp\shiftOn sol,>> r8
    r16 do do re mi do\mbreak
    <<fa4\\\stemUp\shiftOn fa,>> r8

    %13
    r16 re' mi8 sold,
    \once\stemUp la do' sold
    la\su \once\stemDown mi' \giu mi,

    %16
    la4.
    s4.*4
    <<{sib4.~

       %22
       sib8 la mi}\\{sib4.~
                     sib8 la mi}>>
    fa do' do,
    fa s s

    %25
    s4.*3
    s4 la'8\mbreak
    <<re4\\re,>> la'8

    %30
    <<re4\\re,>> la'8
    re, la' la,
    sib sib la

    %33
    sol4.~
    sol8 \stemDown fa' dod
    \stemNeutral re la' la,

    %36
    <<la'4.\\\stemUp\shiftOn fa\\{\stemDown re8 \stemUp re,4}>>

}

IIbfn = \figures {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentDown

  s4.*31
  <8>4.

}


forma = {

  \time 3/8
  \tempo 4 = 35
  \key do\major
  s4.*16
  \bar ":..:"%\break
  s4.*20
  \bar ":|."

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

IIvlIII = {
  \IIglobal
  <<\IIvlIIIn \forma>>

}

IIvla = {
  \IIglobal
  \clef alto
  <<\IIvlan \forma>>

}

IIvc = {
  \IIglobal
  \clef bass
  <<\IIvcn \forma>>

}

IImd = {
  \IIglobal
  \context Staff = up
  <<\IImdn \forma>>

}

IIms = {
  \IIglobal
  \clef bass
  \context Staff = down
  <<\IImsn \forma \IIbfn>>
  \typeset

}



IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.4
    \override TupletBracket.bracket-visibility = ##f
    \terzine \senza
}


IIIfln = \relative do'' {

    la8
    re re fa16 mi re dod
    re8 re fa16 mi re dod
    re8 re4 la8

    %4
    sib sib4 do8
    la la4 sib8
    sol sol4 la8

    %7
    fa sol16 la sib la sol fa\mbreak
    mi8 r la r
    re r la r

    %10
    re r la' r
    re r la r
    re4 r8 fa,,

    %13
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi
    fa8[sol la sib]

    %16
    mi, fa16 sol la8 la\mbreak
    re, r la' r
    re r la' r

    %19
    re4 r
    R2*7
    r4 r8 mi,

    %28
    fa fa4 sol8
    mi mi4 fa8
    re re4 mi8

    %31
    do re16 mi fa mi re do
    si8 mi mi, mi'
    re16 do si re do si la do

    %34
    si4 r
    R2*5
    r4 r8 la\mbreak

    %41
    fa'[fa fa mi16 re]
    mi8 la, re do16 si\mbreak
    do8[re mi fa]

    %44
    si, do16 re mi8 mi
    la, r si r
    do r sold' r

    %47
    la4 r
    R2*3
    r8 la si, sold'

    %52
    la4 r
    R2*29\mbreak
    r4 r8 la

    %83
    re re, re'16 do sib la
    sib8[sib sib sib]
    do do, do'16 sib la sol

    %86
    la8[la la la]
    sib sib, sib'16 la sol fa
    sol8[sol sol sol]

    %89
    la la, la'16 sol fa mi\mbreak
    fa8 fad4 sol8~
    sol sold4 la8

    %92
    re,[do si la]
    sold r si r
    mi4 r

    %95
    R2*53
    r4 r8 la
    re re, re'16 do sib la

    %150
    sib8[sib sib sib]
    do do, do'16 sib  la sol
    la8[la la la]\mbreak

    %153
    sib sib, sib'16 la sol fa
    sol8[sol sol sol]
    la la, la'16 sol fa mi

    %156
    fa4 r
    R2*2
    r4 r8 fa,

    %160
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi
    fa8[sol la sib]\mbreak

    %163
    mi, fa16 sol la8 la
    re, r la' r
    re r la' r

    %166
    re4 r8 r16 sol,,
    fa4 mi_\tr
    re2

}


IIIvlIn = \relative do'' {

    la8
    re re fa16 mi re dod
    re8 re fa16 mi re dod
    re8 re4 la8

    %4
    sib sib4 do8
    la la4 sib8
    sol sol4 la8

    %7
    fa sol16 la sib la sol fa\mbreak
    mi8 r la r
    re r la r

    %10
    re r la' r
    re r la r
    re4 r8 fa,,

    %13
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi
    fa8[sol la sib]

    %16
    mi, fa16 sol la8 la\mbreak
    re, r la' r
    re r la' r

    %19
    re4 r
    R2*7
    r4 r16 la, do la

    %28
    re, re' do re sol, si la si
    do, do' si do fa, la sold la
    si, si' la si mi, sold fad sold

    %31
    la,4 r\mbreak
    r8 do'si16(do) si(la)
    sold8 mi' mi, mi'

    %34
    re16(do) si(re) do(si) la(do)
    si8 mi mi, mi'
    mi mi, r4

    %37
    R2*3
    r4 r8 la
    fa'[fa fa mi16 re]

    %42
    mi8 la, re do16 si\mbreak
    do8[re mi fa]
    si, do16 re mi8 mi

    %45
    la, r si r
    do r sold' r
    la4 r8 mi

    %48
    fa fa4 sol8
    mi mi4 fa8
    re re4 mi8

    %51
    do la' si, sold'\mbreak
    la4 r
    R2*3

    %56
    fa8\pizz r fa r
    fa r fa r
    fa4 r

    %59
    sol8 r sol r
    sol r sol r
    sol4 r

    %62
    do8 r do r
    do r do r
    do4 r

    %65
    r sib8 r\mbreak
    sib r la r
    la r sol r

    %68
    sol r fa r
    fa r mi r
    fa4 r

    %71
    R2*2
    r4 do,
    fa8 r do' r

    %75
    fa4 r
    r re,
    sol8 r re' r

    %78
    sol4 r\mbreak
    R2*3
    r4 r8 la\f

    %83
    re re, re'16 do sib la
    sib8[sib sib sib]
    do do, do'16 sib la sol

    %86
    la8[la la la]
    sib sib, sib'16 la sol fa
    sol8[sol sol sol]

    %89
    la la, la'16 sol fa mi\mbreak
    fa8 fad4 sol8~
    sol sold4 la8

    %92
    re,[do si la]
    sold r si r
    mi4 r

    %95
    R2
    la,8\pizz r mi' r
    la4 r

    %98
    R2
    re,8 r la' r
    re4 r

    %101
    R2\mbreak
    sib8 r la r
    sib r la r

    %104
    sib4 r
    sol8 r re r
    sol r re r

    %107
    sol r la r
    sib4 r
    r sol,,

    %110
    r sol
    r sol
    r sol

    %113
    r sol\mbreak
    r sol
    r sol

    %116
    r sol
    R2*2
    r4 sol''8 r

    %120
    sol r fa r
    fa r mi r
    mi r re r

    %123
    dod4 r
    R2*4
    re8 r sib r

    %129
    mi r la, r
    <fa' la, re,>4 r\mbreak
    R2

    %132
    re,8\parenthesize \pizz[fa la la']
    sib,4 r
    sib,8[re fa fa']

    %135
    sol,4 r
    R2*12
    r4 r8 la'\f

    %149
    re re, re'16 do sib la
    sib8[sib sib sib]
    do do, do'16 sib  la sol

    %152
    la8[la la la]\mbreak
    sib sib, sib'16 la sol fa
    sol8[sol sol sol]

    %155
    la la, la'16 sol fa mi
    fa4 r
    R2*2

    %159
    r4 r8 fa,
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi

    %162
    fa8[sol la sib]\mbreak
    mi, fa16 sol la8 la
    re, r la' r

    %165
    re r la' r
    re4 r8 r16 sol,,
    fa4 <<mi\tr\\la,>>

    %168
    <<re2\\re>>

}


IIIvlIIn = \relative do'' {

    la8
    re re fa16 mi re dod
    re8 re fa16 mi re dod
    re8 re4 la8

    %4
    sib sib4 do8
    la la4 sib8
    sol sol4 la8

    %7
    fa sol16 la sib la sol fa\mbreak
    mi8 r la r
    re r la r

    %10
    re r la' r
    re r la r
    re4 r8 fa,,

    %13
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi
    fa8[sol la sib]

    %16
    mi, fa16 sol la8 la\mbreak
    re, r la' r
    re r la' r

    %19
    re4 r
    R2*7
    r4 r8 mi,

    %28
    fa fa4 sol8
    mi mi4 fa8
    re re4 mi8

    %31
    do re16 mi fa mi re do
    si8 mi mi, mi'
    re16 do si re do si la do

    %34
    si4 r
    R2*5
    r4 r8 la\mbreak

    %41
    fa'[fa fa mi16 re]
    mi8 la, re do16 si\mbreak
    do8[re mi fa]

    %44
    si, do16 re mi8 mi
    la, r mi' r
    <<{mi r mi r

       %47
       mi4}\\{do8 s si s
              do4}>> r
    re, r
    do r

    %50
    si r
    mi'8[fa fa si,]\mbreak
    do4 r

    %53
    R2*3
    re8 \pizz r do r
    re r do r

    %58
    re4 r
    mi8 r re r
    mi r re r

    %61
    mi4 r
    la8 r sol r
    la r sol r

    %64
    la4 r
    r re,8 r
    do r do r

    %67
    sib r sib r
    la r la r
    sol r sol r

    %70
    la4 r
    R2*2
    r4 do,8 r\mbreak

    %74
    fa8 r do' r
    fa4 r
    r re,
    sol8 r re' r

    %78
    sol4 r\mbreak
    R2*3
    r4 r8 la\f

    %83
    re re, re'16 do sib la
    sib8[sib sib sib]
    do do, do'16 sib la sol

    %86
    la8[la la la]
    sib sib, sib'16 la sol fa
    sol8[sol sol sol]

    %89
    la la, la'16 sol fa mi\mbreak
    fa8[la, la re]\mbreak
    si[si si mi]

    %92
    sold,[la si, re]
    mi8 r sold r
    la4 r

    %95
    R2
    la8\pizz r mi' r
    la4 r

    %98
    R2
    re,8 r la' r
    re4 r

    %101
    R2
    re,8 r re r
    re r re r

    %104
    re4 r
    <sib re,>8 r <sib re,> r
    <sib? re,>8 r <sib re,> r

    %107
    <sib? re,>8 r <fad' la, re,> r
    <sol sib, re, sol,>4 r
    sol,, r\mbreak

    %110
    sol r
    sol r
    sol r

    %113
    sol r
    sol r
    sol r

    %116
    sol r
    R2*2
    r4 sib'8 r

    %120
    la r la r
    sol r sol r
    fa r fa r

    %123
    mi4 r
    R2*4
    fa'8 r re r

    %129
    sol  r <<sol\\la,>> r
    <fa' la, re,>4 r
    R2

    %132
    re,8\parenthesize \pizz [fa la la']
    sib,4 r
    sib,8[re fa fa']

    %135
    sol,4 r
    R2*12
    r4 r8 la'\f

    %149
    re re, re'16 do sib la
    sib8[sib sib sib]
    do do, do'16 sib  la sol

    %152
    la8[la la la]\mbreak
    sib sib, sib'16 la sol fa
    sol8[sol sol sol]

    %155
    la la, la'16 sol fa mi
    fa4 r
    R2*2

    %159
    r4 r8 fa,
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi

    %162
    fa8[sol la sib]\mbreak
    mi, fa16 sol la8 la
    re, r la' r

    %165
    re r la' r
    re4 r8 r16 mi,,
    re4 dod\parenthesize _\tr

    %168
    re2

}


IIIvlIIIn = \relative do'' {

    la8
    re re fa16 mi re dod
    re8 re fa16 mi re dod
    re8 re4 la8

    %4
    sib sib4 do8
    la la4 sib8
    sol sol4 la8

    %7
    fa sol16 la sib la sol fa\mbreak
    mi8 r la r
    re r la r

    %10
    re r la' r
    re r la r
    re4 r8 fa,,

    %13
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi
    fa8[sol la sib]

    %16
    mi, fa16 sol la8 la\mbreak
    re, r la' r
    re r la' r

    %19
    re4 r
    R2*7
    r4 r8 mi,

    %28
    fa fa4 sol8
    mi mi4 fa8
    re re4 mi8

    %31
    do re16 mi fa mi re do
    si8 mi mi, mi'
    re16 do si re do si la do

    %34
    si4 r
    R2*5
    r4 r8 la\mbreak

    %41
    fa'[fa fa mi16 re]
    mi8 la, re do16 si\mbreak
    do8[re mi fa]

    %44
    si, do16 re mi8 mi
    la, r sold r
    la r re r
    do4 r
    re, r
    do r
    si r
    \once\stemUp la8[la'' si, sold']
    la4 r
    R2*3
    sib,8\pizz r la r
    sib r la r
    sib4 r
    do8 r si! r
    do r si r
    do4 r
    fa8 r mi r\mbreak
    fa r mi r
    fa4 r
    r sib8 r
    sib? r la r
    la r sol r
    sol r fa r
    fa r mi r
    fa4 r
    R2*2
    r4 do,8 r

    %74
    fa8 r do' r
    fa4 r
    r re,8 r
    sol8 r re' r

    %78
    sol4 r\mbreak
    R2*3
    r4 r8 la\f

    %83
    re re, re'16 do sib la
    sib8[sib sib sib]
    do do, do'16 sib la sol

    %86
    la8[la la la]
    sib sib, sib'16 la sol fa
    sol8[sol sol sol]

    %89
    la la, la'16 sol fa mi
    fa8 fad4 sol8~
    sol sold4 la8

    %92
    re,[do si la]
    sold r  mi' r
    mi,4 r
    R2
    la8\pizz r mi' r
    la4 r

    %98
    R2
    re,8 r la' r
    re4 r

    %101
    R2
    sib8 r la r
    sib r la r

    %104
    sib4 r
    sol8 r re r
    sol r re r

    %107
    sol r <fad la, re,> r
    <sol sib, re, sol,>4 r
    sol,, r
    sol r
    sol r
    sol r
    sol r
    sol r
    sol r
    sol r
    R2*2
    r4 <<{sol''8 r
          sol r fa r}\\{sib, s
                        la s la s}>>
    fa' r mi r\mbreak
    mi r re r
    dod4 r
    R2*4
    re8 r sib r

    %129
    mi r la, r
    <fa' la, re,>4 r\mbreak
    R2

    %132
    re,8\parenthesize \pizz[fa la la']
    sib,4 r
    sib,8[re fa fa']

    %135
    sol,4 r
    R2*12
    r4 r8 la'\f

    %149
    re re, re'16 do sib la
    sib8[sib sib sib]
    do do, do'16 sib  la sol

    %152
    la8[la la la]\mbreak
    sib sib, sib'16 la sol fa
    sol8[sol sol sol]

    %155
    la la, la'16 sol fa mi
    fa4 r
    R2*2

    %159
    r4 r8 fa,
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi

    %162
    fa8[sol la sib]\mbreak
    mi, fa16 sol la8 la
    re, r la' r

    %165
    re r la' r
    re4 r8 r16 sol,,
    fa4 mi\parenthesize _\tr

    %168
    re2

}


IIIvlan = \relative do' {

    r8 la'4 la
    fa8[la sib la]
    la[re, fa re]

    %4
    sol4 r
    fa r
    mi r

    %7
    re re
    dod la
    re la

    %10
    re8 r la' r
    re r la r
    re4 r8 fa,

    %13
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi

    %15
    fa8[sol la sib]
    mi, fa16 sol la8 la
    re, r la r

    %18
    re r la' r
    re4 r
    R2*8

    %28
    re,4 r
    do r
    si r

    %31
    la r
    mi r
    mi'8 r la r

    %34
    mi4 r
    R2*5
    r4 r8 la,

    %41
    fa'[fa fa mi16 re]
    mi8 la, re do16 si\mbreak
    do8[re mi fa]

    %44
    si, do16 re mi8 mi
    la, r mi' r
    mi r mi r

    %47
    mi4 r
    re r
    do r\mbreak

    %50
    si r
    la8[do re sold]
    mi4 r

    %53
    R2*3
    fa8\pizz r fa r
    fa r fa r

    %58
    fa4 r
    mi8 r sol r
    sol r sol r

    %61
    sol4 r
    la8 r do r
    do r do r

    %64
    do4 la8 r
    sib8 r sol r
    la r fa r

    %67
    sol r mi r
    fa r fa r
    sib, r  do r

    %70
    fa,4 r
    R2*2
    r4 do'8 r

    %74
    fa r r4
    fa,4 r
    r re'8 r

    %77
    sol r r4
    sol,4 r
    R2*4

    %83
    fa'4\f r\mbreak
    re' r
    sol, r

    %86
    do r
    fa, r
    sib r

    %89
    mi, r
    la la8 si?
    sol[mi mi mi]

    %92
    mi[mi mi la,]
    mi' r mi r
    mi4 r

    %95
    R2
    la8\pizz r la r
    la4 r\mbreak

    %98
    R2
    la8 r re, r
    re4 r

    %101
    R2
    sol,4 r
    sol r

    %104
    sol8 r re' r
    sol,4 r
    sol r

    %107
    sol8 r re' r
    sol4 r
    sol, r

    %110
    sol r
    sol r
    sol r

    %113
    sol r
    sol r
    sol r

    %116
    sol r
    sol r
    sol r

    %119
    sol'4 r
    re r
    si!8 r dod r

    %122
    re r re r
    la4 r
    R2*4

    %128
    re8 r re r
    re r dod r
    re4 r\mbreak
    R2

    %132
    re8\parenthesize \pizz[fa la la,]
    sib4 r
    sib?8[re fa fa,]

    %135
    sol4 r
    R2*13
    fa'4\f r

    %150
    re' r
    sol, r
    do r

    %153
    fa, r
    sib r
    mi, r

    %156
    la r
    R2*2
    r4 r8 fa

    %160
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi
    fa8[sol la sib]
    mi, fa16 sol la8 la

    %164
    re, r la' r
    re r la r
    re4 r8 r16 sib,

    %167
    la4 la\parenthesize _\tr
    la2

}


IIIvcn = \relative do {

    r8
    re'4 la
    sib8[fa sol la]
    re,4 r

    %4
    R2*3
    re4 sol,
    la8 r la r

    %9
    re r la r
    re r la' r
    re r la r

    %12
    re4 r8 fa,
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi

    %15
    fa8[sol la sib]
    mi, fa16 sol la8 la
    re, r la r

    %18
    re r la' r
    re4 r
    R2*8

    %28
    re,4 r
    do r
    si r

    %31
    la r
    mi r
    R2*7

    %40
    r4 r8 la'
    fa'[fa fa mi16 re]

    %42
    mi8 la, re do16 si\mbreak
    do8[re mi fa]
    si, do16 re mi8 mi

    %45
    la, r mi r
    la r mi r\mbreak
    la4 r

    %48
    r8 re si sol
    r do la fa
    r si sold mi

    %51
    la[fa re mi]
    la,4 r
    R2*3

    %56
    sib8\pizz r fa' r
    sib r fa r
    sib r r4\mbreak

    %59
    do,8 r sol' r
    do r sol r
    do r r4

    %62
    fa,8 r do' r
    fa r do r
    fa r r4

    %65
    R2*18
    \clef tenor r4 r8 re\f
    sol sol,  sol'16 fa mi re

    %85
    mi8[mi mi mi]
    \clef bass fa fa, fa'16 mi re do
    re8[re re re]

    %88
    mi mi, mi'16 re dod si
    dod8[dod dod dod]
    re4 do!8 si

    %91
    mi4 re8 do
    si[la sold fa!]
    mi4 re

    %94
    do r\mbreak
    R2
    la'4\pizz sol

    %97
    fa r
    R2
    re4 do

    %100
    sib r
    R2
    sol4 r

    %103
    sol r
    sol8 r re' r
    sol,4 r

    %106
    sol r
    sol8 r re' r
    sol4 r\mbreak

    %109
    sol, r
    sol r
    sol r

    %112
    sol r
    R2*6
    r8 sol'\p sib sol

    %120
    r re fa re
    r si'? dod la
    re4 re,

    %123
    la' r
    R2*8
    re,8\pizz [fa la la,]

    %133
    sib4 r\mbreak
    sib8[re fa fa,]
    sol4 r

    %136
    R2*13
    \clef tenor r4 r8 re''\f
    sol sol, sol'16 fa mi re

    %151
    mi8[mi mi mi]
    fa fa, fa'16 mi re do
    re8[re re re]

    %154
    mi mi, mi'16 re dod si
    \clef bass dod8[dod dod dod]
    re re, r4

    %157
    R2*2
    r4 r8 fa
    sib[sib sib la16 sol]

    %161
    la8[re, sol fa16 mi]
    fa8[sol la sib]
    mi, fa16 sol la8 la

    %164
    re, r la r
    re r la' r
    re4 r8 r16 sol,

    %167
    la4 la,
    re2

}

IIImdn = \relative do'' {

    la8
    re re fa16 mi re dod
    re8 re fa16 mi re dod
    re8 re4 la8

    %4
    <<
        {
            sib[sib sib do]
            la[la la sib]
            sol[sol sol la]

            %7
            fa sol16 la sib la sol fa
        }\\{
            r8 sol [mi do]
            r fa[re sib]
            r mi[dod \giu la]
            \shiftOn re4 re
        }
    >>
    \su mi8 r la r
    re r la r\mbreak

    %10
    <<
        {
            \stemDown\shiftOn re\upl r la'\upl r
            re\upl r la\upl r
            re4 r8
        }\\{
            \stemDown re,, r la' r
            re r la r
            re4 s8
        }
    >> fa,

    %13
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi
    fa8[sol la sib]

    %16
    mi, fa16 sol la8 la\mbreak
    re, r la' r
    <<
        {
            \stemDown\shiftOn re r la' r

            %19
            re4
        }\\{
            re,,8 r la' r
            re4
        }
    >> r8 la
    re_\solo re fa16 mi re dod
    re8 re fa16 mi re dod\mbreak

    %22
    re4 <<
        {
            r8 la
            sib[sib sib do]
            la[la la sib]

            %25
            sol[sol sol la]
        }\\{
            r16 re, fa re
            \giu \once\stemUp sol, \su sol' fa sol do, mi re mi
            \giu \once\stemUp fa,\su fa' mi fa \giu \stemDown sib, re do re
            \once\stemUp mi,\su mi' re mi\giu \stemDown la, dod si dod
        }
    >>
    \su fa8 sol16 la sib la sol fa
    mi4\tr r8 mi'

    %28
    fa[fa fa sol]
    mi[mi mi fa]
    re[re re mi]\mbreak

    %31
    do re16 mi fa mi re do
    si8 mi mi, mi'
    re16 do si re do si la do

    %34
    si mi, sold si mi mi, mi' mi,
    re' do si re do si la do
    si8 mi re16 do si la

    %37
    do si la si do8 si\tr
    la r mi' r\mbreak
    la r mi r

    %40
    la4 r8 la,\tu
    <<
        {
            fa'[fa fa mi16 re]
            mi8 la,
        }\\{
            fa[fa fa mi16 re]
            mi8\giu la,
        }
    >> re' do16 si

    %43
    \stemUp do8 [re mi fa]\stemNeutral
    si, do16 re \stemUp mi8 mi
    \stemNeutral la,16 mi' do mi sold, mi' si mi

    %46
    la, mi' do mi sold, mi' si mi
    do8 la r mi'\mbreak
    fa[fa fa sol]

    %49
    mi[mi mi fa]
    re[re re mi]
    do[la' si, sold']

    %52
    la4 r8 do,_\markup\center-align\italic"Solo"
    \stemUp fa fa \stemNeutral la16 sol fa mi
    fa8 fa la16 sol fa mi

    %55
    fa8 fa4 do8
    re16_\tu fa, re' fa, do' fa, do' fa,
    re' fa, re' fa, do' fa, do' fa,

    %58
    re'4 r8 re\mbreak
    mi16 sol, mi' sol, re' sol, re' sol,
    mi' sol, mi' sol, re' sol, re' sol,

    %61
    mi'4 r8 sol
    la16 do, la' do, sol' do, sol' do,
    \stemUp la' do, la' do, \stemNeutral sol' do, sol' do,

    %64
    la'4 do16_\solo do, do' do,
    do' re, do' re, sib' re, sib' re,
    sib' do, sib' do, la' do, la' do,

    %67
    la' sib, la' sib,\mbreak sol' sib, sol' sib,
    sol' la, sol' la, fa' la, fa' la,
    fa' sol, fa' sol, mi' sol, mi' sol,

    %70
    \stemUp fa' fa mi re do\noBeam \stemDown sib la sol
    fa\noBeam \stemUp fa mi re \giu do\noBeam \stemDown sib la sol
    fa\noBeam \stemUp fa mi re do\noBeam \stemDown sib la sol

    %73
    \su la''' do, la' do, sol' do, sol' do,
    la' do, la' do, sol' do, sol' do,
    la'4 r

    %76
    sib16 re, sib' re,\mbreak la' re, la' re,
    sib' re, sib' re, la' re, la' re,
    sib'4 r16 sib do sib

    %79
    r la sib la r la sib la
    r sol la sol r sol la sol
    r fa sol fa r fa sol fa

    %82
    <<{mi4\tr r8 \stemDown la_\markup\center-align\italic"Tutti"
       re re, re'16 do sib la
       \stemUp sib8[sib sib sib]

       %85
       do do, do'16 sib la sol
       la8[la la la]
       sib sib, sib'16 la sol fa

       %88
       sol8[sol sol sol]
       la la, la'16 sol fa mi
       fa8[fad fad sol]

       %91
       sol[sold sold la]}\\{\stemDown la,4 r
                            r r8 re,
                            sol\giu \once\stemUp sol, \su sol'16 fa mi re
                            mi8[mi mi mi]\mbreak
                            fa\giu \once\stemUp fa,\su fa'16 mi re do
                            re8[re re re]
                            mi\giu \once\stemUp mi,\su mi'16 re dod si
                            dod8[dod dod dod]
                            re4 \giu do?8 si
                            \su mi4 re8 do}>>
    re'[do si la]
    \stemUp sold16_\solo fad sold la sold si la sold

    %94
    la sold la si la do si la
    si la si do \mbreak si re do si
    do si do re dod mi re dod

    %97
    \stemNeutral re dod re mi re fa mi re
    mi re mi fa mi sol fa mi
    fa mi fa sol fad la sol fad

    %100
    sol fad sol la sol sib la sol
    la sol la sib la do sib la
    sib8 re do16 sib do la

    %103
    sib8 re do16 sib do la\mbreak
    sib la sol la sib8 la
    sol\upl_\tu  r re\upl r

    %106
    sol\upl r re\upl r
    sol16 re sol re la' re, la' re,
    sib'8 sol r4

    %109
    <<{mib8 mib4 fa8
       re8 re4 mib8
       do8 do4 re8

       %112
       sib[sib]}\\{do do4 re8
                   sib sib4 do8
                   la la4 sib8
                   sol[sol]}>> r4
    mib16 \giu sol, \su mib' \giu sol, \su mib' \giu sol, \su fa'\giu sol,\mbreak
    \su re' \giu sol, \su re' \giu sol, \su re' \giu sol, \su mib' \giu sol,

    %115
    \stemUp do sol do sol do sol re' sol,
    sib sol sib re sib sol sib re\su
    <fad mib>2

    %118
    <sol re>\stemNeutral
    sib16 sol' sib, sol'  sib, sol' sib, sol'
    la, sol' la, sol' la, fa' la, fa'

    %121
    sol, fa' sol, fa' sol, mi' sol, mi'
    fa, mi' fa, mi' fa, re' fa, re'
    <<dod4\\\stemUp\shiftOn la\\\stemDown mi>> r8 mi'\solo\mbreak

    %124
    fa16 la, mi' la, fa' la, sold' la,
    la' la, sold' la, la' la, mi' la,
    fa' la, mi' la, fa' la, sold' la,

    %127
    la' sold fa mi fa mi re dod
    re_\tu do sib la sib la sol fa
    sol fa sol mi la sol fa mi

    %130
    fa\giu la,\su la'\giu la, \su sol' \giu la, \su mi' \giu la,
    \su fa'\giu la,\su la'\giu la, \su sol' \giu la, \su mi' \giu la,
    \su fa'8 r <mi dod> r

    %133
    re4 r\mbreak
    s2*2
    <<{mib'4._\solo re8

       %137
       dod2
       re4 do?
       si!2

       %140
       do4 sib
       la2
       sib4 la8 fa'\mbreak

       %143
       sold,2}\\{sol16 sib sol sib sol sib sol sib
                 sol la sol la sol la sol la
                 fa lab fa lab fa lab fa  lab
                 fa sol fa sol fa sol fa sol
                 mib sol mib sol mib sol mib sol
                 mib fa mib fa mib fa mib fa
                 re fa re fa re fa re fa\mbreak
                 re mi re mi re mi re mi}>>
    la mi si' mi, do' mi, si' mi,
    do' mi, si' mi, do' mi, si' mi,

    %146
    do'4 la'8 la,
    <<{do4 si
       la}\\{\stemUp\shiftOn la sold
             mi}\\{\stemDown mi mi
                   dod}>> r8 la''_\markup\italic\center-align"Tutti"

    %149
    <<{re re, re'16 do sib la
       sib8[sib sib sib]
       do do, do'16 sib la sol

       %152
       la8[la la la]
       sib sib, sib'16 la sol fa\mbreak
       sol8[sol sol sol]

       %155
       la la, la'16 sol fa mi
       fa fa mi re r fa mi re
       r sol fa mi r la sol fa

       %158
       r sib la sol r dod sib la
       re4}\\{r4 r8 re,,
              sol\giu \once\stemUp sol, \su sol'16 fa mi re
              mi8[mi mi mi]
              fa\giu \once\stemUp fa, \su fa'16 mi re do
              re8[re re re]\mbreak
              mi\giu \once\stemUp mi,\su mi'16 re dod si
              dod8[dod dod dod]
              re r re_\solo r
              mi r fa r
              sol r la r
              \shiftOn sib4}>> r8 fa
    sib[sib sib la16 sol]

    %161
    la8[re, sol fa16 mi]
    fa8[sol la sib]
    mi, fa16 sol la8 la

    %164
    re, r la' r
    <<{re r la' r
       re4 r8 r16 sol,,

       %167
       fa4 mi}\\{re8 r la' r
                 re4 r8 r16 mi,
                 re4 dod}>>
    re2

}

IIImsn = \relative do {

    r8
    <<\stemDown \shiftOn re'4\\\stemDown re,>> la'
    sib8[fa sol la]
    <<la4\\\stemUp\shiftOn fa\\\stemDown re>> r

    %4
    s2*3
    re4 sol
    <dod la>8 r la\upl r

    %9
    re\upl r la\upl r\mbreak
    s2*2
    s4 s8 fa

    %13
    sib[sib sib la16 sol]
    la8 re, sol fa16 mi
    fa8[sol la sib]

    %16
    mi, fa16 sol la8 la\mbreak
    re, r la' r
    s2*2

    %20
    re4 la
    sib8[fa sol la]\mbreak
    <<la4\\\stemUp\shiftOn fa\\\stemDown re>> s

    %23
    s2*3
    re8 r sol r
    <<{la4 \override Rest.staff-position = #-2  r

       %28
       re, r
       do r
       si r}\\{la s
               \shiftOn\stemUp re, s
               do s
               si s}>>\mbreak

    %31
    la'8 r re r
    <<mi4\\\stemUp\shiftOn  mi,>> r
    mi'8 r la r

    %34
    <<mi4\\\stemUp\shiftOn  mi,>> r
    mi'8 r la r
    mi[do fa re]

    %37
    mi4 mi,
    la16 la' sold la la, la' sold la\mbreak
    la, la' sold la la, la' sold la

    %40
    la,4 r8 la'
    s2
    s4 re8 do16 si

    %43
    \stemDown do8[re\su mi fa]
    \giu si, do16 re\su mi8 mi
    \giu\stemNeutral la, r mi r

    %46
    la r mi r
    <<la4\\la,>> r
    \stemDown \su r8 re'[\giu si sol]

    %49
    r do[la fa]
    r si[sold mi]
    la[fa re mi]

    %52
    \stemNeutral la,4 r
    \su \once \stemDown fa'' \giu do
    re8[la sib do]

    %55
    <<do4\\\stemUp\shiftOn la\\\stemDown fa>> r
    sib,8 r fa' r
    sib r fa r

    %58
    sib,16 sib' la sib sol si la si\mbreak
    do,8 r sol' r
    do r sol r

    %61
    do,16 do' si do do, do' si do
    fa,8 r do' r
    \su \once\stemDown fa \once \override Rest.staff-position = #-3  r\giu do r

    %64
    fa,4 la8 r
    sib r sol r
    la r fa r

    %67
    sol r\mbreak mi r
    fa r fa, r
    sib r do r

    %70
    fa, r s4
    s2*2
    fa4\clef violin mi'''8 r

    %74
    fa r mi r
    fa4 r
    sol8 r\mbreak fad r

    %77
    sol r fad r
    <<{sol r mi r
       fa r re r

       %80
       mi r dod r
       re r re r}\\{\stemUp\shiftOn sol, r mi r
                    fa r re r
                    mi r dod r
                    re r re r}>>
    \clef bass la4 r

    %83
    s2*9
    si8[la sold fa!]
    mi si' re, si'

    %94
    do, la' do, la'
    sold\su mi' \giu sold, \su mi'
    \giu la,\su mi' \giu sol,?\su mi'

    %97
    \giu fa, la fa la
    dod, la' dod, la'
    re, la' do,? la'

    %100
    sib, re sib re
    fad, re' fad, re'
    sol,[sol' fad re]

    %103
    sol,[sol' fad re]\mbreak
    sol r re r
    sol,16 sol' fad sol sol, sol' fad sol

    %106
    sol, sol' fad sol sol, sol' fad sol
    sol,8 r <<re'\\\stemUp \shiftOn re,>> r
    sol4_8 r

    %109
    sol_8 sol_8
    sol_8 sol_8
    sol_8 sol_8

    %112
    sol_8 sol_8
    sol_8 sol_8
    sol_8 sol_8

    %115
    sol_8 sol_8
    sol_8 sol_8
    sol2_8

    %118
    sol_8
    sol4 r
    re r

    %121
    si' dod
    re re,
    la' r

    %124
    la2_8~
    la2_8~
    la2_8~

    %127
    la4_8 r
    re,8 r re' r
    re r dod r

    %130
    re r \stemDown dod r
    re r dod r
    re[fa la la,]

    %133
    <<sib'4\\\stemUp \shiftOn fa\\\stemDown sib,>> r
    <<{<re' sib>8 r <do la> r
       sib4}\\{sib,8[re fa fa,] \shiftOnn\stemUp sol4}\\{s2 \stemUp\shiftOn sol'4}>> r

    %136
    s2*8
    \stemNeutral do8[sold la sold]
    la[sold la sold]

    %146
    la4 r
    mi mi,
    la r

    %149
    s2*10
    s4 s8 fa'
    sib[sib sib la16 sol]

    %161
    la8[re, sol fa16 mi]
    fa8[sol la sib]
    mi, fa16 sol la8 la

    %164
    re, r la' r
    s2
    s4 s8 s16 sol

    %167
    la4 la,
    <<<la' fa>2\\re,>>

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 2/4
    \tempo 2 = 55
    \key do\major
    \partial 8 s8
    s2*168
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

IIIvlIII = {
    \IIIglobal
    <<\IIIvlIIIn \forma>>

}

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}

IIIvc = {
    \IIIglobal
    \clef bass
    <<\IIIvcn \forma>>

}

IIImd = {
    \IIIglobal
    \context Staff = up
    <<\IIImdn \forma>>

}

IIIms = {
    \IIIglobal
    \clef bass
    \context Staff = down
    <<\IIImsn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 18.5)


\pointAndClickOff

\paper  {

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller "Corrette - Concerto per Organo n. VI [Op. 26]"
    %subsubtitle = #(string-append " ")
    composer = \markup \center-column{"   ""M. Corrette (1707 - 1795)"}
}

\markup \huge {[1.] Allegro}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \set Staff.instrumentName = \markup \center-column{"Flauto"}
            \Ifl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
            \IvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
            \IvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup \center-column{"Violino""Terzo"}
            \IvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Alto""Viola"}
            \Ivla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup \center-column{"Violoncello"}
            \Ivc
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"church organ"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \set PianoStaff.instrumentName =  \markup \center-column{"Cimbalo""o Organo"}
                \Imd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \Ims
            >>
        >>
    >>

    \layout {

        indent = 2\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Voice
            \consists "Horizontal_bracket_engraver"
            \override HorizontalBracket.direction = #DOWN
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\markup \huge {[2.] Aria Andante}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIfl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIvc
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"church organ"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IImd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IIms
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Voice
            \consists "Horizontal_bracket_engraver"
            \override HorizontalBracket.direction = #DOWN
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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

\markup \huge {[3.] Presto}

\score {

    \new ChoirStaff \with {
        \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
    } <<

        \new Staff <<
            \set Staff.midiInstrument = #"flute"
            \IIIfl
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlI
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \IIIvlIII
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvla
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"viola"
            \IIIvc
        >>

        \new PianoStaff <<

            \set PianoStaff.midiInstrument = #"church organ"
            \new Staff = "up" \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IIImd
            >>

            \new Staff = "down"  \with {
                fontSize = #+1
                \override StaffSymbol.staff-space = #(magstep +1)
            }
            <<
                \IIIms
            >>
        >>
    >>

    \layout {

        indent = 1\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Voice
            \consists "Horizontal_bracket_engraver"
            \override HorizontalBracket.direction = #DOWN
        }
        \context {
            \Score
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            \override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #7
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
