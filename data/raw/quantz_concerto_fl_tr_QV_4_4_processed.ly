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
convert-ly (GNU LilyPond) 2.24.4  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.22.0, 2.23.1, 2.23.2, 2.23.3,
2.23.4, 2.23.5, 2.23.6, 2.23.7, 2.23.8, 2.23.9, 2.23.10, 2.23.11,
2.23.12, 2.23.13, 2.23.14, 2.24.0
%}

mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

Ifln = \relative do'' {

    sol4-! re'-! sol-! r8 re
    mi\tr re mi\tr re mi\tr re mi\tr re
    mi\tr re fad sol la re, si' re,  % inizio ripresa

    %4
    do' si4 la16 sol fad mi re8 r4
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re

    %7
    si16(do re8) re-! re-! si' re, re re
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'

    %10
    si re, do si' la do, si sol' fad mi re8 r4\mbreak
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re

    %13
    si16\f(do re8) re-! re-! si' re, re re
    si la16 sol re'8 re sol,4 r  %%%fine ripresa
    sol'16\solo la si do re8 mi16 fad sol8 sol, r re'

    %16
    do\tr si do\tr si do si do  si
    mi re fad sol la re, si' re,\mbreak
    do' si4 la16 sol fad mi re8 r4

    %19
    si16 (do re8) re-! re-! sol re re re
    si16 (do re8) re-! re-! la' re, re re
    si16(do re8) re\parenthesize -! re\parenthesize -! si' re, re re

    %22
    do'16\tu mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'
    si re, do si' la do, si sol' fad mi re8 r4

    %25
    re'4\solo la r8 si si si
    si4 la r8 si si si
    si4 la r8 la re do

    %28
    si si4 dod16 re mi fad sol fad sol fad mi re
    dod8 dod4 re16 mi fad sol la sol la sol fad mi\mbreak
    re8 re4 mi16 fad sol la sol mi fad sol fad re

    %31
    mi dod la8 r4 fad'16 (mi fad sol fad8) mi
    re la'4 sol8 fad16 (mi fad sol fad8) mi
    re la'4 sol8 fad16 la sol  la fad sol mi fad

    %34
    re mi dod re si dod la si sol sol' fad sol mi fad re mi\mbreak
    dod re si dod la si sol la fad8 la re4\tr
    re\tr re\tr re re

    %37
    re re re re
    re16 mi fad sol la fad mi re mi2\tr
    re4\tu -! la-! re-! r8 la

    %40
    si\tr la si\tr la si\tr la si\tr la
    si\tr la dod[re]\mbreak mi la, fad' la,
    sol' fad4 mi16 re dod si la8 r4

    %43
    fad16(sol la8) la-! la-! re la la la
    fad16(sol la8) la-! la-! mi' la, la la
    fad16(sol la8) la-! la-! fad' la, la la

    %46
    sol'16 si, la sol' fad la, sol fad'\mbreak mi sol, fad mi' re fad, mi re'
    dod mi, re dod' si re, dod si' la dod, si la' sol si, la sol'
    fad re mi fad sol la si dod re dod re dod re8 sol,

    %49
    fad re' mi,4 re r
    re'16\solo mi fad sol la8 si16 dod re8 re, r la'
    si\tr la si \tr la si\tr la si\tr la

    %52
    si la dod, re mi la, fad' la,
    sol' fad4 mi16 re dod si la8 r4
    re16 fad mi re la' fad mi re re' fad, mi re la' fad mi re

    %55
    re'8 do4 si16 la si si, la sol re' si la sol
    sol' si, la sol re' si la sol sol'8 fa4 mi16 re\mbreak
    mi mi re do sol' mi re do do' mi, re do sol' mi re do

    %58
    do' si la4 sol8 fad16 fad mi re la' fad mi re
    do' do, si  la la' do, si la sol sol' fad mi si' sol fad mi
    si' fa mi re si' re, do si do mi re do la' sol fad mi\mbreak

    %61
    red do si8 r si' do16 mi, la, mi' do' si la sol
    fad re la re fad la sol fad si re, sol, re' si' la sol fad
    mi do sol do mi sol fad mi la do, fad, do' la' sol fad mi

    %64
    red8 fad fad fad sol(fad) sol4\mbreak
    r8 sold sold sold la(sold) la4
    r8 lad lad lad si si,16 dod red mi fad sol

    %67
    la?8 si16 do si8 la sol4 fad\tr
    mi4\tu si8-! si-! mi si si si
    sol16(la si8) si-! si-! fad' si, si si

    %70
    sol16(la si8) si-! si-! sol' si, si si
    sol16(fad mi8) si' si mi,4 r\mbreak %% fine pagina
    mi'8\solo si' sol mi fad8 red mi4~

    %73
    mi8 si' sol mi fad red mi4~
    mi16 fad sold la si re, do si do8 si la4
    re8 la' fad re mi dod re4~

    %76
    re8 la' fad re mi dod re4~
    re16 mi fad sol la do, si la si8 la sol4\mbreak
    sol16 la si do re8 mi16 fad sol8 sol, r re'

    %79
    mi\parenthesize\tr re mi\parenthesize\tr re mi\parenthesize \tr re mi\parenthesize \tr re
    mi re fad sol la re, si' re,\mbreak
    do' si4 la16 sol fad mi re8 r4

    %82
    si16 do re8 re re sol re re re
    si16 do re8 re re la' re, re re
    si16 do re8 re re si' re, re re

    %85
    do'16\tu mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'
    si re, do si' la do, si sol' fad mi re8 r4

    %88
    sol'4\solo re r8 mi mi mi\mbreak
    mi4 re r8 mi mi mi
    mi4 re r8 re sol fa

    %91
    mi mi4 fad!16 sol la si do si do si la sol
    fad8 fad4 sol16 la si do re do re do si la
    sol8 sol4 la16 si do re do la si do si sol

    %94
    la fad re8 r4\mbreak si'16 la si do si8 la
    sol re'4 do8 si16 la si do si8 la
    sol re'4 do8 si16 re do re si do la si

    %97
    sol la fad sol mi fad re mi do do' si do la si sol la
    fad sol mi fad re mi do re si8 re sol4\tr
    sol\tr sol\tr sol sol

    %100
    sol sol sol sol
    sol16 la si do re do la sol la2
    sol4\parenthesize -! re\parenthesize -! sol\parenthesize -! r8 re

    %103
    mi\tr re mi\tr re mi\tr re mi\tr re
    mi\tr re fad sol la re, si' re,

    %105
    do' si4 la16 sol fad mi re8 r4
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re

    %108
    si16(do re8) re-! re-! si' re, re re
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'

    %111
    si re, do si' la do, si sol' fad mi re8 r4\mbreak
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re

    %114
    si16(do re8) re-! re-! si' re, re re
    si la16 sol re'8 re sol,4\fermata r

}

IvlIn = \relative do'' {

    sol4-! re'-! sol-! r8 re
    mi\tr re mi\tr re mi\tr re mi\tr re
    mi\tr re fad sol la re, si' re,

    %4
    do' si4 la16 sol fad mi re8 r4
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re

    %7
    si16(do re8) re-! re-! si' re, re re
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'

    %10
    si re, do si' la do, si sol' fad mi re8 r4\mbreak
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re

    %13
    si16\f(do re8) re-! re-! si' re, re re
    si la16 sol re'8 re sol,4 r  %%%fine ripresa
    sol'4\p fad mi si8 \once\stemDown re'

    %16
    do\tr si do\tr si do si do  si
    sol sol do [si] la re4 do16 si
    la8 re4 do16 si la4 r

    %19
    sol16(la si8) si-! si-! re si si si
    sol16(la si8) si-! si-! re la la la
    sol16(la si8) si\parenthesize -! si\parenthesize -! re si si si

    %22
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'
    si re, do si' la do, si sol' fad mi re8 r4

    %25
    fad8\p fad fad fad\mbreak fad sol sol sol
    sol sol fad fad fad sol sol sol
    sol sol fad fad fad fad fad re

    %28
    re re re re si' si si si
    mi, mi mi mi dod' dod dod dod\mbreak
    fad, fad fad fad re' mi la, re

    %31
    dod4 r re16(dod re mi re8) dod
    re4 r8 dod re16(dod re mi re8) dod
    re4 r8 dod re4 r

    %34
    fad, r sol r
    mi r fad r\mbreak
    fad16(mi fad sol fad8) mi re la'4 sol8

    %37
    fad16(mi fad sol fad8) mi re la'4 sol8
    fad re r re la'4 la,
    re\f-! la'-! re-! r8 la

    %40
    si\tr la si\tr la si\tr la si\tr la
    si\tr la dod[re]\mbreak mi la, fad' la,
    sol' fad4 mi16 re dod si la8 r4

    %43
    fad16(sol la8) la-! la-! re la la la
    fad16(sol la8) la-! la-! mi' la, la la
    fad16(sol la8) la-! la-! fad' la, la la

    %46
    sol'16 si, la sol' fad la, sol fad'\mbreak mi sol, fad mi' re fad, mi re'
    dod mi, re dod' si re, dod si' la dod, si la' sol si, la sol'
    fad re mi fad sol la si dod re dod re dod re8 sol,

    %49
    fad re' mi,4 re r
    re'\p dod si \once\stemUp fad8 la'
    sol\tr fad sol \tr fad\mbreak sol\tr fad sol \tr fad

    %52
    re re sol, fad mi la4 sol16 fad
    mi8 la4 sol16 fad mi8 la la la
    la r la r la r la r

    %55
    la la re re re r re, r
    re r re r re re sol sol\mbreak
    sol r mi r mi r mi r

    %58
    mi mi mi mi la r fad r
    fad r fad r sol r sol r
    mi' r mi r mi r mi, r

    %61
    fad si sol mi la4 r\mbreak
    re, r sol r
    do, r fad r

    %64
    si, r r8 si' si dod
    re(dod) re4 r8 dod dod red
    mi(red) mi4\tr red si8 mi

    %67
    red red mi fad\mbreak mi4 red\tr
    sol,16\f(la si8) si-! si-! mi si si si
    sol16(la si8) si-! si-! fad' si, si si

    %70
    sol16(la si8) si-! si-! sol' si, si si
    sol16(fad mi8) si' si mi,4 r\mbreak %% fine pagina
    R1*6

    %78
    sol4 fad mi si8 \once\stemDown re'
    do\parenthesize\tr si do\parenthesize\tr si do\parenthesize \tr si do\parenthesize \tr  si
    sol sol do[si] la re4 do16 si

    %81
    la8 re4 do16 si la4 r
    sol8 si si si re si si si
    sol16 la si8 si si re la la la

    %84
    sol16 la si8 si si re si si re
    do'16 \f mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'

    %87
    si re, do si' la do, si sol' fad mi re8 r4
    si'8\p si si si si do do do
    do do si si si do do do

    %90
    do do si si si si si sol
    sol sol sol sol\mbreak mi' mi mi mi
    la, la la la fad' fad fad fad

    %93
    si, si si si sol' la re, sol
    fad4 r sol16 fad sol la sol8 fad
    sol4 r8 fad sol16 fad sol  la sol8 fad\mbreak

    %96
    sol4 r8 fad sol4 r
    si, r do r
    la r  si r

    %99
    si16 la si do si8 la sol re'4 do8
    si16 la si do si8 la sol re'4 do8

    %101
    si sol r sol\mbreak re'4 re,
    sol4-! re'-! sol-! r8 re
    mi8\tr re mi\tr re mi\tr re mi\tr re

    %104
    mi\tr re fad sol la re, si' re,
    do' si4 la16 sol fad mi re8 r4
    si16\p(do re8) re-! re-! sol re re re

    %107
    si16(do re8) re-! re-! \mbreak la' re, re re
    si16(do re8) re-! re-! si' re, re re
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'

    %110
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'
    si re, do si' la do, si sol' fad mi re8 r4\mbreak
    si16\p(do re8) re-! re-! sol re re re

    %113
    si16(do re8) re-! re-! \mbreak la' re, re re
    si16(do re8) re-! re-! si' re, re re
    si la16 sol re'8 re sol,4\fermata r

}


IvlIIn = \relative do'' {

    si4-! la-! do16(si) la(si) sol8 re'
    do\tr si do\tr si do\tr si do\tr si
    sol sol do si la re4 do16 si

    %4
    la8 re4 do16 si la4 r
    sol16\p(la si8) si-! si-! re si si si
    sol16(la si8) si-! si-! re la la la

    %7
    sol16(la si8) si -! si -! re si si la
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'

    %10
    si re, do si' la do, si sol' fad mi re8 r4\mbreak
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re

    %13
    si16\f(do re8) re-! re-! si' re, re re
    si la16 sol re'8 re sol,4 r  %%%fine ripresa
    sol'4\p fad mi si

    %16
    do8 sol' do, sol' do, sol' do, sol'
    do, si la sol re'4 sol,8 sol'
    fad4 sol8 do, re4 r

    %19
    sol8 sol, sol sol sol sol sol sol
    sol' sol, sol sol'\mbreak fad fad fad fad
    sol sol, sol sol sol sol' sol la

    %22
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'
    si re, do si' la do, si sol' fad mi re8 r4\mbreak

    %25
    re8\p \repeat unfold 23 {re}
    sol, sol sol sol sol sol sol sol
    la la la la\mbreak la la la la

    %30
    si si si si si dod re re
    la'4 r re, r8 la'
    fad16(mi fad sol fad8) mi re4 r8 la'

    %33
    fad16(mi fad sol fad8) mi re4 r\mbreak
    si r mi r
    la, r re r

    %36
    r2  fad16 (mi fad sol fad8) mi
    re la'4 sol8 fad16 (mi fad sol fad8) mi
    re4 r8 re la'4 la,

    %39
    fad'4-!\f mi-! sol16(fad) mi(fad) re8 la'\mbreak
    sol\tr fad sol\tr fad sol\tr fad sol\tr fad
    re re sol fad mi la4 sol16 fad

    %42
    mi8 la4 sol16 fad mi4 r
    re16(mi fad8) fad-! fad-! la fad fad fad
    re16(mi fad8) fad-! fad-! la mi mi mi\mbreak

    %45
    re16(mi fad8) fad-! fad-! la fad fad mi
    sol'16 si, la sol' fad la, sol fad'\mbreak mi sol, fad mi' re fad, mi re'
    dod mi, re dod' si re, dod si' la dod, si la' sol si, la sol'

    %48
    fad re mi fad sol la si dod re dod re dod re8 sol,
    fad re' mi,4 re r
    re' \p dod si fad

    %51
    sol8 re' sol, re' sol, re' sol, re'
    sol, fad mi re dod4 re\mbreak
    dod re8 sol, la la sol' sol

    %54
    fad r fad r fad r fad r
    fad fad fad fad sol r si, r
    si r si \parenthesize r si si si si

    %57
    do r do r\mbreak do r do r
    do do do do re r re r
    red r red r mi r mi r

    %60
    sold r sold r la r do, r
    si si' sol mi la4 r\mbreak
    re, r sol r

    %63
    do, r fad r
    si, r r8 mi mi mi
    mid mid mid mid fad fad fad fad

    %66
    fad fad fad fad si, si' la sol\mbreak
    fad fad sol la si4 si,
    sol'16\f(la si8) si-! si-! mi si si si

    %69
    sol16(la si8) si-! si-! fad' si, si si
    sol16(la si8) si-! si-! sol' si, si si
    sol16(fad mi8) si' si \mbreak mi,4 r

    %72
    R1*6
    sol4 fad mi si
    do8 sol' do, sol' do, sol' do, sol'

    %80
    do, si la sol re'4 sol,8 sol'
    fad4 sol8 do, re4 r
    sol8 sol, sol sol sol sol sol sol

    %83
    sol' sol, sol sol' fad fad fad fad
    sol sol, sol sol sol sol' sol la
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'

    %86
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'
    si re, do si' la do, si sol' fad mi re8 r4
    sol8\p\repeat unfold 23 {sol8}\mbreak

    %91
    do, do do do do do do do
    re re re re re re re re
    mi mi mi mi mi fad sol sol,

    %94
    re'4 r sol r8 re'
    si16 la si do si8 la sol4 r8 re'\mbreak
    si16 la si do si8 la sol4 r

    %97
    mi r la r
    re, r sol r
    r2 si16 la si do si8 la

    %100
    sol re'4 do8 si16 la si do si8 la
    sol4 r8 sol re'4 re,\mbreak
    si' la do16 si la si sol8 re'

    %103
    do\tr si do\tr si do\tr si do\tr si
    sol sol do si la re4 do16 si
    la8 re4 do16 si la4 r

    %106
    sol16\p(la si8) si-! si-! re si si si
    sol16(la si8) si-! si-! re la la la
    sol16(la si8) si -! si -! re si si la

    %109
    do'16\f mi, re do' si re, do si' la do, si la' sol si, la sol'
    fad la, sol fad' mi sol, fad mi' re fad, mi re' do mi, re do'
    si re, do si' la do, si sol' fad mi re8 r4\mbreak

    %112
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re
    si16(do re8) re-! re-! si' re, re re

    %115
    si la16 sol re'8 re sol,4\fermata r

}


Ibcn = \relative do {

    sol'4-! fad-! mi-! si-!
    do8 sol' do, sol' do, sol' do, sol'
    do si la sol re'4 sol,

    %4
    fad sol8 do, re4 r
    sol8 sol,\p sol sol\mbreak sol sol sol sol
    sol' sol, sol sol' fad fad fad fad

    %7
    sol sol, sol sol sol sol' sol fad
    mi\f fad sol mi do re si dod
    re si' sol la fad sol mi fad\mbreak

    %10
    sol mi fad sol re4 r
    si16\p(do re8) re-! re-! sol re re re
    si16(do re8) re-! re-! \mbreak la' re, re re

    %13
    si16\f(do re8) re-! re-! si' re, re re
    si la16 sol re'8 re sol,4 r  %%%fine ripresa
    R1*6

    %21
    r2 r4 r8 fad'
    mi fad sol mi do re si dod
    re si' sol la fad sol mi fad\mbreak

    %24
    sol mi fad sol re4 r
    R1*14
    re4-! dod-! si-! fad-!

    %40
    sol8 re' sol, re' sol, re' sol, re'
    sol fad mi re la'4 re,
    dod4 re8 sol,\mbreak la4 r

    %43
    re8\p re, re re re re re re
    re' re, re re' dod dod dod dod

    %45
    re re, re re re re' re dod
    si\f dod re si sol la fad sold\mbreak
    la fad' re mi dod re si dod

    %48
    re dod si la si' sol fad sol
    la4 la, re r
    R1*18

    %68
    \clef tenor \key sol\major sol16(la si8) si-! si-! mi si si si
    sol16(la si8) si-! si-!  fad' si, si si
    sol16(la si8) si-! si-! sol' si, si si

    %71
    sol16(fad mi8) si' si \mbreak mi,4 r
    \clef bass \key sol\major mi4 r r8 si'\solo do la
    sol red mi4\mbreak r8 si' do la

    %74
    sold4 mi r8 la16 si do8 la
    fad dod re4 r8 la' si sol
    fad dod re4 r8 la' si sol

    %77
    fad4 re sol8 re si sol\mbreak
    R1*6
    r2 r4 r8 fad'\tu

    %85
    mi fad sol mi do re si dod
    re si' sol la fad sol mi fad
    sol mi fad sol re4 r

    %88
    R1*14
    sol4-! fad-! mi-! si-!
    do8 sol' do, sol' do, sol' do, sol'

    %104
    do si la sol re'4 sol,
    fad sol8 do, re4 r
    sol8 sol,\p sol sol\mbreak sol sol sol sol

    %107
    sol' sol, sol sol' fad fad fad fad
    sol sol, sol sol sol sol' sol fad
    mi\f fad sol mi do re si dod

    %110
    re si' sol la fad sol mi fad\mbreak
    sol mi fad sol re4 r
    si16\p(do re8) re-! re-! sol re re re

    %113
    si16(do re8) re-! re-! \mbreak la' re, re re
    si16(do re8) re-! re-! si' re, re re
    si la16 sol re'8 re sol,4\fermata r

}

forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 60
    s1*115
    \bar "|."

}


Ifl = {
    \Iglobal
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


Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma>>
}





IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIfln = \relative do'' {

    mi8  si sol' mi~mi red16 mi do8. si16
    si4 sol'4. fad16 sol la4~
    la8 sol16 la fad8. mi16 mi8 fa4 mi16 re

    %4
    do8 mi4 re16 do si sol do la re si mi do
    fad?8 sol16 do, si8 la16. sol32 fad4 r\mbreak
    sol'8 re si' sol~sol fad16 sol mi8. re16

    %7
    re4 re'4. sol,8 do4\parenthesize ~
    do8 si16 do la8. sol16 sol4 r
    fa4. sol8 mi do'4 mi,8

    %10
    re si'4 re,8 do la'4 do,8
    si sol do4. re8 si4~
    si8 do la8. sol16 fad4 re'8 sol16 si,\mbreak

    %13
    do4 la'8. do,16 si8 red fad la
    sol mi do' mi, red4 r
    mi8 si sol' mi~mi red16 mi do8. si16

    %16
    si4 sol'4. fad16 sol la4~
    la8 sol16 la fad8. mi16 mi4 r8 si
    do la'4 do,8 si sol'4 si,8\mbreak

    %19
    la fad'4 la,8 sol16 mi la fad si sol do la
    red8. mi16 fad,8. mi16 mi2

}

IIvlIn = \relative do'' {

    mi,4 r8 mi fad8. sol16 la8 re,
    sol sol16 la si8 sol la la16 si do8 la
    si mi la, si sold sold sold sold

    %4
    la sol? fad fad sol la si do~
    do8 si16 la sol8 do, re re'16 do si8 la\mbreak
    sol4 r8 sol la8. si16 do8 la

    %7
    fad re' si sol mi4 r8 la
    fad sol re' re, sol sol16 la si8 sol
    la re si sol do la la la

    %10
    si sol sol sol la fad fad fad
    sol4 r8 mi re4 r8 re
    do4 r8 do re do si sol\mbreak

    %13
    la la'16 sol fad8 mi red4 r8 red
    mi4 la r8 si16 la sol8 fad
    mi4 r8 mi fad8. sol16 la8 re,

    %16
    sol sol16 la si8 sol la la16 si do8 la
    si do la si r mi,16 fad sol8 mi
    la fad fad fad sol mi mi mi\mbreak

    %19
    fad red red red mi fad sol la
    si,2 mi



}

forma = {

    \time 4/4
    \key mi\minor
    \tempo 4 = 45
    s1*20
    \bar "|."

}


IIfl = {
    \IIglobal
    <<\IIfln \forma>>
}


IIvlI = {
    \IIglobal
    <<\IIvlIn \forma>>
}





IIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
}

IIIfln = \relative do'' {

    re4 sol,8 mi' re do
    re4 sol,8 mi' re do
    sol'4 re8 do si la

    %4
    si4. do8 si la
    si4. do8 si la
    si do re do re si

    %7
    la4 re,8 r r re'
    \once\stemDown mi8 do, si do mi re
    mi sol do mi re do\mbreak

    %10
    \once\stemDown re si, la si re do
    re sol si re do si
    \once\stemDown do la, sol la do si

    %13
    do fad la do si la
    si4. do8 si la
    si4. do8 si la

    %16
    si do re re,4 fad8
    sol\p si re do si la
    si4. do8 si la\mbreak

    %19
    si4. do8 si la
    si\f do re mi fad sol
    re,4. fad

    %22
    sol r %%% fine ripresa
    re'4\solo sol,8 mi' re do
    re4 sol,8 mi' re do

    %25
    sol'4 re8 do si la
    si4. do8 si la
    si4. do8 si la

    %28
    si do re do re si\mbreak
    la4. r4 re8\tu
    \once\stemDown mi do, si do mi re

    %31
    mi sol do mi re do
    \once\stemDown re si, la si re do
    re sol si re do si

    %34
    \once\stemDown do la, sol la do si
    do fad la do si la
    si4. do8 si la

    %37
    si4. do8 si la\mbreak
    si do re re,4 fad8
    sol re si sol4 r8

    %40
    re''4\solo sol,8 mi' re do
    re4 sol,8 mi' re do
    sol'4 re8 do si la

    %43
    si4. do8 si la
    si4. do8 si la
    si do re do re si

    %46
    la4. r4 re8\mbreak
    dod4 re8 mi4 fad8
    mi dod la fad' sol la

    %49
    mi dod la fad' sol la
    mi dod la \appoggiatura {si16[dod]} re4.
    dod4 la'8 la,4 la8

    %52
    la4.\tr~la16 si dod re mi fad
    sol4 la,8 la4 la8
    la4.\tr~la8 si16 dod re mi\mbreak

    %55
    fad4 la,8 la4 la8
    la4.\tr~ la8. si16 dod re
    mi4 sol,8 sol4 sol8

    %58
    fad la sol sol si la
    la dod si si re dod
    dod? mi re re fad mi

    %61
    mi sol fad fad la sol\mbreak
    la4 dod,8 re4 si8
    \grace re8 dod2.\tr

    %64
    re4.\tu si'8 la sol
    la4 re,8 si' la sol
    re'4 la8 sol fad mi

    %67
    fad4. sol8 fad mi
    fad4. sol8 fad mi
    fad sol la sol la fad

    %70
    mi4 la,8 r4 la'8\mbreak
    \once\stemDown si sol, fad sol si la
    si re sol si la sol

    %73
    \once\stemDown la fad, mi fad la sol
    la re fad la sol fad
    \once\stemDown sol mi, re mi sol fad

    %76
    sol dod mi sol fad mi
    fad4. sol8 fad mi
    fad4. sol8 fad mi\mbreak

    %79
    fad sol la la,4 dod8
    re la fad re4 r8
    la''4\solo re,8 si' la sol

    %82
    la4 re,8 si' la sol
    re'4 la8 sol fad mi
    fad mi re r4 r8

    %85
    re4 sol,8 mi' re do\mbreak
    re4 sol,8 mi' re do
    sol'4 re8 do si la

    %88
    si la sol r4 r8
    sol re sol si sol si
    re si re sol re sol

    %91
    mi sol mi do mi do
    sol mi sol do mi do
    la mi la\mbreak dod la dod

    %94
    mi dod mi la mi la
    fad la fad re fad re
    la fad la re fad re

    %97
    si fad si red si red
    fad red? fad si fad si
    sol si sol mi sol mi

    %100
    si mi si sol mi \once\stemDown si''
    do4.~do8. si16 la sol
    fad4 fad8 sol4 la8\mbreak

    %103
    si4.~si8. la16 sol fad
    mi4 mi8 fad4 sol8
    la4. la

    %106
    la~la8 sol fad
    sol fad sol mi4.
    fa8 mi fa red4.

    %109
    mi8 re? mi dod4.
    re8 do? re si4.
    do8 la do mi do  mi\mbreak

    %112
    la mi la do4 mi,8
    red4 si8 mi4 la8
    fad2.\tr

    %115
    mi8\tu si mi sol mi sol
    si si, do re do si
    do la do mi do mi

    %118
    la la, si do si la
    si sol si re si re\mbreak %% fine pagina
    sol sol, la si la sol

    %121
    la fad la do la do
    fad fad, sol la sol fad
    sol mi sol si sol si

    %124
    mi si mi sol mi sol
    si4. r4 mi,8
    fad4. red

    %127
    mi4 si'8\solo si4 la8\mbreak
    sold la si mi,4 sold8
    la,4 la'8 la4 sol?8

    %130
    fad sol la re,4 fad8
    sol,4 sol'8 sol4 fad8
    mi sol mi re sol re

    %133
    do sol' do, si sol' si,
    la fad re si' do re\mbreak
    la fad re si' do re

    %136
    la fad re do' la' do,
    si4\tu sol8 mi' re do
    re4 sol,8 mi' re do

    %139
    sol'4 re8 do si la
    si4. do8 si la
    si4. do8 si la

    %142
    si do re do re si\mbreak
    la4 re,8 r4 re'8\solo
    mi do si do mi re

    %145
    mi sol fad sol do mi,
    re si la si re do
    re sol fad sol si re,

    %148
    do la sol la do si
    do fad mi fad la do,\mbreak
    si la sol r4 sol'8

    %151
    fad4 sol8 la4 si8
    la fad re si' do re
    la fad re si' do re

    %154
    la fad re \appoggiatura {mi16[fad]} sol4.
    fad4 re'8 re,4 re8
    re4.\tr~re16 mi fad sol la si

    %157
    do4 re,8 re4 re8
    re4.\tr~re8 mi16 fad sol la
    si4 re,8 re4 re8

    %160
    re4.\tr~re8. mi16 fad sol
    la4 do,8 do4 do8
    si re do do mi re

    %613
    re fad mi mi sol fad\mbreak
    fad la sol sol si la
    la do si si re do

    %166
    re4 fad,8 sol4 mi8
    fad2.\tr
    sol8 fad mi re4 sol8

    %169
    si,4. la\tr
    sol4 sol8 mi' re do
    re4 sol,8 mi' re do

    %172 %ripresa
    sol'4 re8 do si la
    si4. do8 si la
    si4. do8 si la

    %175
    si do re do re si
    la4 re,8 r r re'
    \once\stemDown mi8 do, si do mi re

    %178
    mi sol do mi re do\mbreak
    \once\stemDown re si, la si re do
    re sol si re do si

    %181
    \once\stemDown do la, sol la do si
    do fad la do si la
    si4. do8 si la

    %184
    si4. do8 si la
    si do re re,4 fad8
    sol\p si re do si la

    %187
    si4. do8 si la\mbreak
    si4. do8 si la
    si\f do re mi fad sol

    %190
    re,4. fad
    sol\fermata r

}

IIIvlIn = \relative do'' {

    re4 sol,8 mi' re do
    re4 sol,8 mi' re do
    sol'4 re8 do si la

    %4
    si4. do8 si la
    si4. do8 si la
    si do re do re si

    %7
    la4 re,8 r r re'
    \once\stemDown mi8 do, si do mi re
    mi sol do mi re do\mbreak

    %10
    \once\stemDown re si, la si re do
    re sol si re do si
    \once\stemDown do la, sol la do si

    %13
    do fad la do si la
    si4. do8 si la
    si4. do8 si la

    %16
    si do re re,4 fad8
    sol\p si re do si la
    si4. do8 si la\mbreak

    %19
    si4. do8 si la
    si\f do re mi fad sol
    re,4. fad

    %22
    sol r\mbreak %%% fine ripresa
    sol4.\p do
    si do

    %25
    si la
    sol fad
    sol fad

    %28
    sol do,
    re r4 re'8\f
    \once\stemDown mi do, si do mi re

    %31
    mi sol do mi re do
    \once\stemDown re si, la si re do
    re sol si re do si

    %34
    \once\stemDown do la, sol la do si
    do fad la do si la
    si4. do8 si la

    %37
    si4. do8 si la\mbreak
    si do re re,4 fad8
    sol re si sol4 r8

    %40
    R2.*24
    la''4\parenthesize \f re,8 si' la sol
    la4 re,8 si' la sol
    re'4 la8 sol fad mi

    %67
    fad4. sol8 fad mi
    fad4. sol8 fad mi
    fad sol la sol la fad

    %70
    mi4 la,8 r4 la'8\mbreak
    \once\stemDown si sol, fad sol si la
    si re sol si la sol

    %73
    \once\stemDown la fad, mi fad la sol
    la re fad la sol fad
    \once\stemDown sol mi, re mi sol fad

    %76
    sol dod mi sol fad mi
    fad4. sol8 fad mi
    fad4. sol8 fad mi\mbreak

    %79
    fad sol la la,4 dod8
    re la fad re4 r8
    R2.*8\mbreak

    %89
    re4\p r8 r4 .
    sol4 r8 sol4 r8
    sol4 r8 r4.

    %92
    R2.
    mi4 r8 r4.
    la4 r8 la4 r8

    %95
    la4 r8 r4.
    R2.
    fad4 r8 r4.

    %98
    si4 r8\mbreak si4 r8
    si4 r8 r4.
    r r4 mi,8

    %101
    la sol la la sol la
    re4 do8 si4 la8
    sol fad sol sol fad sol

    %104
    do4 si8 la4 sol8
    fad mi fad\mbreak mi red mi
    red mi fad si,4 red8

    %107
    mi4. sol8 fad sol
    la4. si8 la si
    sold4. la8 sold la

    %110
    fad4. sold8 fad sold
    la4 r8 r4.
    r r4 la8\mbreak

    %113
    si4 la8 sol4 la8
    si4. si,

    %115
    mi'8\f si mi sol mi sol
    si si, do re do si
    do la do mi do mi

    %118
    la la, si do si la
    si sol si re si re\mbreak %% fine pagina
    sol sol, la si la sol

    %121
    la fad la do la do
    fad fad, sol la sol fad
    sol mi sol si sol si

    %124
    mi si mi sol mi sol
    si4. r4 mi,8
    fad4. red

    %127
    mi4 r8 r4.
    R2.*9
    re4\parenthesize \f sol,8  mi' re do
    re4 sol,8 mi' re do

    %139
    sol'4 re8 do si la
    si4. do8 si la
    si4. do8 si la

    %142
    si do re do re si\mbreak
    la4 re,8 r4 si8\p
    do4 r8 r4.

    %145
    do4 r8 do4 r8\mbreak
    si4 r8 r4.
    si4 r8 si4 r8

    %148
    la4 r8 r4.
    la4 r8 la4 r8
    sol4 la8 si4 sol8

    %151
    re'4 si8 la4 sol8
    re'4 r8 r4.\mbreak
    re4 r8 r4.

    %154
    re4 r8 dod4 r8
    re4. r
    r4 re'8 re,4 re8

    %157
    re4 r8 r4.
    r4 do'8 re,4 re8
    re4 r8 r4.\mbreak

    %160
    r4 si'8 re,4 re8
    re4 r8 r4 re8
    sol4 r8 la4 r8

    %163
    si4 r8 do4 r8
    re,4 r8 mi4 r8
    fad4 r8 sol4 la8

    %166
    si4 la8 si4 do8\mbreak
    re4 r8 re,4 r8
    sol4 r8 r4.

    %169
    R2.
    re'4 sol,8 mi' re do
    re4 sol,8 mi' re do
    sol'4 re8 do si la

    %173
    si4. do8 si la
    si4. do8 si la
    si do re do re si

    %176
    la4 re,8 r r re'
    \once\stemDown mi8 do, si do mi re
    mi sol do mi re do\mbreak

    %179
    \once\stemDown re si, la si re do
    re sol si re do si
    \once\stemDown do la, sol la do si

    %182
    do fad la do si la
    si4. do8 si la
    si4. do8 si la

    %185
    si do re re,4 fad8
    sol\p si re do si la
    si4. do8 si la\mbreak

    %188
    si4. do8 si la
    si\f do re mi fad sol
    re,4. fad

    %191
    sol\fermata r\mbreak %%% fine ripresa

}


IIIvlIIn = \relative do'' {


    si4. do8 si la
    si4. do8 si la
    re4 si8 la sol fad

    %4
    sol fad sol la sol fad
    sol fad sol la sol fad
    sol la si la si sol\mbreak

    %7
    fad4 re8 r4 re'8
    \once\stemDown mi8 do, si do mi re
    mi sol do mi re do\mbreak

    %10
    \once\stemDown re si, la si re do
    re sol si re do si
    \once\stemDown do la, sol la do si

    %13
    do fad la\mbreak do si la
    sol fad sol la sol fad
    sol fad sol la sol fad

    %16
    sol4 re'8 re,4 fad8
    sol\p re si' la sol fad
    sol fad sol la sol fad

    %19
    sol fad sol\mbreak la sol fad
    sol\f la si sol fad mi
    re4. fad

    %22
    sol r %% fine ripresa
    sol4.\p do
    si do

    %25
    si la
    sol fad
    sol fad

    %28
    sol do,
    re r4 re'8\f
    \once\stemDown mi do, si do mi re

    %31
    mi sol do mi re do
    \once\stemDown re si, la si re do
    re sol si re do si

    %34
    \once\stemDown do la, sol la do si
    do fad la do si la
    sol fad sol la sol fad

    %37
    sol fad sol la sol fad
    sol4 re'8 re,4 fad8
    sol re si sol4 r8\mbreak

    %40
    R2.*24
    fad''4.\parenthesize \f sol8 fad mi
    fad4. sol8 fad mi

    %66
    la4 fad8 mi re dod
    re dod re mi re dod
    re dod re mi re dod

    %69
    re mi fad mi fad re\mbreak
    do4 la8 r4 la'8
    \once\stemDown si sol, fad sol si la
    si re sol si la sol

    %73
    \once\stemDown la fad, mi fad la sol
    la re fad la sol fad
    \once\stemDown sol mi, re mi sol fad

    %76
    sol dod mi sol fad mi
    re dod re mi re dod
    re dod re mi re dod

    %79
    re4 la'8 la,4 dod8
    re la fad re4 r8
    R2.*8

    %89
    si4\p r8 r4 r8
    si4 r8 si4 r8\mbreak
    do4 r8 r4.

    %92
    R2.
    dod4 r8 r4.
    dod4 r8 dod4 r8

    %95
    re4 r8 r4.
    R2.
    red4 r8 r4.

    %98
    red4 r8 red4 r8
    mi4 r8 r4.\mbreak
    r r4 mi8

    %101
    la sol la la sol la
    re4 do8 si4 la8
    sol fad sol sol fad sol

    %104
    do4 si8 la4 sol8
    fad mi fad mi red mi
    red mi fad si,4 red8

    %107
    mi4. sol8 fad sol
    la4. si8 la si
    sold4. la8 sold la

    %110
    fad4. sold8 fad sold
    la4 r8 r4.
    r r4 la8

    %113
    si4 la8 sol4 la8
    si4. si,\mbreak


    %115
    mi'8\f si mi sol mi sol
    si si, do re do si
    do la do mi do mi

    %118
    la la, si do si la
    si sol si re si re\mbreak %% fine pagina
    sol sol, la si la sol

    %121
    la fad la do la do
    fad fad, sol la sol fad
    sol mi sol si sol si

    %124
    mi si mi sol mi sol
    si4. r4 mi,8
    fad4. red

    %127
    mi4 r8 r4.
    R2.*9
    si4.\parenthesize \f  do8 si la

    %138
    si4. do8 si la
    re4 si8 la sol fad
    sol fad sol la sol fad

    %141
    sol fad sol la sol fad
    sol la si la si sol\mbreak
    fad4 re8 r4 si8\p
    do4 r8 r4.

    %145
    do4 r8 do4 r8\mbreak
    si4 r8 r4.
    si4 r8 si4 r8

    %148
    la4 r8 r4.
    la4 r8 la4 r8
    sol4 la8 si4 sol8

    %151
    re'4 si8 la4 sol8
    re'4 r8 r4.\mbreak
    re4 r8 r4.

    %154
    re4 r8 dod4 r8
    re4. r
    r4 re'8 re,4 re8

    %157
    re4 r8 r4.
    r4 do'8 re,4 re8
    re4 r8 r4.\mbreak

    %160
    r4 si'8 re,4 re8
    re4 r8 r4 re8
    sol4 r8 la4 r8

    %163
    si4 r8 do4 r8
    re,4 r8 mi4 r8
    fad4 r8 sol4 la8

    %166
    si4 la8 si4 do8\mbreak
    re4 r8 re,4 r8
    sol4 r8 r4.

    %169
    R2.
    si4. do8 si la
    si4. do8 si la

    %172
    re4 si8 la sol fad
    sol fad sol la sol fad
    sol fad sol la sol fad

    %175
    sol la si la si sol\mbreak
    fad4 re8 r4 re'8
    \once\stemDown mi8 do, si do mi re

    %178
    mi sol do mi re do\mbreak
    \once\stemDown re si, la si re do
    re sol si re do si

    %181
    \once\stemDown do la, sol la do si
    do fad la\mbreak do si la
    sol fad sol la sol fad

    %184
    sol fad sol la sol fad
    sol4 re'8 re,4 fad8
    sol\p re si' la sol fad

    %187
    sol fad sol la sol fad
    sol fad sol\mbreak la sol fad
    sol\f la si sol fad mi

    %190
    re4. fad
    sol \fermata r %% fine ripresa

}


IIIbcn = \relative do {

    sol'4. do,
    sol' do,
    si4 sol'8 do,4 re8

    %4
    sol,4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8
    sol,4. do

    %7
    re4 re'8\mbreak si4 sol8
    do4. r
    do do

    %10
    si r
    si si
    la r

    %13
    la fad
    sol,4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8\mbreak

    %16
    sol4 si8 re4 re,8
    sol,4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8

    %19
    sol,4 sol'8 do,4 re8
    sol4. do,
    re re,

    %22
    sol r\mbreak %% fine ripresa
    R2.*6
    r4 re''8 si4 sol8

    %30
    do4. r
    do do
    si r

    %33
    si si
    la r
    la fad

    %36
    sol,4 sol'8\mbreak do,4 re8
    sol,4 sol'8 do,4 re8
    sol4 si8 re4 re,8

    %39
    sol4. r
    sol\solo do
    si do

    %42
    si la
    sol fad\mbreak
    sol fad

    %45
    sol do,
    re4 mi8 fad4 re8
    la'4 fad8 mi4 re8

    %48
    la4. r
    la r
    la sold\mbreak

    %51
    la r
    r4 la'8 la,4 la8
    la4. r

    %54
    r4 sol'8 la,4 la8
    la4. r
    r4 fad'8 la,4 la8

    %57
    la4. r4 la8
    re4. mi\mbreak
    fad sol

    %60
    la, si
    dod re4 mi8
    fad4 mi8 fad4 sol8

    %63
    la4. la,
    re'\tu sol,
    re' sol,

    %66
    fad4 re'8 sol,4 la8
    re,4 re'8 sol,4 la8
    re,4 re'8 sol,4 la8\mbreak

    %69
    re,4. sol,
    la4 la'8 fad4 re8
    sol4. r

    %72
    sol sol
    fad r
    fad fad

    %75
    mi r
    mi dod
    re4 re'8 sol,4 la8

    %78
    re,4 re'8 sol,4 la8
    re,4 fad8 la4 la,8
    re4. r\mbreak

    %81
    re\solo sol
    fad sol
    fad mi

    %84
    re4 do8 si4 la8
    sol4. do
    si do

    %87
    si la
    sol r
    R2.*26

    %115
    mi'4\tu r8 r4.
    sold sold\mbreak
    la r

    %118
    fad fad
    sol r
    mi mi

    %121
    fad r
    red red
    mi4 r8 r4.

    %124
    r4 r8 r4 mi8
    red8 mi fad si,4 sol8
    la4.\mbreak si

    %127
    mi,4 r8 r4.
    mi''4\solo r8 re4 r8
    dod4 r8 r4.

    %130
    re4 r8 do!4 r8
    si4 r8 r4.
    do4 r8 si4 r8

    %133
    la4 r8 sol4 r8
    re4 r8 r4.\mbreak
    re4 r8 r4.

    %136
    re4 r8 fad4 r8
    sol4.\tu do,
    sol' do,

    %139
    si4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8

    %142
    sol,4. do
    re4 r8 r4.
    R2.*24

    %168
    sol4\solo la8 si4 sol8
    re'4. re,
    sol4. do,

    %171
    sol' do,
    si4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8

    %174
    sol,4 sol'8 do,4 re8
    sol,4. do
    re4 re'8\mbreak si4 sol8

    %177
    do4. r
    do do
    si r

    %180
    si si
    la r
    la fad

    %183
    sol,4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8\mbreak
    sol4 si8 re4 re,8

    %186
    sol,4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8
    sol,4 sol'8 do,4 re8

    %189
    sol4. do,
    re re,
    sol\fermata r\mbreak %% fine ripresa

}

forma = {

    \time 6/8
    \key sol\major
    \tempo 2. = 67
    s2.*191
    \bar "|."

}


IIIfl = {
    \IIIglobal
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


IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma>>
}

\pointAndClickOff

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {
        systems-per-page = #4
    }


    \header {
        title = \markup \smaller "Concerto a 4 [QV 4: 4]"
        composer = \markup \center-column{"J. J. Quantz (1697-1773)"}
    }

    \markup\huge "[1.] Allegro"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Flauto""Traverso"}
                \set Staff.shortInstrumentName = "fl"
                \set Staff.midiInstrument = #"flute"
                \Ifl
            >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlI"
                    \IvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlII"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm
            #(layout-set-staff-size 17.5)

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

}

\bookpart {

    \paper {
        systems-per-page = #6
    }

    \markup\huge "[2.] Adagio"

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Flauto""Traverso"}
                \set Staff.shortInstrumentName = "fl"
                \set Staff.midiInstrument = #"flute"
                \IIfl
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef bass \key sol\major \time 4/4 mi4 ^\markup\center-align "[Violini unisoni]" r8 mi}
                \clef violin
                \set Staff.midiInstrument = #"violin"
                \set Staff.shortInstrumentName = "vlI"
                \IIvlI
            >>
        >>

        \layout {

            indent = 2.5\cm
            #(layout-set-staff-size 18.5)

            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #4
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

}

\bookpart {

    \paper {
        systems-per-page = #4
    }

    \markup\huge "[3.] Presto"

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        } <<

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{"Flauto""Traverso"}
                \set Staff.shortInstrumentName = "fl"
                \set Staff.midiInstrument = #"flute"
                \IIIfl
            >>

            \new PianoStaff
            <<
                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Primo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlI"
                    \IIIvlI
                >>

                \new Staff
                <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""Secondo"}
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.shortInstrumentName = "vlII"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column\smaller{"Basso"}
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.shortInstrumentName = "bc"
                \IIIbc
            >>
        >>

        \layout {

            indent = 2\cm
            #(layout-set-staff-size 17.5)

            \context {
                \PianoStaff
                \consists #Span_stem_engraver
            }
            \context {
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override BarLine.hair-thickness = #1.2
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.common-shortest-duration =
                #(ly:make-moment 1/8)
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

}
