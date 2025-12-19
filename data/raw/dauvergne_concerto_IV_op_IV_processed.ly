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

%{
convert-ly (GNU LilyPond) 2.24.2  convert-ly: Processing `'...
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
    \senza
}

IvlIn = \relative do'' {

    la4. \tuplet 3/2 { si16 dod re } mi4 mi,8. sol16
    fad4. \tuplet 3/2 { la16 si dod} re4 re,8. fad16
    mi4 dod'8. dod16 si8. dod32 re mi4~

    %4
    mi8. fad,16 re'8. [re16] dod8. re32 mi fad4~\mbreak
    fad8. sold,16 mi'8. [mi16] mi8. fad,16 re'8. [re16]
    re8. mi,16 dod'8. [dod16] dod8. re32 dod si8.-+ la16

    %7
    sold4 si'8. si16 si4.  \tuplet 5/4 { la32 sold fad mi re }
    dod4 dod'8. dod16 dod4. \tuplet 5/4 { si32 la sold fad mi }
    red4-+ si8. (red16) dod8.(mi16) red8.[(fad16)]

    %10
    mi4 fad8.(sold32 la) sold8.[fad16 mi8.-+ red16]\mbreak
    mi2~mi4 red8.\p red16
    dod4(si) dod(la)

    %13
    si1 si
    \repeat unfold 12 {la16}
    \repeat unfold 8 {si16} dod dod dod dod

    %16
    re re re re dod dod dod dod si si si si\mbreak
    la la, la la la la la la la4
    mi'' 16\repeat unfold 11 {mi}

    %19
    \repeat unfold 8 {fad} sold sold sold sold
    la la la la sold sold sold sold  fad fad fad fad
    mi mi, mi mi mi mi  mi mi mi4\mbreak

    %22
    la16 la' la la la \repeat unfold 11 {la16}
    sold sold sold sold la la la la
    fad fad fad fad mi mi mi mi re re re re

    %25
    \once\stemDown dod la, la la la la la la la4
    dod''16(si la ) la-! la\f la la la la la la la\mbreak
    dod(si la ) la-! la\p la la la la la la la

    %28
    si(la sold) sold-! sold\f \repeat unfold 7 {sold}
    si(la sold) sold-! sold\p \repeat unfold 7 {sold}
    la(sold fad) fad-! fad\f \repeat unfold 7 {fad}

    %31
    la(sold fad) fad-! fad\p \repeat unfold 7 {fad}\mbreak
    sold(fad mi) mi-! mi\f \repeat unfold 7 {mi}
    sold(fad mi) mi-! mi\p \repeat unfold 7 {mi}

    %34
    dod'\f dod dod dod dod dod dod dod si si si si
    la la la la la la la la sold sold sold sold
    fad fad fad fad fad fad fad fad mi mi mi mi\mbreak

    %37
    \once\stemDown red si, si si si si si si si4
    si''16\p(la si dod) si(la si dod) si(la si dod)
    si8-!\f sold-! mi-! si-! si,4

    %40
    la''16\p(sold la si) la(sold la si) la(sold la si)
    la8-!\f fad-! red-! si-! si,4
    sol''16\p(fad sol la sol fad sol la sol fad sol la\mbreak

    %43
    sol\pp fad sol la sol fad sol la sol fad sol la
    sol fad sol la sol fad sol la sol fad sol la)
    fad4-! si,-! r

    %46
    mi\p-! sold? (fad-+)
    mi-! si'(la)
    sold-! mi'(red-+)

    %49
    mi2.\fermata
    dod16\f(si dod) mi,-! si'(la si) mi,-! la(sold la) red,-!\mbreak
    sold4 fad-+ mi

    %52
    fad8. la16 sold4 fad-+
    mi2.
    mi16\f \repeat unfold 11 {mi16}

    %55
    \repeat unfold 12 {fad}
    \repeat unfold 12 {sold}
    la la, la la la la la la la4\mbreak

    %58
    dod'16\p \repeat unfold 11 {dod}
    \repeat unfold 12 {si}
    \repeat unfold 12 {la16}

    %61
    \once\stemDown sold dod,, dod dod dod dod dod dod dod4
    dod''16\p(si dod re) dod(si dod re) dod(si dod re)
    dod8-!\f la-! fad-! dod-! dod,4

    %64
    si''16\p(la si dod) si(la si dod) si(la si dod)
    si8-!\f sold-! mid-! dod-! dod,4
    fad'16 fad,\p fad fad fad fad fad fad fad fad fad fad

    %67
    fad' fad, fad fad fad fad fad fad fad fad fad fad
    fad' fad, fad fad fad fad fad fad fad fad fad fad\mbreak
    fad'2.\fermata

    %70
    si16\f si si si la la la la sold sold sold sold
    fad fad fad fad mid mid mid mid fad fad fad fad
    sold8. si16 la4 sold-+

    %73
    fad2.
    dod4\p(mi re-+)
    dod( mi re-+)

    %76
    dod(mi dod-+)
    \once\stemDown re16 si,\f si si si si si si si4\mbreak
    si'4\p(re dod-+)

    %79
    si(re dod-+)
    si(re si-+)
    \once\stemDown dod16 la,\f la la la la la la la4

    %82
    la'16\repeat unfold 11 {la}
    si si si si si si si si dod dod dod dod
    re re re re re re re re mi mi mi mi\mbreak

    %85
    \once\stemDown fad re, re re re re re re re4
    si'16 \repeat unfold 11 {si}
    dod \repeat unfold 7 {dod} red red red red

    %88
    mi mi mi mi mi mi mi mi fad fad fad fad
    \once\stemDown sold mi, mi mi mi mi mi mi mi4\mbreak
    mi'16(re mi fad) mi(re mi fad) mi(re mi fad)

    %91
    mi8-! dod-! la-! mi-! dod4
    re'16(dod re mi) re(dod re mi) re(dod re mi)
    re8-! si-! sold-! mi-! si4

    %94
    do''16\p(si do re do si do re do si do re
    do?\pp si do re do si do re do si do re
    do? si do re do si do re do si do re)

    %97
    si4-! mi,-! r
    la,-!\p dod(si-+)
    la-! mi'(re-!)

    %100
    dod-! la'(sold-+)
    la2.\fermata
    fad16\f(mi fad) la,-! mi'(re mi) la,-! re(dod re) sold,-!

    %103
    dod4(si-+ la)\mbreak
    si8. re16 dod4 si-+
    la2 si~

    %106
    si4 mi, la2~
    la4 sold mi'2~
    mi4. \tuplet 5/4 { fad,32(sold la si dod) } re2~

    %109
    re4. \tuplet 5/4 { mi,32(fad sold la si) } dod2
    si~si-+
    la1

}

IvlIIn = \relative do'' {

    la4. \tuplet 3/2 { si16 dod re } mi4 mi,8. sol16
    fad4. \tuplet 3/2 { la16 si dod} re4 re,8. fad16
    mi4 dod'8. dod16 si8. dod32 re mi4~

    %4
    mi8. fad,16 re'8. [re16] dod8. re32 mi fad4~\mbreak
    fad8. sold,16 mi'8. [mi16] mi8. fad,16 re'8. [re16]
    re8. mi,16 dod'8. [dod16] dod8. re32 dod si8.-+ la16

    %7
    sold4 si'8. si16 si4.  \tuplet 5/4 { la32 sold fad mi re }
    dod4 dod'8. dod16 dod4. \tuplet 5/4 { si32 la sold fad mi }
    red4-+ si8. (red16) dod8.(mi16) red8.[(fad16)]

    %10
    mi4 fad8.(sold32 la) sold8.[fad16 mi8.-+ red16]\mbreak
    mi4 sold,8.\p sold16 la4 si8. sold16
    la4(sold) la(fad)

    %13
    sold1 sold
    \repeat unfold 12 {la16}
    \repeat unfold 8 {si16} dod dod dod dod

    %16
    re re re re dod dod dod dod si si si si\mbreak
    la la, la la la la la la la4
    r mi''16 mi mi mi  mi mi mi mi

    %19
    mi mi mi mi red red red red mi  mi mi mi
    <<
        {
            mi mi mi mi mi mi mi mi red red red red
            mi
        }\\{
            dod dod dod dod si si si si la la la la
            sold mi mi mi
        }
    >> mi mi mi mi mi4

    %22
    \repeat unfold 12 {dod16}
    re re re re re re re re dod dod dod dod
    la la la la la la la la sold sold sold sold

    %25
    la la la la la la la la la4
    mi''16(re dod) dod-! dod\f dod dod dod dod dod dod dod
    mi(re dod) dod-! dod\p dod dod dod dod dod dod dod

    %28
    sold'(fad mi) mi-! mi\f mi mi mi mi mi mi mi
    sold(fad mi) mi-! mi\p mi mi mi mi mi mi mi
    fad(mi red) red-! red\f red red red red red red red

    %31
    fad(mi red) red-! red\p red red red red red red red
    si(la sold) sold-! sold\f sold sold sold sold sold sold sold\mbreak
    si(la sold) sold-! sold\p sold sold sold sold sold sold sold

    %34
    mi'16\f \repeat unfold 11 {mi}
    red red red red red red red red mi mi mi mi
    si si si si si si si si lad lad lad lad

    %37
    si si, si si si si si si si4\mbreak
    sold''16\p(fad sold la) sold(fad sold la) sold(fad sold la)
    sold8-!\f mi-! si-! sold-! si,4

    %40
    fad''16\p(mi fad sold) fad(mi fad sold) fad(mi fad sold)
    fad8-! \f red?-! si-! fad-! si,4
    mi'-.\p(mi-. mi-.)

    %43
    mi\pp-. (mi-. mi-.)
    mi-.(mi-. mi-.)
    mi-! re-! r

    %46
    R2.\mbreak
    <mi sold,>4 sold(fad-+)
    mi si'(la-+)

    %49
    sold2.\fermata
    mi,4\f mi red
    mi la sold

    %52
    fad8. fad'16 mi4 red-+
    mi2.
    sold,16\f \repeat unfold 11 {sold}

    %55
    \repeat unfold 12 {la}
    \repeat unfold 12 {si}
    dod la la la la la la la la4

    %58
    la'16\p \repeat unfold 11 {la}
    la la la la  \repeat unfold 8 {sold}
    sold sold sold sold fad fad fad fad fad fad fad fad\mbreak

    %61
    \once\stemDown mid dod, dod dod dod dod dod dod dod4
    la''16\p(sold la si) la(sold la si) la(sold la si)
    la8\f -! fad-! dod-! la-! dod,4

    %64
    sold''16\p( fad sold la) sold(fad sold la) sold(fad sold la)
    sold8-! mid-! dod-! sold-! dod,4
    fad 16 fad\p \repeat unfold 10 {fad16}\mbreak

    %67
    sold sold sold sold sold sold sold sold la la la la
    si si si si la la la la la la la la
    fad2.\fermata

    %70
    mid16 mid mid mid fad fad fad fad sold sold sold sold
    la la la la sold sold sold sold fad fad fad fad
    fad4 fad mid-+

    %73
    fad2.\mbreak
    lad4\p(dod si)
    lad(dod si)

    %76
    lad(dod lad-+)
    si16 si,\f si si si si si si si4
    sold'4\p(si la)

    %79
    sold(si la)
    sold(si sold-+)
    la16 la,\f la la la la la la la4

    %82
    \repeat unfold 12 {dod16}\mbreak
    re re re re re re re re mi mi mi mi
    fad fad fad fad fad fad fad fad sol sol sol sol

    %85
    fad re re re re re re re re4
    \repeat unfold 12 {red16}
    mi mi mi mi  mi mi mi mi fad fad fad fad

    %88
    sold ? sold sold sold sold sold sold sold la la la la\mbreak
    sold mi mi mi mi mi  mi mi mi4
    dod'16(si dod re) dod(si dod re) dod(si dod re)

    %91
    dod8-! la-! mi-! dod-! la4
    si'16(la si dod) si(la si dod) si(la si dod)
    si8-! sold-! mi-! la,-! sold4

    %94
    la''4-.\p(la-. la-.)
    la\pp-.(la-. la-.)
    la-.(la-. la-.)

    %97
    la-! sold-! r\mbreak
    R2.
    <la, dod,>4-! dod(si-+)

    %100
    la-! mi'(re-+)
    dod2.\fermata
    la4\f la sold

    %103
    la re, dod
    si8. si'16 la4 sold-+
    fad2 mi4 re

    %106
    dod2 dod
    si la'~
    la la

    %109
    sold la~
    la sold-+
    la1

}

Ivlan = \relative do' {

    mi2 dod
    re si
    dod4 la'2 sold4

    %4
    fad si2 la4
    sold2 fad
    mi fad

    %7
    si,2. <si' sold>8. <si sold>16\mbreak
    mi,2. <dod' la>8. <dod la>16
    fad,4 red8. red16 mi4 fad

    %10
    si, dod si la
    sold mi'8.\p mi16 fad4 sold8. mi16
    la,4 mi' la la,

    %13
    mi'1 mi
    r4 la16 la la la la la la la
    <<
        {
            la la la la sold sold sold sold la la la la

            %16
            re,4 mi mi
        }\\{
            re16 re re re re re re re dod dod dod dod
            si4 mi mi
        }
    >>
    la,2.
    R

    %19
    la'16 la la la la la la la sold sold sold sold
    fad4 si si,
    mi2.

    %22
    mi2 la4
    fad mi mi
    re mi mi

    %25
    mi2.
    la4-! la-! la-!
    la-! la-! la-!\mbreak

    %28
    mi-! mi-! mi-!
    mi-! mi-! mi-!
    si-! si-! si-!

    %31
    si-! si-! si-!
    mi-! mi-! mi-!
    mi-! mi-! mi-!

    %34
    mi16\f \repeat unfold 11 {mi}
    \repeat unfold 12 {si}
    si si si si si si si si dod dod dod dod\mbreak

    %37
    <<{fad fad fad fad fad fad fad fad fad4}\\{red16 red red red red red red red red4}>>
    R2.
    si'16 si, si si si si si si si4

    %40
    R2.
    si'16 si, si si si si si si si4
    si4-.\p(si-. si-.)

    %43
    do-.\pp(do-. do-.)
    dod!-.(dod-. dod-.)
    si-! si-! r\mbreak

    %46
    mi16\f mi mi mi mi mi mi mi si si si si
    mi mi mi mi mi mi mi mi si si si si
    mi mi mi mi mi mi mi mi si si si si

    %49
    dod2.\fermata
    fad4 sold si,
    si si si

    %52
    dod si la
    sold2.\mbreak
    mi'16 mi mi mi mi mi mi mi mi mi mi mi

    %55
    mi mi mi mi mi mi mi mi mi mi mi mi
    re! \repeat unfold 11 {re}
    dod dod dod dod dod dod dod dod dod4

    %58
    mi16 \p \repeat unfold 11 {mi16}\mbreak
    mi mi mi mi mi mi mi mi dod dod dod dod
    \repeat unfold 12 {dod}

    %61
    dod dod dod dod dod dod dod dod dod4
    R2.
    dod'16\f dod, dod dod dod dod dod dod dod4

    %64
    R2.
    dod'16 dod, dod dod dod dod dod dod dod4
    dod16 dod\p \repeat unfold 10 {dod16}

    %67
    re re re re re re re re dod dod dod dod
    si si si si dod dod dod dod re re re re
    dod2.\fermata

    %70
    dod4 dod dod
    dod4 dod dod
    re dod si

    %73
    la2.\mbreak
    fad'16\f fad fad fad fad fad fad fad si, si si si
    fad' fad fad fad fad fad fad fad si, si si si

    %76
    fad'\repeat unfold 11 {fad}
    si si, si si si si si si si4
    mi16 mi mi mi mi mi mi mi la, la la la\mbreak

    %79
    mi' mi mi mi mi mi mi mi la, la la la
    mi' \repeat unfold 11 {mi}
    la la, la la la la la la la4

    %82
    la16 \repeat unfold 11 {la}
    \repeat unfold 12 {la}\mbreak
    \repeat unfold 12 {la}

    %85
    re re re re re re re re re4
    \repeat unfold 12 {si16}
    \repeat unfold 12 {si}

    %88
    \repeat unfold 12 {si}
    mi mi mi mi mi mi mi mi mi4\mbreak
    R2.

    %91
    mi'16 mi, mi mi mi mi mi mi mi4
    R2.
    mi'16 mi, mi mi mi mi mi mi mi4

    %94
    mi-.\p (mi-. mi-.)
    fa\pp -.(fa-. fa-.)
    fad!-.(fad-. fad-.)

    %97
    mi-! mi-! r
    la16\f la la la la la la la mi mi mi mi
    la la la la la la la la mi mi mi mi\mbreak

    %100
    la la la la la la la la mi mi mi mi
    fad2.\fermata
    si,4\f mi mi

    %103
    mi mi mi
    fad mi re
    dod2 si4 mi

    %106
    mi2 mi
    mi mi
    fad fad

    %109
    mi mi
    mi re
    dod1

}


Ibcn = \relative do {

    la1~
    la
    la'4. \tuplet 3/2 { si16 dod re } mi4 mi,8. mi16

    %4
    si'4. \tuplet 3/2 { dod16 re mi } fad4 fad,8. fad16
    dod2 re\mbreak
    la re,

    %7
    mi2. mi'8. mi16
    la4 la, r fad'8. fad16
    si,4 si'8. si16 si8. si,16 la'8. la16

    %10
    sold4 la si si,
    mi1\tasto~
    mi~

    %13
    mi4 mi8. mi16 sold8. sold16 mi8. mi16 mi1
    R2.*8
    \repeat unfold 12 {la16}

    %23
    si si si si si si si si dod dod dod dod
    re re re re dod dod dod dod si si si si\mbreak
    la la, la la la la la la la4

    %26
    r8 la'\f-! mi-! dod-! la4
    r8 la'\p-! mi-! dod-! la4
    r8 mi''-!\f si-! sold-! mi4

    %29
    r8 mi'-!\p si-! sold-! mi4
    r8 si'-!\f fad-! red-! si4
    r8 si'-!\p fad-! red-! si4

    %32
    r8 mi-!\f si-! sold-! mi4\mbreak
    r8 mi'-!\p si-! sold-! mi4
    la'16\f la la la la la la la sold sold sold sold

    %35
    fad fad fad fad fad fad fad fad mi mi mi mi
    red red red red red red red red dod dod dod dod
    si si' si, si si si si si si4

    %38
    R2.\mbreak
    si'16 si, si si si si si si si4
    R2.

    %41
    si'16 si, si si si si si si si4
    mi'-.\p (mi-. mi-.)
    do\pp-.(do-. do-.)

    %44
    lad-.(lad-. lad-.)
    si -! si,-! r
    R2.*4

    %50
    la'4\f sold fad
    mi fad sold\mbreak
    la si si,

    %53
    mi2.
    R2.*2
    \repeat unfold 12 {mi16}

    %57
    la la, la la la la la la la4
    la'16\p \repeat unfold 11 {la}
    mi' mi mi mi mi mi mi mi mid mid mid mid\mbreak

    %60
    fad fad, fad fad fad fad fad fad fad fad fad fad
    dod' dod, dod dod dod dod dod dod dod4
    R2.

    %63
    dod'16\f dod, dod dod dod dod dod dod dod4
    R2.
    dod'16 dod, dod dod dod dod dod dod dod4\mbreak

    %66
    la'16 la\p\repeat unfold 10 {la}
    si si si si si si si si dod dod dod dod
    re re re re dod dod dod dod si si si si

    %69
    la2.\fermata
    sold4 fad mid
    fad sold la

    %72
    si dod dod,\mbreak
    fad2.
    R2.*3

    %77
    si16 si,\f si si si si si si si4
    R2.*3
    la'16 la, \f la la la la la la la4

    %82
    R2.
    la'16 la la la la la la la sol sol sol sol\mbreak
    fad fad fad fad fad fad fad fad mi mi mi mi

    %85
    re re, re re re re re re re4
    R2.
    si''16 si si si si si si si la la la la

    %88
    sold sold sold sold sold sold sold sold fad fad fad fad
    mi mi, mi mi mi mi mi mi mi4\mbreak
    R2.

    %91
    mi''16 mi, mi mi mi mi mi mi mi4
    R2.
    mi'16 mi, mi mi mi mi mi mi mi4

    %94
    la4-.\p(la-. la-.)
    fa\pp -.(fa-. fa-.)
    red-. red-. red-.

    %97
    mi-! mi,-! r
    R2.*4
    re''4\f dod si

    %103
    la sold la
    re, mi mi,
    fad2 sold

    %106
    la la'
    mi dod
    re si

    %109
    dod la
    mi' mi,
    la1

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2  <3>4 <7->
    <6 4>2 <6 4 2>
    <3> <5 4>4 <3>
    <5 4> <3> <5 4> <3>
    <5 4> <3> <9> <8>
    <5 4> <3> <9 7> <6 5>
    s2 s4 <7>
    s2 s4 <7>
    <_+>2 <2>4 <4\+>
    <6> <6 5> <4> <7 _+>
    s1*2
    s4 <7> s2 s1
    s2.*9
    <7>4 <6\\> <6>
    <6 5> <6> <6\\>
    s2.*5
    <7 _+>2.
    <7 _+>
    s
    s
    s2 <6>4
    <6\\+> s2
    <6> <6+\\>4
    <_+>2.
    s
    \bassFigureExtendersOn <6 _ 4>4 <_> <_>\bassFigureExtendersOff
    s2.
    <7 _+>
    <_->
    <5>
    <7-/>
    <5 4>4 <_+> s
    s2.*4
    <6 5>4 <6> <6+\\>
    s <6+\\> <6>
    <6 5> <4> <7 _+>
    s2.*3
    \bassFigureExtendersOn <7->4 <7-> <7->\bassFigureExtendersOff
    s2.*2
    <5 4>4 <3> <5//>
    <9> <8> s
    <_+>2.
    s
    \bassFigureExtendersOn <6 _ 4>4 <_> <_>\bassFigureExtendersOff
    s2.
    <7 _+>2.
    <6>
    <6 5>4 s <6 4>
    <6\\> <6 4> <6 5>
    <6>2.
    <6+\\>2 <5/>4
    s <6+\\>  <6>
    <6 5> <4> <7 _+>
    s2.*10
    <2>2 <4\+>4
    <6>2 <6 _->4
    s2.*2
    <2>2 <4\+>4
    <6>2 <6+\\>4
    s2.
    s
    \bassFigureExtendersOn <6 _ 4>4 <_> <_>\bassFigureExtendersOff
    s2.
    <7>
    <_->
    s
    <7/->
    <5 4>4 <3> s
    s2.*4
    <6 5>4 <6> <6\\>
    s <5/> s
    <6 5> <4> <7>
    <5>2 <5/>
    <9> <8>
    <5 4>4 <3> <6>2
    <9 7> <7>
    <9 7> <3>
    <5 4> <7>

}

forma = {

    \time 2/2
    \key la\major
    \tempo 2 = 40\once\override Score.RehearsalMark.extra-offset = #'(+0 . -1)
    \mark\markup\huge "Grave"
    \repeat volta 2 {s1*12}
    \alternative  {{s1}{s}}\break\once\override Score.RehearsalMark.extra-offset = #'(+5 . -1)
    \mark\markup\huge "Prestissimo"
    \time 3/4
    \set Score.currentBarNumber = #14
    \tempo 2. = 50
    s2.*91\break
    \once\override Score.RehearsalMark.extra-offset = #'(+2 . -1)
    \mark\markup\huge "Adagio"
    \tempo 2 = 30
    \override Staff.TimeSignature.style = #'single-digit
    \time 2/2
    s1*7
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
    \senza
}

IIvlIn = \relative do'' {

    dod2\p~dod8(re16 mi)
    si2~si8(dod16 re)
    la2~la8(si16 dod)

    %4
    sold4_+ la-! r
    re,8.\f(la'16 fad'4) sold-+
    la8(mi) re(dod) si(la)

    %7
    si,8.(sold'16 re'4) dod
    dod8(si) la(sold) fad(mi)
    dod'2\p~dod8(re16 mi)

    %10
    si2~si8(dod16 re)
    la2~la8(si16 dod)
    sold4-+-! la-! r

    %13
    re,8.\f(la'16 fad'4) sold-+
    la8(mi) re(dod) si(la)
    si,8. re'16 dod4 (si-+)

    %16
    la2.
    \tuplet 3/2 { la8\p(dod mi) } la4-! la-!
    la-+ sold2

    %19
    \tuplet 3/2 { sold,8(si mi) } si'4-! si-!
    si-+ la2
    r8 la,-!\f dod(mi) la(dod)

    %22
    r sold,-! si(mi) sold(si)
    fad,(red') la'(fad) sold(mi)\mbreak
    sold(fad) mi(red?) dod(si)

    %25
    si'2\p~si8(dod16 re)
    dod2~dod8(red16 mi)
    red2.-+

    %28
    mi\fermata
    fad,8\f(mi) red(dod) si(la)
    sold4 la si-+

    %31
    \tuplet 3/2 { dod8(si la) } sold4 fad_+
    mi2.
    \tuplet 3/2 { la'8\p(si do ) } la4-! la-!

    %34
    la-+ sol2~
    \tuplet 3/2 { sol8(fa-+ mi)} fa4-! fa-!
    fa-+ mi2~

    %37
    \tuplet 3/2 { mi8(fa mi) } \appoggiatura mi8 re4 \appoggiatura do8 si4
    sold2_+ la4
    \appoggiatura do8 si do \appoggiatura mi8 re4 do

    %40
    do2(si4-+)
    \tuplet 3/2 { la'8\f(si do) } la4-! la-!
    la-+ sol2~

    %43
    \tuplet 3/2 { sol8(fa-+ mi)} fa4-! fa-!
    fa-+ mi2~
    \tuplet 3/2 { mi8(fa mi) }  re4 \appoggiatura do8 si4

    %46
    sold2_+ la4
    si8. re16 do4 si-+
    la2.

    %49
    \tuplet 3/2 { do8(si la) } mi'4-! la-!
    mi,2.
    \tuplet 3/2 { sold'8(fad mi) } si'4-! re-!

    %52
    do(si-+) la-!
    do2.
    si4(red,-+) mi-!

    %55
    fad8. la16 sol4 fad\mbreak
    mi2.
    \tuplet 3/2 { mi8(fa sol) } mi4 mi

    %58
    dod'(re mi)
    \tuplet 3/2 { sol,8(la sib) } la4-! sol-!
    fa(mi-+) re-!

    %61
    \tuplet 3/2 { re8(mi fa) } re4-! re-!
    si'(do re)
    \tuplet 3/2 { fa,8(sol la)} sol4-! fa-!

    %64
    mi(re-+ do)

}

IIvlIIn = \relative do'' {

    mi,2.\p
    fad
    mi

    %4
    re4_+ dod-! r
    re8.\f(la'16 fad'4) sold-+
    la8(mi) re(dod) si(la)

    %7
    si,8.(sold'16 re'4) dod
    dod8(si) la(sold) fad(mi)
    mi2.\p

    %10
    fad
    mi
    re4-+ -! dod-! r

    %13
    re8.\f(la'16 fad'4) sold-+
    la8(mi) re(dod) si(la)
    si,8. re'16 dod4 (si-+)

    %16
    la2.
    dod2\p~dod8(si16-+ la)
    si2.

    %19
    re2~re8(dod16-+ si)
    dod2.
    r8 la-!\f dod(mi) la(dod)

    %22
    r sold,-! si(mi) sold(si)
    fad,(red') la'(fad) sold(mi)\mbreak
    sold(fad) mi(red?) dod(si)

    %25
    r4 si'2\p~
    si8(la16 sold) la2~\mbreak
    \tuplet 3/2 { la8 (si la) } la2-+

    %28
    sold2.\fermata
    fad8\f(mi) red(dod) si(la)
    sold4 la si-+

    %31
    \tuplet 3/2 { dod8(si la) } sold4 fad_+
    mi2.
    do'2\p~\tuplet 3/2 { do8(si-+ la) }

    %34
    si2.
    la2~\tuplet 3/2 { la8(sol_+ fa) }
    sol2.

    %37
    fa4 si re~\mbreak
    re si do
    sold8(la) si4 la

    %40
    la2(sold4_+)
    do2\f~\tuplet 3/2 { do8(si-+ la) }
    si2.

    %43
    la2~\tuplet 3/2 { la8(sol_+ fa) }
    sol2.
    fa

    %46
    mi2 mi4
    re8. si'16 la4(sold)
    la2.

    %49
    mi4 do'~\tuplet 3/2 { do8(si-+ la) }
    si2.\mbreak
    si,4 re'~\tuplet 3/2 { re8(do-+ si) }

    %52
    mi,4(re_+) do-!
    r mi'2~
    mi4 (la,_+) sol-!

    %55
    do8 fad mi4 red-+
    mi2.
    sol,

    %58
    sol'4(fa-+ mi)
    r la,-! la-!
    la(sol_+) fa-!

    %61
    fa2.
    fa'4(mi-+ re)
    r sol,-! sol-!

    %64
    sol(fa_+ mi)

}

IIvlan = \relative do' {

    la2.\p
    re
    dod

    %4
    si4-+-! la-! r
    fad'4\f si, mi
    mi2.

    %7
    mi8 sold si4 la
    mi2.
    la,\p

    %10
    re
    dod
    si4-+-! la-! r

    %13
    fad' si, mi
    mi2.
    fad8 si la4(sold_+)\mbreak

    %16
    la2.
    la,\p
    mi'8-! mi-! sold-! si-! sold-! mi-!

    %19
    sold,2.
    la8-! la-! dod-! mi-! dod-! la-!
    <mi' dod>2.\f

    %22
    <mi si>
    red4 fad si,
    si si' la

    %25
    sold2.
    la\p
    fad

    %28
    dod'\fermata\mbreak
    si4 si,2
    si4 red mi~

    %31
    mi mi red
    mi8 fad mi re? dod si
    r4 la'\p la,

    %34
    mi' mi8 fa sol mi
    fa4 la fa
    do do8 re mi do

    %37
    re4 fa re
    mi re do
    si sold la

    %40
    mi' mi8 fa sold mi
    la,4 mi'2
    mi2.

    %43
    do
    do
    la2 re4~

    %46
    re si la~
    la mi' re
    do2.

    %49
    mi
    mi
    mi4 sold si,

    %52
    la(sold_+) la-!
    la'2.
    sol4(fad_+) mi-!

    %55
    la si si,
    mi2.
    la,

    %58
    mi''4(re-+ dod)
    mi,2.
    la,4-! dod(re)

    %61
    sol,2.
    re''4(do-+ si)
    re,2.

    %64
    sol,4-! si(do)

}


IIbcn = \relative do {

    R2.*4
    re2.
    dod

    %7
    si4 sold la
    mi'2.
    R2.*4

    %13
    re2.
    dod
    re4 mi mi,

    %16
    la2.\mbreak
    R2.*4
    la'2.

    %22
    sold
    fad4 red mi
    si2.

    %25
    R2.*4
    red2.
    mi4 fad sold

    %31
    la si si,
    mi2.
    R2.*8

    %41
    r4 la la,
    mi' mi8 fa sol mi
    fa4 la fa

    %44
    do do8 re mi do
    re4 fa re
    mi re do

    %47
    re mi mi,
    la2.
    la'

    %50
    \tuplet 3/2 { sold8(fad? mi) } si'4 re\mbreak
    mi,2.
    la4 mi la,

    %53
    R2.*3
    r4 mi' re
    dod2.

    %58
    R
    dod
    re4 la re,

    %61
    si'2.
    R
    si

    %64
    do4 sol do,

}

IIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2.*4
    <6 5>2 <4\+>4
    <6>2.
    <6\\>4 <6\\> s
    s2.*5
    <6 5>2 <4\+>4
    <6>2 s4
    <6 5>4 <4> <7>
    s2.*6
    <6>2.
    <6+\\>2 <6\\+>4
    <_+>2.
    s2.*4
    <5/>2.
    s4 <6+\\> <6>8 s
    <6 5>4 <4> <7 _+>
    s2.*10
    <5 4>4 <3>2
    <9>4 <6> <6>
    <5 4> <3> s
    <9> <6\\> <6\\>
    <_+> <_+> <6>8 s
    <6 5>4 <4> <7 _+>
    s2.*2
    <5/>2 <5/>4
    <7 _+>2.
    s4 <7 _+> s
    s2.*3
    s4 <_+> <_+>
    <5/>2.
    s
    <5/>
    s4 <7 _+> s
    <5/>2.
    s
    <5/>
    s4 <7>

}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key la\major
    \tempo 2 = 83
    s2.*15
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . -1.0)
    \mark\markup\italic {"Fine"}
    s2.\fermata
    \bar "||"
    s2.*15
    \once\override Score.RehearsalMark.extra-offset = #'(+8 . +1.0)
    \mark\markup\italic {"D.C."}
    s2.
    \bar "|."\break
    \once\override Score.RehearsalMark.extra-offset = #'(+0 . -2.0)
    \mark\markup\huge {"Minuetto 2.do"}
    \key la\minor
    \tempo 2 = 83
    s2.*15
    \once\override Score.RehearsalMark.extra-offset = #'(+8 . -1.0)
    \mark\markup\italic {"Fine"}
    s2.\fermata
    \bar "||"
    s2.*16
    \bar "|."
    \mark\markup\italic {"D.C."}

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
    \senza
}

IIIvlIn = \relative do'' {

    la'4. la,8 dod8.-+ si32 la dod8.-+ si32 la
    mi'4-! mi,-! la-! <mi dod>-!
    r8 si'-!\p dod(re) re-+(dod) dod-+(si)

    %4
    si4(dod8.\f) la16 la'2\prallprall
    r8 si,-!\p dod(re) re-+(dod) dod-+(si)
    si4(dod8.) la16 dod8.-+\f si32 la dod8.-+ si32 la\mbreak

    %7
    mi'4. mi,8 la8._+ sold32 fad  la8._+ sold32 fad
    si2. si'8.\p si16
    \tuplet 3/2 {si8-! la-! sold-!} si8. [si16] \tuplet 3/2 {si8-! la-! sold-!} si8. [si16]

    %10
    si2(la4) la8. la16
    \tuplet 3/2 { la8-! sold-! fad-! } la8.[la16] \tuplet 3/2 { la8-! sold-! fad-! } la8.[la16]
    la2(sold4) r

    %13
    dod,4.\f(red16 mi) si4-! sold-!\mbreak
    la4.(si16 dod) sold4-! mi-!
    fad4. la8 sold8. fad16 mi8._+ red16

    %16
    mi1
    mi'4. mi,8 sold8._+ fad32 mi sold8._+ fad32 mi
    re'4-! mi,-! sold-! si-!

    %19
    r8 si,-! dod(re) re_+(dod) dod_+(si)
    si4(dod8.) la'16\f la'2~\mbreak
    la8. si,16 re8.-+ dod32 si sold'2~

    %22
    sold8. la,16  dod8.-+ si32 la fad'2~
    fad8. mi16 re8. dod16 si8. la16 sold8. fad16
    dod2. dod'8.\p dod16

    %25
    \tuplet 3/2 {si8-! la-! sold-!} si8. [si16] \tuplet 3/2 { la8-! sold-! fad-! } la8.[la16]
    la2 (sold4) dod8.\f dod16\mbreak
    sold'4. \tuplet 3/2 { fad16 mid re } dod4 si

    %28
    la4._+ sold8 sold4._+ fad8
    fad4. re8 fad8. _+ mi32 re fad8._+ mi32 re
    la'4-! mi-! re'-! re-!

    %31
    re(dod8.) mi16\p mi4(red8.) la'16
    la2(sold4-+) r\mbreak
    re4.\f(mi16 fad) dod4-! la-!

    %34
    si4.(dod16 re) la4-! mi-!
    fad4. re'8 dod8. si16 la8.-+ sold16
    la1

}

IIIvlIIn = \relative do'' {

    la'4. la,8 dod8.-+ si32 la dod8.-+ si32 la
    mi'4-! mi,-! la-! <mi dod>-!
    r8 sold\p-! la(si) si_+(la) la_+(sold)

    %4
    sold4(la8.\f) la16 la'2\prallprall
    r8 sold,\p-! la(si) si_+(la) la_+(sold)
    sold4(la8.) la16 dod8.-+\f si32 la dod8.-+ si32 la

    %7
    mi'4. mi,8 la8._+ sold32 fad la8._+ sold32 fad\mbreak
    si2. sold'8.\p sold16
    \tuplet 3/2 { sold8-! fad-! mi-! } sold8.[sold16] \tuplet 3/2 { sold8-! fad-! mi-! } sold8.[sold16]

    %10
    sold2(fad4) fad8. fad16
    \tuplet 3/2 { fad8-! mi-! red-! } fad8.[fad16] \tuplet 3/2 { fad8-! mi-! red-! } fad8.[fad16]
    fad2(mi4) r

    %13
    dod4.\f(red16 mi) si4-! sold-!\mbreak
    la4.(si16 dod) sold4-! mi-!
    fad4. la8 sold8. fad16 mi8._+ red16

    %16
    mi1
    mi'4. mi,8 sold8._+ fad32 mi sold8._+ fad32 mi
    re'4-! mi,-! sold-! si-!

    %19
    r8 sold,\p-! la(si) si_+(la) la_+(sold)
    sold4(la8.) la'16\f la'2~
    la8. si,16 re8.-+ dod32 si sold'2~

    %22
    sold8. la,16  dod8.-+ si32 la fad'2~
    fad8. mi16 re8. dod16 si8. la16 sold8. fad16
    dod2. la'4\p~

    %25
    la sold~sold fad8. fad16
    fad2(mid4) dod'8.\f dod16\mbreak
    sold'4. \tuplet 3/2 { fad16 mid re } dod4 si

    %28
    la4._+ sold8 sold4._+ fad8
    fad4. re8 fad8. _+ mi32 re fad8._+ mi32 re
    la'4-! mi-! re'-! re-!

    %31
    re(dod8.) la16\p mi'4(red8.) la'16
    la2(sold4-+) r\mbreak
    re4.\f(mi16 fad) dod4-! la-!

    %34
    si4.(dod16 re) la4-! mi-!
    fad4. re'8 dod8. si16 la8.-+ sold16
    la1

}

IIIvlan = \relative do' {

    mi2. mi4
    si4. dod16 re dod4 mi
    fad2 mi4 mi-!

    %4
    mi2 r4 mi-!
    fad2 mi4 mi
    mi2 r4 mi

    %7
    mi2~mi4 red_+
    mi1
    r2 r4 mi8. mi16

    %10
    dod2. dod4
    si2. si4
    si2 mi

    %13
    mi mi\mbreak
    red mi
    dod si4 la

    %16
    sold1
    si2. si4
    si2 mi

    %19
    mi2. mi4
    mi2 mi
    si si

    %22
    la2. dod4
    dod2 si
    sold2. la'4\p

    %25
    sold mid_+ fad fad
    dod2 dod\mbreak
    mid sold

    %28
    dod,4 re dod si
    la2. la4
    mi'2 mi4 mi

    %31
    mi2 si4 si
    si2 si
    la' la

    %34
    fad mi~
    mi4 fad mi8. re16 dod8. si16
    dod1

}


IIIbcn = \relative do {

    la'2. la4
    sold4. fad16 mi fad4 dod
    re2 mi

    %4
    la,2. dod4
    re2 mi
    la,2. la'4
    sold2 fad

    %8
    mi1
    r2 r4 mi8. mi16
    fad8. fad,16 fad'8. fad16 fad8. fad,16 fad'8. fad16

    %11
    red2. si8. si16
    mi8. mi,16 mi'8. mi16 mi8. mi,16 mi'8. mi16
    la8. la,16 la'8. la16 sold8. sold,16 sold'8. sold16

    %14
    fad8. fad,16 fad'8. fad16 mi8. mi16 sold8. mi16\mbreak
    la,4 la' -+si si,
    mi1

    %17
    mi'2. mi4
    sold,4.-+ fad16 mi si'4-! re-!
    sold,,2 mi

    %20
    la~la8. la'16 dod8.-+ si32 la
    mi'2~mi8. sold,16 mid8.-+ re32 dod\mbreak
    fad2~fad8. fad16 la8.-+ sold32 fad

    %23
    si,2 re
    dod4 dod,8. dod16 dod4 r
    R1*2

    %27
    r4 dod''8. dod16 mid,8. sold16 dod,8. mid16
    fad4 si-+ dod dod,
    re2. re4\mbreak

    %30
    dod4. si16 la si4 mi
    la, la' sold fad
    mi2 mi,

    %33
    fad'8. fad16 fad,8. fad'16 mi8. mi,16 mi'8. mi16
    re8. re16 re,8. re'16 dod8. dod16 la8. dod16
    re4 si mi mi,

    %36
    la1

}

IIIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1
    <6>2 <5>4 <6>
    <9 7> <6 5> <7>2
    <9 4>4 <3>4 s <6>
    <9 7> <6 5> <7>2
    <9 4>4 <3> s2
    <6> <7>4 <6+\\>
    s1
    s
    <9 4>2 <7>
    <5/> <5/>4 <5/>
    <9 4>2 <3>
    <6 5>4 s <6>2
    <6+\\> s
    <6 5>4 s <6 4> <7 _+>
    s1
    s
    <5/>2 <5/>
    <_>2 <_>
    <9 4>2 <3>4 <3>
    <5 4>2 <3>4 <5/>
    <9>2 <8>4 <8>
    <9 7>2 <6\\>
    <_+> s
    s1*2
    s4 <_+> <5/> <5/>
    s <6 5> <4> <7 _+>
    <5>2 <5>4 <5>
    <6>2 <7>8 s <7>4
    s2 <6>4 <6+\\>
    <9 4>2 <3>
    <6\\> <6 4> 4 s
    <6 5> s <6> s
    <9 7>8 s <7>4 <6 4> <7>

}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key la\major
    \tempo 2 = 70
    s1*16
    \bar ":..:"\break
    s1*20
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
    \senza
}

IVvlIn = \relative do'' {

    dod,8\p(mi la) la-! (la4-!)
    re,8(sold si) si-! (si4-!)
    mi,8(la dod) mi,(si' re)

    %4
    dod4.-+ si
    mi8(dod la) la-!(la4-!)
    re8(si sold) sold8-! (sold4-!)

    %7
    dod8(la mi) mi'(dod la)
    si2.-+
    dod,8(mi la) la8-!(la4-!)

    %10
    re,8(sold si) si-! (si4-!)
    mi,8(la dod) mi,(si' re)
    dod4.-+ si

    %13
    mi8(dod la) la-!(la4-!)
    re8(si sold) sold8-! (sold4-!)
    dod8(la mi) re'(si sold)

    %16
    <<{la4. la,}\\{\stemUp s4 s8^\fermata}>>
    la'8(dod mi) mi8-!(mi4-!)
    sold,8(si mi) mi8-!(mi4-!)\mbreak

    %19
    fad,8(red' la') la8-!(la4-!)
    la4.(sold-+)
    si8(sold mi) re8-!(re4-!)

    %22
    re4.(dod-+)
    dod'8(lad fad) mi8-! (mi4-!)
    mi4.(red-+)

    %25
    sold,8\f(si mi) mi8-!(mi4-!)
    la,8(dod mi) mi8-!(mi4-!)
    si8-! la'(sold fad mi red)\mbreak

    %28
    mi2.~
    mi~
    mi~

    %31
    mi~
    mi
    dod,8(mi la) la8-!(la4-!)

    %34
    re,8(sold si) si8-!(si4-!)
    mi,8(la dod) mi,(si' re)
    dod4.-+ si

    %37
    mi8(dod la) la8-!(la4-!)
    re8(si sold) sold8-! (sold4-!)\mbreak
    dod8(la mi) re'(si sold)

    %40
    la2.
    la8(dod fad) fad8-!(fad4-!)
    sold,8(dod mid)  mid8-!(mid4-!)

    %43
    la,8(dod fad) la(sold fad)
    fad4.(mid-+)
    la8(dod,re) re8-!(re4-!)

    %46
    sold8(si, dod) dod-!(dod4-!)
    fad8(la, si) si4.-+\mbreak
    dod2.

    %49
    lad,8(fad' mi')  mi8-!(mi4-!)
    si,8(fad' re') re8-!(re4-!)
    sold,,8(mi' re') re8-!(re4-!)

    %52
    la,8(mi' dod') dod-!(dod4-!)
    mi8\pp(dod la) fad'(re la)
    mi'(dod la) re(si sold)

    %55
    dod(mi re) dod(si la)
    si2.-+\mbreak
    dod,8\p(mi la) la-!(la4-!)

    %58
    re,8(sold si) si-! (si4-!)
    mi,8(la dod) mi,(si' re)
    dod4.-+ si

    %61
    mi8(dod la) la-!(la4-!)
    re8(si sold) sold-! (sold4-!)
    dod8(la mi) re'(si sold)

    %64
    la2.
    do,8\p(mi la) la(do la)\mbreak
    re,(fa la) la(si_+ la)

    %67
    mi(sold la) la(do la)
    fa2.
    re8(la' fa') fa4.

    %70
    mi8(do la) la4.
    sold8(si re) do(mi la,)
    si2.-+

    %73
    do,8(mi la) la(do la)
    re,(fa la) la(si_+ la)\mbreak
    mi(sold la) la(do la)

    %76
    fa2.
    re8(la' fa') fa4.
    mi8(do la) la4.

    %79
    si8(re do) si(la sold)
    la2.
    do,8\f(mi sol) do(mi sol)

    %82
    sol4.(fa)
    si,,8(re sol) si(re fa)\mbreak
    fa4.(mi)

    %85
    mi,8(sol do) mi(sol sib)
    la(do fa,) sol(do mi,)
    fa(mi re) do(si la)

    %88
    sol2.
    do,8\p(mi do') do-!(do4-!)
    re,8(fa do') do-!(do4-!)

    %91
    mi,8(sol do) do-!(do4-!)
    do2.\fermata\mbreak
    la8(do fa) fa-!(fa4-!)

    %94
    si,8-!(re-! fa-!) mi-!(sol-! do,-!)
    re(fa mi) re(do si)
    do2.

    %97
    do8\f(mi sol) mi(sol do)
    do4.(si-+)
    si,8(re sold) re(sold si)

    %100
    si4.(la)
    mi8\p(do la) mi'-!(mi4-!)\mbreak
    re8(si sold) re'-! (re4-!)

    %103
    do8(la mi) mi'(do la)
    si2.-+
    do,8\p(mi la) la(do la)

    %106
    re,(fa la) la(si_+ la)\mbreak
    mi(sold la) la(do la)
    fa2.

    %109
    re8(la' fa') fa4.
    mi8(do la) la4.
    si8(re do) si(la sold)

    %112
    la2.
    la,8\p(do mi) la(mi do)
    la(do mi) la(mi do)

    %115
    si(re sold) si(sold re)
    si(re sold) si(sold re)
    dod(mi sol?) sib(sol mi)\mbreak

    %118
    dod(mi sol?) sib(sol mi)
    re(fa la) re(la fa)
    re(fa la) re(la fa)

    %121
    red(fad la) do(la fad)
    red(fad la) do(la fad)
    mi(sold si) re(si sold)

    %124
    mi(la do) mi(do la)\mbreak
    sold(si mi,) fad(la red,)
    <<{\tieDown mi4.~mi8}\\{\stemUp s4 s8^\fermata}>> r16  re16(do si)

    %127
    do8(mi la) la(do la)
    re,(fa la) la(si_+ la)\mbreak
    mi(sold la) la(do la)

    %130
    fa2.
    re8(la' fa') fa4.
    mi8(do la) la4.

    %133
    si8(re do) si(la sold)
    la2.
    dod,8(mi la) la-!(la4-!)

    %136
    re,8(sold si) si-!(si4-!)
    mi,8(la dod) mi,(si' re)
    dod4.-+ si

    %139
    mi8(dod la) la-!(la4-!)
    re8(si sold) sold-!(sold4-!)
    dod8(la mi) mi'(dod la)

    %142
    si2.-+
    dod,8(mi la) la-!(la4-!)
    re,8(sold si) si-!(si4-!)

    %145
    mi,8(la dod) mi,(si' re)
    dod4.-+ si
    mi8(dod la) la-!(la4-!)

    %148
    re8(si sold) sold-!(sold4-!)
    dod8(la mi) re'(si sold)
    la2.\fermata

}

IVvlIIn = \relative do'' {

    la2.\p
    sold_+
    la4. si

    %4
    la_+ sold
    <<
        {
            mi2.
            mi

            %7
            mi
            mi
        }\\{
            dod
            re
            dod
            si_+
        }
    >>
    la'

    %10
    sold_+
    la4. si
    la_+ sold\mbreak
    <<
        {

            %13
            mi2.
            mi
            mi4. mi

            %16
            mi2.
        }\\{
            dod
            re
            dod4. si_+
            la2._+
        }
    >>
    mi'
    mi

    %19
    red
    mi
    si'~

    %22
    si4. la
    dod2.~
    dod4. si\mbreak

    %25
    mi,2.\f
    fad
    sold8 dod si la sold fad

    %28
    sold2.
    mi'8(dod la) mi'-!(mi4-!)
    re8(si sold) re'-!(re4-!)

    %31
    dod8(la mi) mi'(dod la)
    \appoggiatura dod si2.-+
    la

    %34
    sold_+
    la4. si\mbreak
    la_+ sold
    <<
        {
            %37
            mi2.
            mi
            mi4. mi

            %40
            mi2.
        }\\{
            dod
            re
            dod4. si_+
            la2._+
        }
    >>
    dod'
    si

    %43
    dod4.~dod8 si la
    la4.(sold_+)
    la(si)

    %46
    sold(la)\mbreak
    fad(sold)
    mid2._+

    %49
    dod'~
    dod4. si,
    si'2.~

    %52
    si4. la,
    mi'\p-! fad-!
    mi-! re-!

    %55
    dod-! la'-!
    sold2._+
    la

    %58
    sold_+\mbreak
    la4. si
    la_+ sold
    <<
        {
            %61
            mi2.
            mi
            mi4. mi

            %64
            mi2.
        }\\{
            dod
            re
            dod4. si_+
            la2._+
        }
    >>
    la\p
    si

    %67
    do
    do
    si

    %70
    la\mbreak
    sold'4. la
    sold2._+

    %73
    la,
    si
    do

    %76
    do
    si
    la

    %79
    sold4 la8 re do si
    la2.
    mi'4.-!\f mi'-!

    %82
    mi(re-+)\mbreak
    re,-! re'-!
    re(do-+)

    %85
    <do mi,>2.
    <do fa,>4. do~
    do la4 re8

    %88
    si2.-+
    do,\p
    re

    %91
    mi
    mi\fermata
    fa~

    %94
    fa4. mi\mbreak
    re fa8 mi re
    do2.

    %97
    r4 r8 mi'4.-!\f
    mi(re-+)
    r4 r8 re4.-!

    %100
    re(do-+)
    la2.
    sold

    %103
    la
    sold_+
    la,\p

    %106
    si\mbreak
    do
    do

    %109
    si
    la
    sold4 la8 re do si

    %112
    la2.
    <la' do,>~
    <la do,>

    %115
    <sold re>~
    <sold re>
    <sol! sib,>~

    %118
    <sol sib,>
    <fa la,>~\mbreak
    <fa la,>

    %121
    <fad do>~
    <fad do>
    <sold si,>

    %124
    <la do,>
    <sold si,>4. <fad la,>
    <<
        {<mi sold,>4.(mi8)}\\{\stemUp s4 s8^\fermata}
    >>  r16  re16[(do si )]

    %127
    la2.
    si
    do

    %130
    do
    si
    la

    %133
    sold4 la8 re do si
    la2.
    la'2.

    %136
    sold_+
    la4. si
    la_+ sold
    <<
        {
            %139
            mi2.
            mi
            mi

            %142
            mi
        }\\{
            dod
            re
            dod
            si_+
        }
    >>
    la'
    sold_+

    %145
    la4. si
    la_+ sold\mbreak
    <<
        {
            mi2.

            %148
            mi
            mi4. mi
        }\\{
            dod2.
            re
            dod4. si_+
        }
    >>
    <mi la,>2.\fermata

}

IVvlan = \relative do' {

    <<
        {
            mi2.\p
            mi
        }\\{
            dod
            si
        }
    >>
    mi4. mi

    %4
    mi mi
    la,2.
    sold

    %7
    la
    sold_+
    <<
        {
            mi'2.

            %10
            mi
        }\\{
            dod
            si
        }
    >>
    mi4. mi
    mi mi

    %13
    la,2.
    sold\mbreak
    la4. sold_+

    %16
    la2.
    dod
    si

    %19
    la
    si
    mi

    %22
    mi
    fad
    fad4 fad8 si,4 la8

    %25
    sold2.\f
    la
    si\mbreak

    %28
    si
    la
    sold

    %31
    la4. la'
    \appoggiatura la8 sold2._+
    <<
        {
            mi2.

            %34
            mi
        }\\{
            dod
            si
        }
    >>
    mi4. mi
    mi mi

    %37
    la,2.
    sold
    la4. sold_+

    %40
    la2.
    la'\mbreak
    mid

    %43
    fad4. re
    dod2.
    dod4. re~

    %46
    re dod~
    dod si
    sold2.

    %49
    fad'
    fad
    mi

    %52
    mi
    dod4.-!\p re-!
    dod-! si-!\mbreak

    %55
    la la
    mi'2.
    <<
        {
            mi2.

            %58
            mi
        }\\{
            dod
            si
        }
    >>
    mi4. mi
    mi mi

    %61
    la,2.
    sold
    la4. sold_+

    %64
    la2.
    mi' \p
    fa

    %67
    la,\mbreak
    la
    fa'4. re

    %70
    mi2.
    mi4. mi
    mi2.

    %73
    mi
    fa
    la,

    %76
    la
    fa'4. re
    mi2.

    %79
    mi4.~mi4 re8
    do2.
    do\f \mbreak

    %82
    la
    sol
    sol

    %85
    do4.~do8 mi do
    fa4. mi
    re fa

    %88
    sol2.
    do,\p
    do

    %91
    do
    do\fermata
    do

    %94
    si4. do
    do si8 sol' fa\mbreak
    mi2.

    %97
    mi4.\f sol
    sol2.
    mi4. mi

    %100
    mi2.
    do
    si

    %103
    la
    mi'
    mi\p

    %106
    fa
    la,
    la

    %109
    fa'4. re
    mi2.\mbreak
    mi4.~mi4 re8

    %112
    do2.
    mi~
    mi

    %115
    fa~
    fa
    mi~

    %118
    mi
    re~
    re

    %121
    la~
    la
    sold4. mi'

    %124
    la,2.
    mi'4. red\mbreak
    <<{mi2}\\{s4 s8 ^\fermata}>> r16 re16  do si

    %127
    mi2.
    fa
    la,

    %130
    la
    fa'4. re
    mi2.

    %133
    mi4.~mi4 re8
    do2.

    <<
        {
            mi2.

            %136
            mi
        }\\{
            dod
            si
        }
    >>
    mi4. mi
    mi mi

    %139
    la,2.
    sold
    la

    %142
    sold_+
    <<
        {
            mi'2.
            mi
        }\\{
            dod
            si
        }
    >>

    %145
    mi4. mi
    mi mi
    la,2.

    %148
    sold\mbreak
    la4. sold_+
    dod2.\fermata

}


IVbcn = \relative do {

    la2.\p
    mi'
    la4. sold

    %4
    la4 la,8 mi'4 re8
    dod2.
    si

    %7
    la
    mi'4 mi8 sold4 mi8
    la,2.

    %10
    mi'
    la4. sold
    la4 la,8 mi'4 re8

    %13
    dod2.
    si
    la4 la'8 mi4 mi,8

    %16
    la2.
    la'
    sold

    %19
    fad
    mi4 mi8 sold4 mi8
    sold,2.

    %22
    la4 la'8 dod4 la8
    lad,2.
    si4 si'8 red4 si8

    %25
    R2.*3\mbreak
    mi,8 sold si re, sold si
    dod,2.

    %30
    si
    la
    mi'4 mi8 sold4 mi8

    %33
    la,2.
    mi'
    la4. sold

    %36
    la4 la,8 mi'4 re8
    dod2.
    si

    %39
    la4 la'8 mi4 mi,8\mbreak
    la2.
    fad'

    %42
    sold
    la4. si-+
    dod dod,

    %45
    fad2.
    mi
    re

    %48
    dod4 dod'8 dod,4 si8
    lad2.
    si

    %51
    sold
    la
    R2.*4\mbreak

    %57
    la2.
    mi'
    la4. sold-+

    %60
    la4 la,8 mi'4 re8
    dod2.
    si

    %63
    la4 la'8 mi4 mi,8
    la2.
    do\p

    %66
    re
    mi
    fa

    %69
    re
    do\mbreak
    si4. la

    %72
    mi'4 mi8 sold4 mi8
    do2.
    re

    %75
    mi
    fa
    re

    %78
    do
    si4 la8 mi'4 mi,8
    la2.

    %81
    do\f
    re
    si

    %84
    do\mbreak
    R2.*3
    r4 sol8 sol'4 fa8

    %89
    mi2.\p
    fa
    sol

    %92
    la\fermata
    re,
    sol4. do

    %95
    fa, sol
    do,4 do'8 mi,4 sol8
    do,2.\f

    %98
    sol'
    sold\mbreak
    la

    %101
    R2.*3
    r4 mi8 sold4 mi8
    do2.\p

    %106
    re
    mi
    fa

    %109
    re
    do
    si4 la8 mi'4 mi,8

    %112
    la do mi la mi do
    la2.~
    la\mbreak

    %115
    si~
    si
    dod~

    %118
    dod
    re~
    re

    %121
    red~
    red
    mi~

    %124
    mi~
    mi~
    mi2\fermata r16 re16  do si

    %127
    do2.\mbreak
    re
    mi

    %130
    fa
    re
    do

    %133
    si4 la8 mi'4 mi,8
    la2.
    la

    %136
    mi'
    la4. sold-+
    la4 la,8 mi'4 re8

    %139
    dod2.
    si
    la

    %142
    mi'4 mi8 sold4 mi8
    la,2.
    mi'

    %145
    la4. sold
    la4 la,8 mi'4 re8
    dod2.

    %148
    si
    la4 la'8 mi4 mi,8
    la2.\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown
    s2.
    <7>
    s4. <5/>
    s <7>4 <7>8
    <6>2.
    <6\\>
    s
    <7>2 <7>4
    s2.
    <7>
    s4. <5/>
    s4. <7>4 <7>8
    <6>2.
    <6\\>
    s4. <7>
    s2.
    s
    <6>
    <6+\\>
    <6+\\>4 <6+\\>8 <6>4.
    <5/>2.
    <9 4>4. <6>
    <5/>2.
    <9 4>4. <6>
    s2.*3
    <_>2 <_>4
    <6>2.
    <6\\>
    s
    <7>4. <7>4 <7>8
    s2.
    <7>
    s4. <5/>
    s <7>4 <7>8
    <6>2.
    <6\\>
    s4. <7>
    s2.
    s
    <6+\\>
    <6>4 s8 <6 5>4 s8
    <6 4>4. <_+>
    s4. <6\\>
    <7> <6\\>
    <7> <6\\>
    <_+> <_+>4 <_+>8
    <5/>4. s
    <9> <8>
    <5/> s
    <9> <8>
    s2.*5
    <7>2.
    s4. <5/>
    s <7>4 <7>8
    <6>2.
    <6\\>
    s4. <7>
    s2.
    <6>2 s4
    <6 5>2 s4
    <6 4>2.
    <5>2 s4
    <6 5>2 s4
    <6>2.
    <6+\\>
    <7 _ _+>4. <_>
    <6>2 s4
    <6 5>2 s4
    <6 4>2.
    <5>2 s4
    <6 5>2 s4
    <6>2.
    <6+\\>4. <7 _+>
    s2.*2
    <9 4>4. <7>
    <5/> s
    <9 4> <3>
    s2.*3
    s4. <7>4 <7>8
    <6>2 s4
    <6 5>2 s4
    <6 4>2.
    <5>2.
    <7>2 s4
    <7>4. s
    <6 5> <7>
    <_>2 <_>4
    s2.
    <6 4>4. <3>
    <5/>2.
    <9 4>4. <3>
    s2.*3
    s4 <7 _ _+>4 <_>
    <6>2 s4
    <6 5>2 s4
    <6 4>2.
    <5>2 s4
    <6 5>2 s4
    <6>2.
    <6+\\>4. <7 _+>
    s2.*3
    <6+\\ _ 5/>2.
    <_>2 <_>4
    <7-/>2.
    <7-/>2 <7-/>4
    s2.
    s
    <7/ _+>
    s
    <_+>
    <6 4>
    <7 _+>4. <7\+>
    <_+>2.
    <6>2 s4
    <6 5>2 s4
    <6 4>2.
    <5>2 s4
    <6 5>2 s4
    <6>2.
    <6+\\>4. <7 _ _+>4 <_>8
    s2.*2
    <7>2.
    s4. <5/>
    s <7>4 <7>8
    <6>2.
    <6\\>
    s
    <7>2 <7>4
    s2.
    <7>
    s4. <5/>
    s4. <7>4 <7>8
    <6>2.
    <6\\>
    s4. <7>

}

forma = {

    \time 6/8
    \override Score.RehearsalMark.extra-offset = #'(0 . +1.0)
    \key la\major
    \tempo 2. = 35
    s2.*64\break
    \mark\markup\huge "Minore"
    \key la\minor
    s2.*70\break
    \mark\markup\huge "Majore"
    \key la \major
    s2.*16
    \bar"|."

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
    \senza
}

VvlIn = \relative do'' {

    mi8-! re16(dod) si(la) la'8-!
    la(sold-+) mi-!\p
    mi(re) re-!

    %4
    re-+ dod la-!\f
    dod16(si) dod(mi) red(fad)
    mi4 si'8-!\p

    %7
    si(la) fad-+
    fad(sold) si,\f\noBeam
    la16(sold) fad(mi) mi'8-!\p

    %10
    mi(re) si-!\f
    la16 (sold) fad(mi) re'8-!\p\mbreak
    re(dod) mi-!\f

    %13
    fad16(mi fad) re-! mi-! dod-!
    re(dod re) si-! dod-! la-!
    si(la si) sold-! la-! fad-!

    %16
    mi4 mi'8-!
    mi\noBeam (\tuplet 3/2 { fad16) re'-! dod-! si[(la sold)] }
    sold8(la) la,-!

    %19
    si16. re32 dod8[si-+]
    dod la mi
    mi\p\noBeam (\tuplet 3/2 { fad16) re'-! dod-! si[(la sold)]}

    %22
    sold8(la) mi-!\f\mbreak
    \tuplet 3/2 { fad16(mi re)} dod8[si_+]
    la4 do'8-!

    %25
    do(si) la-!
    la(sold) fa'-!
    fa(mi) re-!

    %28
    do(\appoggiatura si la) la'-!
    la16(sold) si(mi,) sold(re)
    mi,\p(si') re(do) mi(la,)

    %31
    do(si) re(do) mi(la,)\mbreak
    si4-+ mi8-!
    mi(re) fa-!

    %34
    fa(mi) sol-!
    la16(sol) fa(mi) re(do)
    si8-+ sol sol'-!\p

    %37
    sol16(fad) do'(la) sol(fad)
    sol(re) fa!(mi) sol(do,)
    mi(re) fa(mi) sol(si,)

    %40
    do4 mi8\f
    re16-+ (do re8) fa-!
    mi16-+(re mi8) la-!\mbreak

    %43
    sold16.(la32 la4-+)
    si8-! mi,-! re'
    re16(si) do(la) si(sold)

    %46
    la8(sold-+) la-!
    re,16(fa) mi(re) do(si)
    do8 la mi

    %49
    mi16 (sold) si(la) do(si)
    mi,(la) do(si) re(do)
    fa(re) do(si) la(sold)

    %52
    la4

}

VvlIIn = \relative do'' {

    mi8-! re16(dod) si(la) la'8-!
    la(sold-+) dod,-!\p
    dod(si) si-!

    %4
    si-+ la la-!\f
    dod16(si) dod(mi) red(fad)
    mi4 sold8-!\p

    %7
    sold((fad-+) red-+
    red?(mi) si\noBeam\f
    la16(sold) fad(mi) dod'8\noBeam\p

    %10
    dod (si) si-!\f \mbreak
    la16(sold) fad(mi) si'8-!\noBeam\p
    si(la) mi'-!\f

    %13
    fad16(mi fad) re-! mi-! dod-!
    re(dod re) si-! dod-! la-!
    si(la si) sold-! la-! fad-!

    %16
    mi4 mi'8-!
    mi\noBeam (\tuplet 3/2 { fad16) re'-! dod-! si[(la sold)] }
    sold8(la) la,-!

    %19
    si16. re32 dod8[si-+]
    dod la mi
    mi\p\noBeam (\tuplet 3/2 { fad16) re'-! dod-! si[(la sold)]}

    %22
    sold8(la) mi-!\f\mbreak
    \tuplet 3/2 { fad16(mi re)} dod8[si_+]
    la4 do'8-!

    %25
    do(si) la-!
    la(sold) fa'-!
    fa(mi) re-!

    %28
    do(\appoggiatura si la) r
    R4.\mbreak
    sold8\p la8. fad16

    %31
    sold8 la8. fad16
    sold4_+ do8-!
    do(si) re-!

    %34
    re(do) mi~
    mi16 sol fa(mi) re(do)
    si8_+ \appoggiatura la sol si\p

    %37
    do4 re8
    sol,4 sol8
    la sol fa

    %40
    mi4 do'8\f\mbreak
    do(si) re-!
    re(do) mi-!

    %43
    re-! do4
    si4.-+
    fa8\p-! mi-! re-!

    %46
    do16(mi) si(mi) la,8
    si sold mi'
    la,4.

    %49
    si8 do re
    do sold' la~
    la16 fa mi(re) do(si)

    %52
    la4

}

Vvlan = \relative do' {

    r8 la4 dod8-!
    dod(si) mi\p
    fad4 mi8

    %4
    mi4.
    la,4\f si8
    si4 si8\p

    %7
    dod si si
    si4 r8
    mi4 mi8

    %10
    mi sold si\mbreak
    mi,4 mi8
    mi mi la\f

    %13
    la4 la8
    la(sold) la-!
    mi4 red8_+

    %16
    mi4 la8
    la4 re,?8-!
    re(dod) mi

    %19
    fad mi re
    dod4 la8
    la4 re8-!\mbreak

    %22
    re(dod) la_!\f
    la la sold_+
    la4 r8

    %25
    r r do-!
    do(si) re'-!
    si4.

    %28
    mi,
    R
    mi8\p la,4\mbreak

    %31
    mi'8 la,4
    mi' do8
    sol'4 sol8

    %34
    sol4 sol8~
    sol la16 sol fa mi
    re4 sol,8\p

    %37
    la4.
    si8 do mi
    fa sol sol,
    do4 sol'8\f\mbreak

    %41
    sol4 la8
    la4 la8
    mi mi4

    %44
    mi4.
    R4.*3
    r8 r mi-!\p

    %49
    mi4.~
    mi8 re do
    si do re

    %52
    do4

}


Vbcn = \relative do {

    r8
    r r la'
    mi'4 la,8\p
    re,4 mi8

    %4
    la,4.
    r8 r la'\f
    sold16 fad mi fad sold mi

    %7
    la8\p si si,
    mi mi, r
    r r mi''

    %10
    mi, mi, r
    r r mi'\mbreak
    la la, dod'\f

    %13
    re4 dod8
    si4 la8
    sold4 fad8

    %16
    mi mi, dod'
    dod(re) mi
    mi (fad) dod

    %19
    re mi mi,
    la4 dod8
    dod\p(re) mi

    %22
    mi(fad) dod\f
    re mi mi,
    la4 r8

    %25
    r r la'
    si4.
    sold

    %28
    la8-! la,-! r
    R4.*3
    r8 r r

    %33
    r r sol
    do4 do'8
    fa, re fa

    %36
    sol sol, r\mbreak
    R4.*3
    r8 r do\f

    %41
    sol'4 re8
    la'4 do,8
    si la4

    %44
    mi'4.
    R4.*3
    r8 r mi\p

    %49
    mi4.~
    mi4 la8
    re, mi mi,

    %52
    la4

}

Vbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown
    s8
    s4.
    <5 4>8 <3> s
    <9 7> <6 5> <7>
    <9 4> <3> s
    s4 <4\+>8
    <6>4 <6>8
    <9 7>16 s <7 _+>8 <_+>
    <9 4> <3> s
    s s <6 _ 4>
    <_> <7> s
    s s <7>
    <9 4> <3> <6>16 s
    <6 5>8 s <6>
    <7> <6\\> s
    <6>4 <6+\\>8
    s s <6>
    <6>16 s <6 5>8 <7>
    <7> <5> <6>16 s
    <6 5> s <6 4>8 <7>
    s4 <6>8
    <6>16 s <6 5>8 <7>
    <7> <5> <6>16 s
    <6 5> s <6 4>8 <7>
    s4.*2
    <9 7>8  <6+\\ 5/> <5/>16 s
    <6 5/>4.
    s4.*5
    s8 s <7>
    <9 4> <3> s
    <9 7>16 s <7>8 <7>
    \bassFigureExtendersOff
    s4.*5
    <5 4>8 <3> s
    <5 4> <3> <6>
    <6+\\>4.
    <_+>
    s4.*4
    <_+>8 <6 4> <7 _+>
    <6 4> <7 _+> s
    <6 5> <4> <7 _+>

}

forma = {

    \time 3/8
    \key la\major
    \tempo 4. = 60
    \partial 8 s8
    s4.*7
    s4 \bar ":..:" s8
    s4.*15
    s4\bar ":..:"\break
    \once \override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup\huge "Vivace 2.do"
    \key la \minor
    s8
    s4.*7
    s4 \bar ":..:" s8
    s4.*19
    s4\bar ":|."
    \mark\markup "D.C."

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

    la'16(sold la) mi-! dod-! la-! la'(sold la) mi-! dod-! la-!
    fad'4.-+ mi
    fad,16(mi fad) la-! re-! fad,-! mi(re mi) la-! dod-! mi,-!

    %4
    re4.-+dod
    la16(dod mi) la-! dod-! mi-! mi,(sold si) mi-! sold-! si-!
    dod,8-! mi-! la-! si,-! re-! sold-!

    %7
    la,-! mi'-! re-! dod-! si-! la-!\mbreak
    mi'-! mi,-! mi-! mi4.
    si''16(sold mi) si'-! sold-! mi-! si'(sold mi) si'-! sold-! mi-!

    %10
    re4.-+ dod
    dod'16(si lad) dod-! si-! lad-! dod(si lad) dod-! si-! lad-!
    mi4.-+ red

    %13
    si16(la si) mi-! sold-! si,-! dod(si dod) mi-! la-! dod,-!
    red(dod red) fad-! si-! red,-! mi4.\mbreak
    dod8-+ si la sold la fad_+

    %16
    mi\f mi'-! mi-! mi16(sold si) si-! si-! si-!
    si8-! dod,-! dod-! dod16(mi la) la-! la-! la-!
    sold8 si, si si16(mi sold) sold-! sold-! sold-!

    %19
    sold8 la16 sold fad mi la sold fad mi red dod
    si2.\mbreak
    sold16(si mi) si-! sold'-! si,-! la(dod mi) dod-! la'-! dod,-!

    %22
    sold16(si mi) si-! sold'-! si,-! la(dod mi) dod-! la'-! dod,-!
    si8 la' sold fad-+ mi red
    mi,16(sold si) mi-! sold-! si-! mi,,4.

    %25
    mi'16(red mi) si-! sold-! mi-!  mi'(red mi) si-! sold-! mi-!
    dod'4.-+ si\mbreak
    dod16(si dod) mi-! la-! dod,-! si(la si) mi-! sold-! si,-!

    %28
    la4._+ sold
    mi'16(fad sol) mi-! fad-! sol-! mi(fad sol) mi-! fad-! sol-!
    lad,4._+ si

    %31
    dod16(si dod) mi-! lad-! mi-! dod(si dod) mi-! lad-! mi-!
    re8-+ dod si si,4.
    re'16(mi fad) re-! mi-! fad-! re(mi fad) re-! mi-! fad-!\mbreak

    %34
    sold,4._+ la
    si16(la si) re-! sold-! re-! si(la si) re-! sold-! re-!
    dod8-+ si la la,4.

    %37
    mi''16(dod la) mi'-! dod-! la-! mi'(dod la) mi'-! dod-! la-!
    sol'4.-+ fad
    fad16(red si) fad'-! red-! si-! fad'(red si) fad'-! red-! si-!

    %40
    la'4.-+ sold?\mbreak
    mi,16(re mi) la-! dod-! mi,-! fad(mi fad) la-! re-! fad,-!
    sold(fad sold) si-! mi-! sold,-! la4.

    %43
    fad8_+ mi re dod re si_+
    la\f la'-! la-! la16(dod mi) mi-! mi-! mi-!
    mi8 fad, fad fad16(la re) re-! re-! re-!

    %46
    re8 mi, mi mi16 (la dod) dod-! dod-! dod-!\mbreak
    dod8 re16 dod si la re dod si la sold fad
    mi2.

    %49
    dod16(mi la) mi-! dod'-! mi,-! re(fad la) fad-! re'-! fad,-!
    dod(mi la) mi-! dod'-! mi,-! re(fad la) fad-! re'-! fad,-!
    mi8 re' dod si_+ la sold

    %52
    la,16(dod mi) la-! dod-! mi-! la,,4.

}

VIvlIIn = \relative do'' {

    la'16(sold la) mi-! dod-! la-! la'(sold la) mi-! dod-! la-!
    fad'4.-+ mi
    fad,16(mi fad) la-! re-! fad,-! mi(re mi) la-! dod-! mi,-!

    %4
    re4.-+dod
    la16(dod mi) la-! dod-! mi-! mi,(sold si) mi-! sold-! si-!
    dod,8-! mi-! la-! si,-! re-! sold-!

    %7
    la,-! mi'-! re-! dod-! si-! la-!\mbreak
    mi'-! mi,-! mi-! mi4.
    si''16(sold mi) si'-! sold-! mi-! si'(sold mi) si'-! sold-! mi-!

    %10
    re4.-+ dod
    dod'16(si lad) dod-! si-! lad-! dod(si lad) dod-! si-! lad-!
    mi4.-+ red

    %13
    sold,,\p la\mbreak
    si dod
    dod'8-+ si la sold la fad_+

    %16
    mi16\f si' si si si si si8 sold si
    dod,16 la' la la la la la8 fad la
    si,16 sold' sold sold sold sold sold8 mi sold

    %19
    dod, dod'16 si la sold dod si la sold fad mi\mbreak
    red2.
    si'8-! sold-! mi-! dod'-! la-! mi-!

    %22
    si'8-! sold-! mi-! dod'-! la-! mi-!
    si'8 la' sold fad-+ mi red
    mi,16(sold si) mi-! sold-! si-! mi,,4.

    %25
    mi'16(red mi) si-! sold-! mi-!  mi'(red mi) si-! sold-! mi-!
    dod'4.-+ si\mbreak
    dod16(si dod) mi-! la-! dod,-! si(la si) mi-! sold-! si,-!

    %28
    la4._+ sold
    mi'16(fad sol) mi-! fad-! sol-! mi(fad sol) mi-! fad-! sol-!
    lad,4._+ si

    %31
    dod16(si dod) mi-! lad-! mi-! dod(si dod) mi-! lad-! mi-!
    re8-+ dod si si,4.
    re'16(mi fad) re-! mi-! fad-! re(mi fad) re-! mi-! fad-!\mbreak

    %34
    sold,4._+ la
    si16(la si) re-! sold-! re-! si(la si) re-! sold-! re-!
    dod8-+ si la la,4.

    %37
    mi''16(dod la) mi'-! dod-! la-! mi'(dod la) mi'-! dod-! la-!
    sol'4.-+ fad
    fad16(red si) fad'-! red-! si-! fad'(red si) fad'-! red-! si-!

    %40
    la'4.-+ sold?\mbreak
    dod,,\p-! re-!
    mi-! fad-!

    %43
    fad8 mi re dod re si_+
    la16\f mi' mi mi mi mi mi8 dod' la
    fad16 re re re re re re8 si' fad\mbreak

    %46
    mi16 dod dod dod dod dod dod8 la' mi
    fad fad16 mi re dod fad mi re dod si la
    sold2.

    %49
    mi'8 dod la fad' re la
    mi' dod la fad' re la
    mi' re' dod si_+ la sold

    %52
    la,16(dod mi) la-! dod-! mi-! la,,4.

}

VIvlan = \relative do' {

    la4. la
    la la
    la la

    %4
    sold la
    R2.
    mi'4 mi8 re4 re8

    %7
    dod4. <mi la,>
    mi8 mi mi mi4.
    sold mi

    %10
    si_+ la\mbreak
    lad' fad
    dod_+ si

    %13
    R2.*2
    mi4 red8 mi fad red
    mi4. mi~

    %17
    mi mi
    red mi
    mi fad

    %20
    fad2.
    mi4. la,
    mi' la,

    %23
    mi'8 red mi dod si la
    sold sold sold sold4.
    mi' mi

    %26
    mi mi
    mi mi
    red_+ mi

    %29
    r4 r8 dod4.
    fad fad\mbreak
    mi lad,

    %32
    si8 lad si si4.
    r4 r8 si4.
    mi mi

    %35
    mi sold,
    la8 sold la la4.
    dod la

    %38
    mi'_+ re
    red si\mbreak
    fad' mi

    %41
    R2.*2
    la,4 sold8 la si sold
    la4.\f la

    %45
    la la
    sold la
    la si

    %48
    si2.
    la4. re\mbreak
    la re

    %51
    la'8 sold la fad mi re
    dod dod dod dod4.

}


VIbcn = \relative do {

    la4 la'8 dod4 la8
    re4. dod
    re,4 si'8 dod,4 la'8

    %4
    si,4._+ la
    R2.
    la'4. sold

    %7
    la la,
    mi'8 mi, mi mi4.
    R2.

    %10
    mi'8 fad sold la,4.\mbreak
    R2.
    fad'8 sold lad si,4.

    %13
    R2.*2
    la'8 sold fad mi si' si,
    mi4. sold

    %17
    la fad
    sold mi
    la, fad

    %20
    si8 si' si si red si
    mi,4. mi\mbreak
    mi mi

    %23
    mi8 fad sold la si si,
    mi mi, mi mi4.
    mi''4 mi,8 sold4 mi8

    %26
    la4. sold
    la4 fad'8 sold,4 mi'8
    fad,4.-+ mi

    %29
    R2.
    mi4. re
    dod fad,\mbreak

    %32
    si8 fad' si si,4.
    R2.
    re4. dod

    %35
    si mi,
    la8 mi' la la,4.
    R2.

    %38
    la'8 si dod re,4.
    R2.
    si'8 dod red mi,4.

    %41
    R2.*2\mbreak
    re'8 dod si la mi' mi,
    la4.\f dod,

    %45
    re si
    dod la
    re si

    %48
    mi8 mi mi mi sold mi
    la4. la
    la la

    %51
    la8 si dod re mi mi,
    la la, la la4.

}

VIbfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s4. <6>4 s8
    <6 5>4 s8 <6>4 s8
    <6 5>4 <6>16 s <6>4.
    <6\\>2.
    s
    s4. <5/>
    s2.*3
    <7>4 <7>8 s4.
    s2.
    <7 _ _+>4 <_>8 s4.
    s2.*2
    <6 5>16 s <6>8 <6\\>  s <4> <7 _+>
    s4. <6>
    <9 7>4 s8 <7>4 s8
    <9 7>4. <3>
    <9 7>4 s8 <7>4 s8
    <7 _ _+>2 <_>4
    s4. <6 4>
    <3> <6 4>
    <3>8 <6+\\> <6>16 s <6 5>8 <4> <7 _+>
    s2.
    s4. <6>4 s8
    <6 5>4 s8 <6>4 s8
    <6 5>4 <6>16 s <6>4.
    <6+\\>2.
    s
    <4\+>4. <6>
    <6+\\> <6+\\>
    s2.*2
    <4\+>4. <6>
    <6\\> <6\\>
    s2.*2
    <7 _ _->4 <_>8 s4.
    s2.
    <7 _ _+>4 <_>8 s4.
    s2.*2
    \bassFigureExtendersOff
    <6 5>8 <6> <6\\> s <7> s
    s4. <6>
    <9 7> <7>
    <9 7> <3>
    <9 7> <7>
    \bassFigureExtendersOn
    <_>4 <_>8 <7>4 <7>8
    \bassFigureExtendersOff
    s4. <6 4>
    <3> <6 4>
    s8 <6\\> <6> <6 5> <7>

}

forma = {

    \time 6/8
    \key la\major
    \tempo 2. = 42
    s2.*24
    \bar ":..:"\break
    s2.*28
    \bar":|."

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



global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza
}

VIIvlIn = \relative do'' {

    r8 r16 la' [dod8. la16 mi8. dod16]
    la4-! la-! la-!
    fad-! fad4. sold16 la

    %4
    mi2.\fermata
    r4 mi'2\p~
    mi4 re2~

    %7
    re4 dod2~
    dod8.[ re16 si8. dod16 re8. si16]
    dod8. [la'16\f dod8. la16 mi8. dod16]

    %10
    la4-! la-! la-!
    fad-! fad4. sold16 la
    mi2.\fermata\mbreak

    %13
    r4 mi'2\p~
    mi4 re2~
    re4 dod2~

    %16
    dod8.[ re16 si8. dod16 re8. si16]
    dod8.[la16 \f dod8. mi16 dod8. la16]
    si8.[(mi16) red8. (mi16) red8. (mi16)]

    %19
    la4-! la4. (sold16 la)
    sold4.-+la16 si mi,4
    r8 r16 la,16 [dod8. mi16 dod8. la16]

    %22
    si8.[(mi16) red8. (mi16) red8. (mi16)]
    la4-! la4. (sold16 la)
    sold4.-+la16 si mi,4

    %25
    r8 la-! la(sol) sol-+(fad)
    fad-! re'-! re(dod) si-+(la)
    sold?-!-+ dod-! dod-+(si) si-+(la)

    %28
    la-+(si) si-+(la) la-+(sold)
    la,-! la'-! la(sol) sol-+(fad)
    fad-! re'-! re(dod) si-+(la)

    %31
    sold?-!-+ dod-! dod-+(si) si-+(la)
    la-+(si) si-+(la) la-+(sold)\mbreak
    la dod,4\f mi la8~

    %34
    la sold4 si re,8~
    re dod4 mi sol8
    fad8.[mi16 re8. dod16 si8. re16]

    %37
    dod8 dod4 mi  la8~
    la sold4 si re,8~
    re dod4 mi sol8

    %40
    fad8.[mi16 re8. dod16 si8. re16]
    dod4 dod'4. \p(si16-+  la)
    si8.[(red,16) mi8. (red16) mi8. (sold16)]

    %43
    la4-! la4.(sold16-+ fad)\mbreak
    sold8.[(si,16) dod8.(si16) dod8.(mi16)]
    fad4-! fad4.(mi16-+ re)

    %46
    mi8.[(sold,16) la8. (sold16) la8.(dod16)]
    re4~re8 dod16 si re(dod) si(la)
    si4 mi,2

    %49
    r4 dod''4.\p (si16-+  la)
    si8.[(red,16) mi8. (red16) mi8. (sold16)]
    la4-! la4.(sold16-+ fad)\mbreak

    %52
    sold8.[(si,16) dod8.(si16) dod8.(mi16)]
    fad4-! fad4.-! mi16-+ re
    mi8.[(sold,16) la8. (sold16) la8.(dod16)]

    %55
    re4~re8 dod16 si re(dod) si(la)
    si4 mi,\f re
    dod16 dod' mi la dod, dod mi la dod, dod mi la

    %58
    dod, dod dod dod dod dod dod dod dod dod dod dod
    re re fad la re, re fad la re, re fad la
    red, red red red red red red red red red red red\mbreak

    %61
    mi4 mi'2~
    mi2.~
    mi4 la,2~

    %64
    la8 si16 la sold la fad sold mi fad re mi
    dod dod mi la dod, dod mi la dod, dod mi la
    dod, dod dod dod dod dod dod dod dod dod dod dod

    %67
    re re fad la re, re fad la re, re fad la
    red, red red red red red red red red red red red\mbreak
    mi4 mi'2~

    %70
    mi2.~
    mi4 la,2~
    la8.\tuplet 3/2 { sold32(fad sold) } sold2-+

    %73
    la2.\p~
    la~
    la~

    %76
    la4 re do
    si-+ mi re
    do re do

    %79
    si do si
    la8(do) si(re) do-+(si)
    do4 la2~

    %82
    la2.~\mbreak
    la2.~
    la4 re do

    %85
    si-+ mi re
    do re do
    si do si

    %88
    la8(do) si(re) do-+(si)
    do4 do,8.\f[re16 mi8.-+ fa16]
    sol2.~

    %91
    sol4 fa8.[mi16 re8. do16]
    si8.(do16) \afterGrace do2-+ ({si16 [do)]}
    re4 sol-!\p sol-!

    %94
    sol(fad) fa-!\mbreak
    fa mi8.[(sol16) si,8.(re16)]
    do8.[(mi16) re8.(fa16) mi8.-+(re16)]

    %97
    mi4 do8.\f[re16 mi8.-+ fa16]
    sol2.~
    sol4 fa8.[mi16 re8. do16]

    %100
    si8.(do16) \afterGrace do2-+ ({si16 [do)]}
    re4 sol-!\p sol-!
    sol(fad) fa-!

    %103
    fa(mi8.)[sol16 do,8. mi16]
    re8. (mi32 fa) re2-+
    do4\f mi-! sol-!\mbreak

    %106
    re8. (mi16) mi2-+
    fa4-! fa la-!
    mi8.(fad16) \afterGrace fad2-+ ({mi16[fad)]}

    %109
    sol4 si-! si-!
    si(la8.-+)[sol16 fad8.-+ mi16]
    red  si\f la sol la sol fad mi fad mi red dod

    %112
    \once\stemUp si8 fad''-! \p fad(sol) sol(lad-+)
    si16 si,\f la sol la sol fad mi fad mi red dod
    \once\stemUp si8 fad''-! \p fad(sol) sol(lad-+)\mbreak

    %115
    si8. si,16 la'4-! la-!
    la2.(
    sol)

    %118
    fad8.[(la16) sol8. (mi16) fad8.(red16)]
    mi4 la4-! la-!
    la2.(

    %121
    sol)
    fad8.(sol32 la) fad2-+
    mi4-! mi4.(fa?16 sol)

    %124
    dod,8 la16(dod) si(re) dod(mi) re(fa) mi(sol)
    fa4-! re4. (mi16 fa)\mbreak
    si,8 sol16(si) la(do) si(re) do(mi) re(fa)

    %127
    mi8. mi16 do'2~\f
    do8. \tuplet 3/2 { do32 si la } si2~
    si8. \tuplet 3/2 { si32 la sold } la4 mi-+

    %130
    fa8.[mi16 re8. do16 si8. la16]
    \tuplet 3/2 {
        mi8(sold si) mi,[(la do)] mi,(fad red')
        mi,(sold? si) mi,[(la do)] mi,(fad red')
    }

    %133
    mi,2.\mbreak
    \tuplet 3/2 {
        fa8(sold si) re[(fa sol)] si(sol re)
        do(la mi) do'[(la mi)] do'(la mi)

        %136
        fa(sold si) re[(fa sol)] si(sol re)
        do(la mi) do'[(la mi)] do'(la mi)
        fa(la do) fa,(la do) fa,(la do)

        %139
        red,(fad la) red,(fad la) red,(fad la)
        mi(la si) mi,(la si) mi,(sold si)
    }
    la-! la,-! do-! mi-! la-! do-!

    %142
    \tuplet 3/2 {
        fa,8\p(sold si) re[(fa sol)] si(sol re)
        do(la mi) do'[(la mi)] do'(la mi)
        fa(sold si) re[(fa sol)] si(sol re)

        %145
        do(la mi) do'[(la mi)] do'(la mi)
        fa(la do) fa,(la do) fa,(la do)
        red,(fad la) red,(fad la) red,(fad la)

        %148
        mi(la si) mi,(la si) mi,(sold si)
    }
    la8. la16 dod8. la16 mi8. dod16
    \once\stemUp la8 la''16-+(sold) la(sold) la(sold) la(sold) la(dod)

    %151
    si8.[mi,16 sold8. mi16 si8. sold16]
    \once\stemUp mi8 si''16-+(la) si(la) si(la) si(la) si(re)\mbreak
    dod(mid,) fad(mid) fad(mid) fad(mid) fad(mid) fad(dod')

    %154
    si(red,) mi(red) mi(red) mi(red) mi(red) mi(si')
    la(dod,) re(dod) re(dod) re(dod) re(dod) re(la')
    sold la si la sold fad mi re mi re dod si

    %157
    dod8. [la16 dod8. la16 mi8. dod16]\mbreak
    \once\stemUp la8 la''16-+(sold) la(sold) la(sold) la(sold) la(dod)
    si8.[mi,16 sold8. mi16 si8. sold16]

    %160
    \once\stemUp mi8 si''16-+(la) si(la) si(la) si(la) si(re)
    dod(mid,) fad(mid) fad(mid) fad(mid) fad(mid) fad(dod')
    si(red,) mi(red) mi(red) mi(red) mi(red) mi(si')

    %163
    la(dod,) re(dod) re(dod) re(dod) re(dod) re(la')\mbreak
    sold la si la sold fad mi re mi re dod si
    la(mi') dod'(mi,) la,(mi') dod'(mi,) la,(mi') dod'(mi,)

    %166
    sold, (mi') si' (mi,) sold, (mi') si' (mi,) sold, (mi') si' (mi,)
    fad,(red') la' (red,) fad,(red') la' (red,) fad,(red') la' (red,)
    mi,(re'!) sold(re) mi,(re') sold(re) mi,(re') sold(re)

    %169
    la(mi') dod'(mi,) la,(mi') dod'(mi,) la,(mi') dod'(mi,)
    sold, (mi') si' (mi,) sold, (mi') si' (mi,) sold, (mi') si' (mi,)
    fad,(red') la' (red,) fad,(red') la' (red,) fad,(red') la' (red,)

    %172
    mi, si' sold' si, mi, si' sold' si, re, sold si re,\mbreak
    dod la dod mi la mi la dod mi dod mi la
    la2.~

    %175
    \once\stemDown la16 re,, fad la re fad, la re fad re fad si
    si2.~
    \once\stemDown si16 \stemUp mi,, sold si\stemNeutral mi si mi sold si sold si mi

    %178
    mi2.~
    mi~\mbreak
    mi8 mi16 mi mi fad, re' re re mi, dod' dod

    %181
    dod re, si' si si dod, la' la la4~
    la8 si16 la sold la fad sold mi fad re mi
    \once\stemDown dod la, dod mi la mi la dod mi dod mi la

    %184
    la2.~
    \once\stemDown la16 re,, fad la re fad, la re fad re fad si
    si2.~

    %187
    \once\stemDown si16 \stemUp  mi,, sold si\stemNeutral mi si mi sold si sold si mi
    mi2.~
    mi~\mbreak

    %190
    mi8 mi16 mi mi fad, re' re re mi, dod' dod
    dod re, si' si si dod, la' la la4~
    la8.(\tuplet 3/2 { sold32 fad sold)} sold2-+\mbreak

    %193
    la4-! la\p(sold)
    fad(mi red)
    mi2.~

    %196
    mi2 red4-+
    mi mi\f-! mi-!
    fad~\tuplet 3/2 { fad8 sold la si dod re }

    %199
    sold,4.-+ mi8 la4. re,8 si2-+
    la4-! la'\p(sold
    fad mi red)\mbreak

    %202
    mi2.~
    mi2 red4-+
    mi mi\f-! mi-!

    %205
    fad~\tuplet 3/2 { fad8 sold la si dod re }
    sold,4.-+ mi8 la4. re,8 si2-+
    la1.

}

VIIvlIIn = \relative do'' {

    r8 r16 la' [dod8. la16 mi8. dod16]
    la4-! la-! la-!
    <<
        {
            fad-! fad4. sold16 la

            %4
            mi2.\fermata
        }\\{
            si
            dod
        }
    >>
    r4 dod'2\p~
    dod4 si2~

    %7
    si4 la2~
    la4 la sold_+
    la8. [la'16\f  dod8. la16 mi8. dod16]

    %10
    la4-! la-! la-!
    <<
        {
            fad-! fad4. sold16 la
            mi2.\fermata
        }\\{
            si
            dod
        }
    >>

    %13
    r4 dod'2\p~
    dod4 si2~
    si4 la2~

    %16
    la4 la sold_+
    la8.[la16\f dod8. mi16 dod8. la16]
    si8.[(mi16) red8. (mi16) red8. (mi16)]

    %19
    la4-! la4. (sold16 la)
    sold4.-+la16 si mi,4
    r8 r16 la,16 [dod8. mi16 dod8. la16]

    %22
    si8.[(mi16) red8. (mi16) red8. (mi16)]
    la4-! la4. (sold16 la)
    sold4.-+la16 si mi,4

    %25
    R2.
    r8 fad-! fad(mi) re(dod)\mbreak
    si(mi) mi-+(re) re-+(dod)

    %28
    dod(re) re-+(dod) dod-+(si)
    dod2.
    r8 fad-! fad(mi) re(dod)\mbreak

    %31
    si(mi) mi-+(re) re-+(dod)
    dod(re) re-+(dod) dod-+(si)
    dod8 dod4\f mi la8~

    %34
    la sold4 si re,8~
    re dod4 mi sol8
    fad8.[mi16 re8. dod16 si8. re16]

    %37
    dod8 dod4 mi la8~
    la sold4 si re,8~
    re dod4 mi sol8

    %40
    fad8.[mi16 re8. dod16 si8. re16]
    dod4\p (mi) fad~
    fad8. si,16 si4. mi8~

    %43
    mi(dod) re-+(dod) re4~
    re8. sold,16 sold4. dod8
    dod(la) si-+(la) si4~

    %46
    si8. mi,16 mi4. la8
    la4 si la
    sold8.-!\f\tuplet 3/2 { sold32 (la si) }\afterGrace si2-+({la16[si)]}\mbreak

    %49
    dod4\p mi fad~
    fad8. si,16 si4. mi8
    mi(dod) re-+(dod) re4~

    %52
    re8. sold,16 sold4. dod8
    dod(la) si-+(la) si4~
    si8. mi,16 mi4. la8

    %55
    la4 si la
    sold mi\f re
    dod16 dod' mi la dod, dod mi la dod, dod mi la

    %58
    dod, la la la la la la la la la la la\mbreak
    la re fad la re, re fad la re, re fad la
    red, la la la la la la la la la la la

    %61
    sold8 si16 si dod dod re re dod dod si si
    dod dod si si dod dod  re re dod dod si si
    dod dod mi mi fad fad sol sol fad fad mi mi\mbreak

    %64
    fad16 la si la sold la fad sold mi fad re mi
    dod dod mi la dod, dod mi la dod, dod mi la
    dod, la la la la la la la la la la la

    %67
    la re fad la re, re fad la re, re fad la
    red, la la la la la la la la la la la
    sold8 si16 si dod dod re re dod dod si si

    %70
    dod dod si si dod dod  re re dod dod si si
    dod dod mi mi fad fad sol sol fad fad mi mi
    fad sold ?mi fad re mi dod re si dod re si

    %73 Minore
    do2.\p~
    do~
    do~

    %76
    do4 si la\mbreak
    sold8(mi') do'(mi,) si'(mi,)
    la(mi) si'(mi,) la(mi)

    %79
    sold(mi) la(mi) sold(re)
    dod(la') sold(si) la-+(sold)
    la4 do,2~

    %82
    do2.~
    do~
    do4 si la\mbreak

    %85
    sold8(mi') do'(mi,) si'(mi,)
    la(mi) si'(mi,) la(mi)
    sold(mi) la(mi) sold(re)

    %88
    dod(la') sold(si) la-+(sold)
    la4 do,8.\f[re16 mi8.-+ fa16]
    sol2.~

    %91
    sol4 fa8.[mi16 re8. do16]
    si8.(do16) \afterGrace do2-+ ({si16 [do)]}
    re4 si4.\p(do16 re)

    %94
    do4 re2
    sol,4 sol fa
    mi8(do') si(re) do-+(si)

    %97
    do4 do8.\f[re16 mi8.-+ fa16]
    sol2.~
    sol4 fa8.[mi16 re8. do16]

    %100
    si8.(do16) \afterGrace do2-+ ({si16 [do)]}
    re4 si4.\p(do16 re)
    do4 re2

    %103
    sol,4 do sol
    la8.(si32 do) si2-+
    do4\f mi sol-!

    %106
    re8.(mi16) mi2-+
    fa4-! fa la-!
    mi8.(fad16) \afterGrace fad2-+ ({mi16[fad)]}

    %109
    sol4 si-! si-!
    si(la8.-+)[sol16 fad8.-+ mi16]
    red  si\f la sol la sol fad mi fad mi red dod

    %112
    \once\stemUp si8 [red'-!\p red(mi)] mi(fad16 mi)
    red  si\f la sol la sol fad mi fad mi red dod
    \once\stemUp si8 [red'-!\p red(mi)] mi(fad16 mi)

    %115
    red2.
    r4 si-! si-!
    si2.

    %118
    do4 si8.(sol16) la8.(fad16)]\mbreak
    mi2.
    r4 si' si

    %121
    si2 mi4~
    mi mi red-+
    mi-!  mi4.(fa16 sol)

    %124
    dod,8 la~la la16(dod) si (re) dod(mi)
    re4 re4.(mi16 fa)
    si,8-! sol~sol sol16(si) la(do) si(re)

    %127
    do4 mi4.\f \tuplet 3/2 { mi16 re do }
    re2~re8.\tuplet 3/2 { re32 do si }\mbreak
    do2 la4~

    %130
    la fa8.[mi16 re8. do16]
    si8 sold' la4 fad
    sol la fad

    %133
    sold2.
    <<
        {
            fa?\p
            mi

            %136
            fa
            mi
            fa

            %139
            fad
            mi2 mi4
            mi2.

            %142
            fa
            mi
            fa\mbreak

            %145
            mi
            fa
            fad
        }\\{
            re
            do
            re
            do
            do
            do
            si2 si4
            do2.
            re
            do
            re\mbreak
            do
            do
            do
        }
    >>

    %148
    <mi si>2 <mi si>4
    <mi dod>8.[la16 dod8. la16 mi8. dod16] % Maggiore
    \once\stemUp la8 la''16-+(sold) la(sold) la(sold) la(sold) la(dod)


    %151
    si8.[mi,16 sold8. mi16 si8. sold16]
    \once\stemUp mi8 si''16-+(la) si(la) si(la) si(la) si(re)\mbreak
    dod(mid,) fad(mid) fad(mid) fad(mid) fad(mid) fad(dod')

    %154
    si(red,) mi(red) mi(red) mi(red) mi(red) mi(si')
    la(dod,) re(dod) re(dod) re(dod) re(dod) re(la')
    sold la si la sold fad mi re mi re dod si

    %157
    dod8. [la16 dod8. la16 mi8. dod16]\mbreak
    \once\stemUp la8 la''16-+(sold) la(sold) la(sold) la(sold) la(dod)
    si8.[mi,16 sold8. mi16 si8. sold16]

    %160
    \once\stemUp mi8 si''16-+(la) si(la) si(la) si(la) si(re)
    dod(mid,) fad(mid) fad(mid) fad(mid) fad(mid) fad(dod')
    si(red,) mi(red) mi(red) mi(red) mi(red) mi(si')

    %163
    la(dod,) re(dod) re(dod) re(dod) re(dod) re(la')\mbreak
    sold la si la sold fad mi re mi re dod si
    dod la la dod dod la la dod dod la la dod

    %166
    si sold sold si si sold sold si si sold sold si
    la fad fad la la fad fad la la fad fad la
    sold mi mi sold sold mi mi sold sold mi mi si'

    %169
    dod la la dod dod la la dod dod la la dod
    si sold sold si si sold sold si si sold sold si
    la fad fad la la fad fad la la fad fad la

    %172
    mi si' sold' si, mi, si' sold' si, re, sold si re,\mbreak
    dod la dod mi la mi la dod mi dod mi la
    la8 mi16 mi fad fad sol sol fad fad mi mi\mbreak

    %175
    \once\stemDown  fad re, fad la re fad, la re fad re fad si
    si8 fad16 fad sold? sold la la sold sold fad fad
    \once\stemDown sold mi, sold si mi si mi sold si mi, sold si

    %178
    mi,8 si16 si dod dod re re dod dod si si
    dod dod si si dod dod re re dod dod si si\mbreak
    dod8 dod4 si la8~\mbreak

    %181
    la sold mi dod mi dod
    fad8. re'16 si4 sold_+
    la16 la, dod mi la mi la dod mi dod mi la

    %184
    la8 mi16 mi fad fad sol sol fad fad mi mi\mbreak
    \once\stemDown  fad re, fad la re fad, la re fad re fad si
    si8 fad16 fad sold? sold la la sold sold fad fad

    %187
    \once\stemDown sold mi, sold si mi si mi sold si mi, sold si
    mi,8 si16 si dod dod re re dod dod si si
    dod dod si si dod dod re re dod dod si si\mbreak

    %190
    dod8 dod4 si la8~\mbreak
    la sold mi dod mi dod
    fad re' si2-+

    %193
    la4 mi'\p(re)
    dod(si la)
    sold8(si) dod(mi) si(re)

    %196
    dod(la) si(sold) la(fad)
    sold4 mi'\f-! mi-!
    fad~\tuplet 3/2 { fad8 sold la si dod re }

    %199
    sold,4.-+ mi8 la4. re,8 si2-+
    la4-! mi'\p(re)
    dod(si) la

    %202
    sold8(si) dod(mi) si(re)
    dod(la) si(sold) la(fad)
    sold4 mi'\f-! mi-!

    %205
    fad~\tuplet 3/2 { fad8 sold la si dod re }
    sold,4.-+ mi8 la4. re,8 si2-+
    la1.

}

VIIvlan = \relative do' {

    <<la'2.\\\stemUp la,\\\stemDown la>>
    <<la'2.\\\stemUp dod,\\\stemDown dod>>
    <<la'2.\\\stemUp si,\\\stemDown si>>
    <<la'2.\fermata\\\stemUp dod,\\\stemDown dod>>
    r4 r r16 la'\p si dod
    fad,2 r16 sold la si
    mi,2 r16 mi re dod
    fad4 mi mi
    <<la2.\f\\\stemUp la,\\\stemDown la>>
    <<la'2.\\\stemUp dod,\\\stemDown dod>>
    <<la'2.\\\stemUp si,\\\stemDown si>>
    <<la'2.\fermata\\\stemUp dod,\\\stemDown dod>>
    r4 r r16 la'\p si dod
    fad,2 r16 sold la si
    mi,2 r16 mi re dod
    fad4 mi mi_+
    mi2.
    r4 si \f si
    dod8.[mi16 red8. fad16 si,8. red16]
    mi4 mi re_+
    dod2.
    r4 si si
    dod8.[mi16 red8. fad16 si,8. red16]
    mi4 mi re
    dod2.
    la4 fad'2
    mi2.
    mi4 mi mi
    mi mi2
    la,4 fad'2
    mi2.
    mi4 mi mi
    mi dod8.\f[mi16 la,8. dod16]
    dod8.(si16) si4. si8
    si8.(la16) la4 mi'\mbreak
    la, la sold
    la dod8.[mi16 la,8. dod16]
    dod8.(si16) si4. si8
    si8.(la16) la4 mi'\mbreak
    la, la sold_+
    la la'2\f
    sold2.
    fad
    mi
    re
    dod\mbreak
    si4 sold la
    mi' mi re
    dod la'2\f
    sold2.
    fad
    mi
    re
    dod
    si4 sold la
    mi' mi re
    dod2.\mbreak

    %58
    r16 mi mi mi mi mi mi mi mi mi mi mi
    <<fad2.\\re>>
    r16 si si si si si si si si si si si
    si8 sold'16 sold la la si si la la sold sold
    la la sold sold la la si si la la sold sold\mbreak
    la la dod dod re re mi mi re re dod dod
    <<{si4 si}\\{fad mi}>> sold-+
    la2.
    r16 mi mi mi mi mi mi mi mi mi mi mi
    <<fad2.\\re>>
    r16 si si si si si si si si si si si
    si8 sold'16 sold la la si si la la sold sold
    la la sold sold la la si si la la sold sold\mbreak
    la la dod dod re re mi mi re re dod dod
    si4 mi, mi

    %73
    mi2.\p
    fa
    mi~
    mi4 re fa
    mi la, mi'
    la(sold_+ la)
    mi la, mi'
    la mi mi
    mi2.
    fa
    mi~
    mi4 re fa
    mi la, mi'
    la(sold_+ la)
    mi la, mi'
    la mi mi
    mi2.
    r4 mi8.\f[fa16 sol8. mi16]
    la2 r16 sol fa mi
    re4 mi2
    si4 sol\p sol
    la2 si4
    do2 sol4
    do sol' sol,
    do2.\mbreak
    r4 mi8.\f[fa16 sol8. mi16]
    la2 r16 sol fa mi
    re4 mi2
    si4 sol\p sol
    la2 si4
    do2 mi4
    fa_+ sol sol,
    do2.\f
    sib
    la
    do\mbreak
    si4 si' sol
    do2 la8._+ sol16
    fad si\f la sol la sol fad mi fad mi red dod
    si8 si' mi,4 do
    si16 si'\f la sol la sol fad mi fad mi red dod
    si8 si' mi,4 do?
    si fad' fad
    fad?2.~\mbreak
    fad4 mi2~
    mi4 si4. la8
    sol4 fad' fad
    fad?2.~
    fad4 mi2
    do4 si la
    sol2.
    r4 mi' la,
    la2.
    r4 re sol,
    sol2 r8 r16 sol'\f\mbreak
    sol2 r8 r16 mi
    mi2 r8 r16 mi
    mi4 fa2
    mi8 si do4 la
    si do la
    si2.
    si\p
    la
    si
    la
    la
    la
    la2 sold4
    la2.
    si
    la
    si
    la
    la
    la
    la2 sold4

    %149
    la8. la'16 dod8. la16 mi8. dod16
    la8 <mi' la,> <mi la,> <mi la,> <mi la,> <mi la,>
    <mi sold,>8. mi'16 sold8. mi16 si8. sold16
    mi8 <mi si> <mi si> <mi si> <mi si> <mi si> \mbreak
    <mi la,> la,4 dod fad8~
    fad sold,4 si mi8~
    mi la,4 si re8~
    re re'16 dod si8 sold si sold
    la8. la16 dod8. la16 mi8. dod16
    la8 <mi' la,> <mi la,> <mi la,> <mi la,> <mi la,>
    <mi sold,>8. mi'16 sold8. mi16 si8. sold16
    mi8 <mi si> <mi si> <mi si> <mi si> <mi si> \mbreak
    <mi la,> la,4 dod fad8~
    fad sold,4 si mi8~
    mi la,4 si re8~
    re re'16 dod si8 sold si sold
    la4. r16 mi [mi8. mi16]
    mi4. r16 mi[mi8. mi16]
    red4. r16 si[si8. si16]
    si4. r16 mi[mi8. mi16]
    mi4. r16 mi[mi8. mi16]
    mi4. r16 mi[mi8. mi16]
    red4. r16 si[si8. si16]
    si4. r16 mi [si'8. re,16]
    dod2.
    r8 dod'16 dod re re mi mi re re dod dod
    re2.
    r8 red16 red mi mi fad fad mi mi red red
    mi2.\mbreak
    r8 sold,16 sold la la si si la la sold sold
    la la sold sold la la si si la la sold sold
    la8 mi fad4 mi
    re dod8 mi la,4
    si8. fad'16 mi4 mi
    mi2.
    r8 dod'16 dod re re mi mi re re dod dod
    re2.
    r8 red16 red mi mi fad fad mi mi red red
    mi2.\mbreak
    r8 sold,16 sold la la si si la la sold sold
    la la sold sold la la si si la la sold sold
    la8 mi fad4 mi
    re dod8 mi la,4
    si8. fad'16 mi4 re
    dod dod'\p(si)
    la(sold fad)
    mi8(sold) la(dod) sold(si)
    la(fad) sold(mi) fad(si,)
    mi4 sold\f-! sold-!
    la si2
    mi, mi4. la8 sold2_+\mbreak
    la4 dod\p(si)
    la(sold fad)
    mi8(sold) la(dod) sold(si)
    la(fad) sold(mi) fad(si,)
    mi4 sold\f-! sold-!
    la si2
    mi, mi4. la8 sold2_+
    la1.

}


VIIbcn = \relative do {

    la'2.
    fad
    re

    %4
    la\fermata
    r8 r16 la'[dod8. la16 mi8. dod16]
    re8.[fad16 si8. fad16 re8. si16]

    %7
    dod8.[mi16 la8. mi16 dod8. la16]
    re4 mi mi,
    la la'2\mbreak

    %10
    fad2.
    re
    la\fermata

    %13
    r8 r16 la'[dod8. la16 mi8. dod16]
    re8.[fad16 si8. fad16 re8. si16]
    dod8.[mi16 la8. mi16 dod8. la16]

    %16
    re4 mi mi,
    la la'2\f
    sold2.

    %19
    fad
    mi8.[mi16 sold8. si16 sold8. mi16]
    la,4 la'2

    %22
    sold2.
    fad
    mi4 mi re

    %25
    dod2.
    re4 si2
    mi2.

    %28
    mi,
    la4 dod2
    re4 si2\mbreak

    %31
    mi2.
    mi,
    la8.[mi'16\f la8. mi16 dod8. la16]

    %34
    si8.[sold'16 si8. sold16 re8. si16]
    dod8.[mi16 la8. mi16 dod8. la16]
    re4 mi mi,

    %37
    la8.[mi'16 la8. mi16 dod8. la16]
    si8.[sold'16 si8. sold16 re8. si16]
    dod8.[mi16 la8. mi16 dod8. la16]

    %40
    re4 mi mi,
    la2.
    R2.*6

    %48
    r8 r16 mi'[sold8. si16 sold8. mi16]
    la,4 r r
    R2.*6

    %56
    r4 mi' re
    dod2.\mbreak
    r16 sol' sol sol sol sol sol sol sol sol sol sol

    %59
    fad2.
    r16 fa fa fa fa fa fa fa fa fa fa fa
    mi2 mi,4

    %62
    la2 mi4
    la2 dod4
    re8. si16 mi4 mi,

    %65
    la2.\mbreak
    r16 sol' sol sol sol sol sol sol sol sol sol sol
    fad2.

    %68
    r16 fa fa fa fa fa fa fa fa fa fa fa
    mi2 mi,4
    la2 mi4

    %71
    la2 dod4
    re mi mi,\mbreak
    <<
        {
            la8\p_! la_!  \slurDown do(mi) la(do)

            %74
            fa,,_! fa_! la(do) fa(la)
            do,,_! do_! mi(la) do(mi)
        }\\{
            la,2.
            fa
            do
        }
    >>
    re

    %77
    mi\tasto~
    mi~
    mi~

    %80
    mi
    <<
        {
            la8_! la_!  \slurDown do(mi) la(do)
            fa,,_! fa_! la(do) fa(la)

            %83
            do,,_! do_! mi(la) do(mi)
        }\\{
            la,2.
            fa
            do
        }
    >>
    \slurNeutral re
    mi\tasto ~

    %86
    mi~
    mi~
    mi

    %89
    la
    r4 do8.\f[re16 mi8. do16]\mbreak
    fa4 re8.[mi16 fa8. re16]

    %92
    sol4 do,2
    sol2.
    R2.*4

    %98
    r4 do8.\f[re16 mi8. do16]\mbreak
    fa4 re8.[mi16 fa8. re16]
    sol4 do,2

    %101
    sol2.
    R2.*3\mbreak
    r4 do8.\f[re16 mi8. do16]

    %106
    sol'4 sol,2
    re'4 re8.[mi16 fa8. re16]
    la'4 la,2

    %109
    mi'4 sol8.[si16 mi,8. sol16]
    la,2.
    si16 si'\f la sol la sol fad mi fad mi red dod

    %112
    si2.\mbreak
    r16 si'\f la sol la sol fad mi fad mi red dod
    si2.

    %115
    R
    r8 r16 si'[red8. fad16 red8. si16]
    mi2 sol,4

    %118
    la si si,
    do2.
    r8 r16 si[red8. fad16 red8. si16]\mbreak

    %121
    mi2 sol4
    la si si,
    mi sol mi

    %124
    la2 la,4
    re fa re
    sol2 sol,4

    %127
    do2 r8 r16 do\f
    sol'2 r8 r16 sold
    la2 r8 r16\tuplet 3/2 { do,32 si la }\mbreak

    %130
    re2.
    mi\tasto~
    mi~

    %133
    mi8 mi,-! sold-! si-! mi-! sold?
    sold,2.\p
    la

    %136
    sold
    la
    fa

    %139
    red
    mi\mbreak
    <<{la8_! la_! do_! mi_! la_! do_!}\\la,2.>>

    %142
    sold
    la
    sold

    %145
    la
    fa
    red

    %148
    mi
    la8.[la'16 dod8. la16 mi8. dod16]
    la8 la dod mi dod la\mbreak

    %151
    mi'8.[mi'16 sold8. mi16 si8. sold16]
    mi8 mi sold si sold mi
    la, la' la la la la

    %154
    sold sold sold sold sold sold
    fad fad fad fad fad  fad
    mi mi, mi mi mi mi

    %157
    la8.[la'16 dod8. la16 mi8. dod16]
    la8 la dod mi dod la\mbreak
    mi'8.[mi'16 sold8. mi16 si8. sold16]

    %160
    mi8 mi sold si sold mi
    la, la' la la la la
    sold sold sold sold sold sold

    %163
    fad fad fad fad fad  fad
    mi mi, mi mi mi mi
    la4. r16 la'[dod8. la16]

    %166
    mi'4. r16 mi,[sold8. mi16]
    si'4. r16 si,[red8. si16]
    mi4. r16 mi,[sold8. mi16]

    %169
    la4. r16 la'[dod8. la16]
    mi'4. r16 mi,[sold8. mi16]
    si'4. r16 si,[red8. si16]

    %172
    mi4. r16 mi[si'8. re,16]\mbreak
    dod2.
    r8 la' re dod re la

    %175
    re,2.
    r8 si' mi red mi si
    mi,2.

    %178
    r8 mi la sold la mi
    la, mi' la sold la mi
    la, dod' re, si' dod, la'\mbreak

    %181
    si, sold' la, la' dod, la
    re8. si16 mi4 mi,
    la2.

    %184
    r8 la' re dod re la
    re,2.
    r8 si' mi red mi si

    %187
    mi,2.
    r8 mi la sold la mi
    la, mi' la sold la mi

    %190
    la, dod' re, si' dod, la'\mbreak
    si, sold' la, la' dod, la
    re8. si16 mi4 mi,

    %193
    la r r
    R2.*3
    r4 mi''\f mi

    %198
    mi re re\mbreak
    re2 dod4. re8 mi4 mi,
    la, r r

    %201
    R2.*3
    r4 mi' \f mi
    mi re re

    %206
    re2 dod4. re8 mi4 mi,
    la1.

}

VIIbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2.
    <5>2 s4 <6 5>2.
    s
    s
    <9 7>8 s <7>4 s
    <9 7> <8> s
    <9 7> <4> <7>
    s2.
    <5>2 s4 <6 5>2.
    s
    s4 <_> <_>8 <_>
    <9 7>8 s <7>4 <7>8. s16
    <9 7>4 <8> s
    <9 7> <4> <7>
    s2.
    <6>
    <7>4 <6+\\> s
    s <5/> <5/>
    s2.
    <6>
    <7>4 <6+\\> s
    <_>2 <_>4
    <5/>2.
    <9>4 <7>2
    s2 <6 4>4
    <7> <6 4> <7>
    s <5/>2
    <9>4 <7>2
    s2 <6 4>4
    <7> <6 4> <7>
    s2.
    <9 7>4 <6\\> s
    <9 7> <8> s
    <6 5> <7> s
    s2.
    <9 7>4 <6\\> <6\\>
    <9 7> <8> s
    <6 5> <7> s
    s2.*7
    s8 s16 <7> s2
    s2.*7
    s4 <_> <_>
    <6>2.
    s16 <4\+> s8 s2
    <6>2.
    s16 <6\\+> s8 s2
    s2 <7>4
    s2 <7>4
    s2 <6>8 s
    <6 5>4 <4> <7>
    s2.
    s16 <4\+> s8 s2
    <6>2.
    s16 <6\\+> s8 s2
    s2 <7>4
    s2 <7>4
    s2 <6>8 s
    <6 5>4 <4> <7>
    s2.
    <5>
    <6>
    <9 7>4 <6 5> s
    <_+>2.
    s2.*2
    <7 _+>2.
    s
    <5>
    <6>
    <9 7>4 <6 5> s
    <_+>2.
    s
    s
    <7 _+>
    s2.
    s
    <9 7>8 s <7>4 s
    <7>2.
    s2.*6
    <9 7>8 s <7>4 s
    <7>2.
    s2.*5
    <6 5 _->2 <_->4
    s2.
    <6+ 5>4 <5>2
    s4 <6> <6>
    <9 7> s <6+ 5>
    <_+>2 <_+>8 <_+>16 s
    <_+>2.
    s16 <_+> <_+>8 <_+>4 <_+>8 <_+>16 s
    <_+>2.
    s
    <7 _+>
    <9>4 <8> <6>
    <6+ 5> <4> <7 _+>
    <5> <6\\> s
    <7 _ _+>2 <_>4
    <9 > <8> <6>
    <6+ 5> <4> <7 _+>
    s2.
    <7 _+>
    s
    <7>
    s
    <5 4>4 <3> s8 s16 <5/>
    <9>4 <8> s
    <9 7> s <6 5>
    <_+>2.
    s
    <_+>2 <_+>4
    <7/>2.
    s
    <7/>
    s
    <5>
    <7/>
    <5 4>4 <5 4> <7 _+>
    s2.
    <7/>2.
    s
    <7/>
    s
    <5>
    <7/>
    <5 4>4 s <7 _+>
    s2.
    s
    <7>
    <_>2 <_>4
    s2 <6>4
    <7> <6> s
    <7> <6> s
    <7>2.
    s
    s
    <7>
    <_>2 <_>4
    s2 <6>4
    <7> <6> s
    <7> <6> s
    <7>2.
    s
    s
    <7 _+>
    s4. s16 <7> s4
    s2.
    s
    <7 _+>
    <_>2 <_>4
    <6>2.
    s8 <7-> s <5/> s <7->
    s2.
    s8 <7 _+> s <5/> s <7 _+>
    s2.
    s8 <7> s <5/> s <7>
    s8 <7> s <5/> s <7>
    s4 <9 7>16 s <7> s <9 7>8 <8>
    <9 7> <5/> <9> <8> <8>4
    <6 5> <4> <7>s2.
    s8 <7-> s <5/> s <7->
    s2.
    s8 <7 _+> s <5/> s <7 _+>
    s2.
    s8 <7> s <5/> s <7>
    s8 <7> s <5/> s <7>
    s4 <9 7>16 s <7> s <9 7>8 <8>
    <9 7> <5/> <9> <8> <8>4
    <6 5> <4> <7>
    s2.*4
    \bassFigureExtendersOff s2 <6 5>4
    <2> <6 5> s
    <4\+>2 <6>4. <6 5>8 <4>4 <7>
    s2.*4
    s4 <6 5> s
    <2> <6 5> s
    <4\+>2 <6>4. <6 5>8 <4>4 <7>

}

forma = {

    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \key la\major
    \tempo 2. = 45
    s2.*72\break
    \once\override Score.RehearsalMark.extra-offset = #'(+0 . +1)
    \mark\markup\huge "M[ino]re]"
    \key la\minor
    s2.*76\break
    \once\override Score.RehearsalMark.extra-offset = #'(+0 . +1)
    \mark\markup\huge "[Maggiore]"
    \key la\major
    s2.*50%\break
    \time 3/2
    \tempo 1 = 40
    s1.
    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \tempo 2. = 45
    s2.*6
    \time 3/2
    \tempo 1 = 42
    s1.*2
    \bar"|."

}



VIIvlI = {
    \global
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    \global
    <<\VIIvlIIn \forma>>

}


VIIvla = {
    \global
    \clef alto
    <<\VIIvlan \forma>>

}

VIIbc = {
    \global
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Concert de simphonies Op. IV n. IV}
    composer = \markup \center-column{"A. Dauvergne (1713-1797)"}

}

\markup \huge \column{"[1.] Ouverture"\vspace #-0.3" " }

\score {

    \new ChoirStaff <<

        \new Staff  = "main" <<
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
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Ivla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \Ibc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

\pageBreak

\markup \huge \column{"[2.] Minuetto grazioso" }

\score {

    \new ChoirStaff <<

        \new Staff  = "main" <<
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
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \IIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

\pageBreak

\markup \huge \column{"[3.] Andante" }

\score {

    \new ChoirStaff <<

        \new Staff  = "main" <<
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
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IIIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \IIIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

%\pageBreak

\markup \huge \column{"[4.] Andantino grazioso cantabile" }

\score {

    \new ChoirStaff <<

        \new Staff  = "main" <<
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
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \IVvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \IVbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

\pageBreak

\markup \huge \column{"[5.] Vivace" }

\score {

    \new ChoirStaff <<

        \new Staff  = "main" <<
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
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \Vvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \Vbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

\pageBreak

\markup \huge \column{"[6.] Presto" }

\score {

    \new ChoirStaff <<

        \new Staff  = "main" <<
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
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \VIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \VIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

\pageBreak

\markup \huge \column{"[7.] Chaconne" }

\score {

    \new ChoirStaff <<

        \new Staff  = "main" <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Primo"}
            \set Staff.shortInstrumentName = "vl1"
            \VIIvlI
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"violin"
            \set Staff.instrumentName = \markup\center-column  {"Violino""Secondo"}
            \set Staff.shortInstrumentName = "vl2"
            \VIIvlII
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"viola"
            \set Staff.instrumentName = \markup  {"Alto Viola"}
            \set Staff.shortInstrumentName = "vla"
            \VIIvla
        >>

        \new Staff
        <<
            \set Staff.midiInstrument = #"cello"
            \set Staff.instrumentName = \markup \center-column{Organo}
            \set Staff.shortInstrumentName = "bc"
            \VIIbc
        >>
    >>

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override StaffGrouper.staff-staff-spacing.padding = #1.5
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
