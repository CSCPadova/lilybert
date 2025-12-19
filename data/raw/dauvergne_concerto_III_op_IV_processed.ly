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

    si4. \tuplet 3/4 { re32 dod si } fad'8. \tuplet 3/2 { re32 dod si } si'8.\tuplet 3/2 { re,32 dod si }
    fad4. \tuplet 3/4 { lad32 sol fad } dod'8.\tuplet 3/2 { lad32 sol fad } mi'8.\tuplet 3/2 { dod32 si lad }
    si,4. \tuplet 3/4 { re32 dod si } fad'8.\tuplet 3/2 { re32 dod si } si'8.\tuplet 3/2 { fad'32 mi re }

    %4
    re4(dod8.) fad16 sol4. \tuplet 3/4 { sol32 fad mi }
    fad4 fad,8. fad16 mi'4. \tuplet 3/4 { mi32 re dod }
    re8. si16 sol'4 mi8. dod16 la'4

    %7
    fad la, sol8.[fad16 mi8. re16]
    la4 la'8. fad'16 sol,8. mi'16 fad,8. [re'16]\mbreak
    mi,4. fad16 sol fad8.[mi16 re8. dod16]

    %10
    re4 la'8. fad'16 sol,8. mi'16 fad,8. [re'16]
    mi,4. fad16 sol fad8.[mi16 re8. dod16]
    re4 fad'8. fad16 mi8. mi16 la4~

    %13
    la sol8. sol16 fad8. fad16 si4
    lad fad2 mid4-+\mbreak
    fad fad,2 mid4-+

    %16
    fad4. \tuplet 3/4 { mi?32 fad sol} fad8.[mi16 re8. dod16] fad1
    r16. fad32 fad16. fad32 fad16. fad32
    sol16. sold32 sold16. sold32 sold16. sold32

    %19
    la16. lad32 lad16. lad32 lad16. lad32
    si16. fad'32 sol16. fad32 mi16. re32\mbreak
    dod16. mi32 fad16. mi32 re16. dod32

    %22
    si16. re32 mi16. re32 dod16. si32
    lad8 dod fad~
    fad si, mi~

    %25
    mi16. dod32 fad16. mi32 re16. dod32
    re16. fad32 sol16. fad32 mi16. re32
    mi16. sol32 la16. sol32 fad16. mi32

    %28
    fad8 la4~\mbreak
    la8 sol16 fad mi re
    dod16. la'32 la16. fad32 sol16. mi32

    %31
    fad16. re32 mi16. dod32 re16. si32
    la4.~
    la~

    %34
    la16. la32 sol'16. sol32 fad16. fad32
    mi16. mi32 re16. re32 dod16. dod32
    re16. re32 la16. re32 fad,16. re'32

    %37
    mi,16. sol'32 fad16. mi32 re16. dod32\mbreak
    re16. la32 re16. re32 fad16. fad32
    mi8 mi la~

    %40
    la16. si,32 mi16. mi32 sol16. sol32
    fad8 fad si~
    si16. dod,32 fad16. fad32 la16. la32

    %43
    sold8 sold dod~
    dod16. re,32 si'16. si32 si16. si32
    si16. dod,32 la'16. la32 la16. la32\mbreak

    %46
    la16. si,32 sold'16. sold32 sold16. sold32
    sold?16. dod,32 fad16. mi32 re16. dod32
    re16. dod32 si16. la32 sold16. fad32

    %49
    mid16. dod'32 dod16. dod32 dod16. dod32
    re16. red32 red16. red32 red16. red32
    mi16. mid32 mid16. mid32 mid16. mid32

    %52
    fad16. fad,32 la16. la32 re8~\mbreak
    re16. re32 si16. si32 mi8~
    mi16. mi32 dod16. dod32 fad8~

    %55
    fad16. fad32 re16. re32 sold16. sold32
    mid16. dod32 si'16. si32 la16. la32
    sold16. sold32 fad16. fad32 mid16. mid32

    %58
    fad16. dod32 la16. dod32 fad,16. la32
    sold16. si32 la16. sold32 fad16. mid32\mbreak
    fad16. fad'32 fad16. fad32 fad16. fad32

    %61
    mid16. dod32 mi16. mi32 mi16. mi32
    red8 fad si~
    si la16.-+ sold32 la16. si32

    %64
    sold16. mi32 mi16. mi32 mi16. mi32
    red16. si32 re16. re32 re16. re32
    dod8 mi la~

    %67
    la sol16-+ fad sol la
    fad8 re sol
    mi dod fad

    %70
    re16. fad32 sol16. fad32 mi16. re32\mbreak
    dod16. mi32 fad16. mi32 re16. dod32
    si16. re32 mi16. re32 dod16. si32

    %73
    lad16. fad'32 fad16. fad32 fad16.-+[(mi64 fad)]\mbreak
    sol16. sold32 sold16. sold32  sold16.-+[(fad64 sold)]
    la16. lad32 lad16. lad32 lad16.-+[(sold64 lad)]

    %76
    si16. si32 mi,16. mi32 re16. re32
    dod16. dod32 si16. si32 lad16. lad32
    si16. si32 fad16. si32 re,16. si'32

    %79
    mi,16. sol32 fad16. mi32 re16. dod32
    si4.

}

IvlIIn = \relative do'' {

    si4. \tuplet 3/4 { re32 dod si } fad'8. \tuplet 3/2 { re32 dod si } si'8.\tuplet 3/2 { re,32 dod si }
    fad4. \tuplet 3/4 { lad32 sol fad } dod'8.\tuplet 3/2 { lad32 sol fad } mi'8.\tuplet 3/2 { dod32 si lad }
    si,4. \tuplet 3/4 { re32 dod si } fad'8.\tuplet 3/2 { re32 dod si } si'8.\tuplet 3/2 { fad'32 mi re }

    %4
    re4(dod8.) fad16 sol4. \tuplet 3/4 { sol32 fad mi }
    fad4 fad,8. fad16 mi'4. \tuplet 3/4 { mi32 re dod }
    re8. si16 sol'4 mi8. dod16 la'4

    %7
    fad la, sol8.[fad16 mi8. re16]
    la4 la'8. fad'16 sol,8. mi'16 fad,8. [re'16]\mbreak
    mi,4. fad16 sol fad8.[mi16 re8. dod16]

    %10
    re4 la'8. fad'16 sol,8. mi'16 fad,8. [re'16]
    mi,4. fad16 sol fad8.[mi16 re8. dod16]
    re4 fad'8. fad16 mi8. mi16 la4~

    %13
    la sol8. sol16 fad8. fad16 si4
    lad fad2 mid4-+\mbreak
    fad fad,2 mid4-+

    %16
    fad4. \tuplet 3/4 { mi?32 fad sol} fad8.[mi16 re8. dod16] fad1
    R4.
    r16. si,32 si16. si32 si16. si32

    %19
    dod16. dod32 dod16. dod32 dod16. dod32
    re8 re sol~
    sol dod, fad~

    %22
    fad si, mi
    fad dod' fad~
    fad si, mi~

    %25
    mi16 dod fad mi re dod
    re fad sol fad mi re
    mi sol la sol fad mi

    %28
    fad8 la4~
    la8 sol16. fad32 mi16. re32
    dod8-+ re8. la16

    %31
    la16. fad32 sol16. mi32 fad16. re32
    la4.~
    la~

    %34
    \once\stemUp la8 sol''16. sol32 fad16. fad32
    mi16. mi32 re16. re32 dod16. dod32
    re16. re32 la16. re32 fad,16. re'32

    %37
    mi,16. sol'32 fad16. mi32 re16. dod32\mbreak
    re16. la32 re16. re32 fad16. fad32
    mi8 mi la~

    %40
    la16. si,32 mi16. mi32 sol16. sol32
    fad8 fad si~
    si16. dod,32 fad16. fad32 la16. la32

    %43
    sold8 sold dod~
    dod16. re,32 si'16. si32 si16. si32
    si16. dod,32 la'16. la32 la16. la32\mbreak

    %46
    la16. si,32 sold'16. sold32 sold16. sold32
    sold?16. dod,32 fad16. mi32 re16. dod32
    re16 dod si la sold fad

    %49
    mid4.
    r16. fad32 fad16. fad32 fad16. fad32
    sold16. sold32 sold16. sold32 sold16. sold32

    %52
    la16. fad32 la16. la32 re8~
    re16. re32 si16. si32 mi8~
    mi16. mi32 dod16. dod32 fad8~

    %55
    fad16. fad32 re16. re32 sold16. sold32
    mid16. dod32 si'16. si32 la16. la32
    sold16. sold32 fad16. fad32 mid16. mid32\mbreak

    %58
    fad16. dod32 la16. dod32 fad,16. la32
    sold16. si32 la16. sold32 fad16. mid32
    fad16. fad32  fad16. fad32  fad16. fad32

    %61
    sold8 lad fad
    si fad' si~
    si la16.-. sold32 la16. si32

    %64
    sold16. mi,32 mi16. mi32 mi16. mi32\mbreak
    fad8 sold mi
    la mi' la~

    %67
    la sol?16-+ fad sol la
    fad8 re sol
    mi dod fad

    %70
    re16. fad32 sol16. fad32 mi16. re32
    dod16. mi32 fad16. mi32 re16. dod32
    si16. re32 mi16. re32 dod16. si32

    %73
    lad4._+\mbreak
    r16. si32 si16. si32 si16.-+[la64 si]
    dod16. dod32 dod16. dod32 dod16.-+[si64 dod]

    %76
    re8 mi16. mi32 re16. re32
    dod16. dod32 si16. si32 lad16. lad32
    si16. si32 fad16. si32 re,16. si'32

    %79
    mi,16. sol32 fad16. mi32 re16. dod32
    si4.

}

Ivlan = \relative do' {

    si'4. \tuplet 3/4 { re32 dod si } fad'8.\tuplet 3/2 { re32 dod si } si'8.\tuplet 3/2 { re,32 dod si }
    fad4. \tuplet 3/4 {  lad32 sol fad } dod'8. \tuplet 3/2 { lad32 sol fad } mi'8. \tuplet 3/2 { dod32 si lad }\mbreak
    si,4. \tuplet 3/4 {  re32 dod si } fad'8.\tuplet 3/2 { re32 dod si } fad'8.\tuplet 3/2 { re32 dod si }

    %4
    si4(lad8.) lad16 si4 dod
    lad si sol' fad
    fad si2 la?4~

    %7
    la la sol8. fad16 mi8. re16
    la4 re dod re\mbreak
    si2 la4 sol'

    %10
    fad re dod re
    si2 la4 sol'
    fad re'2 dod8. dod16

    %13
    si8. si16 mi2 re4
    dod4. r32 dod re dod si4. r32 si dod si
    lad4. r32 dod, re dod si4. r32 si dod si\mbreak

    %16
    lad4. \tuplet 3/4 { mi'32 fad sol} fad8. mi16 re8. dod16  lad1
    R4.*3
    r16. si32 si16. si32 si16. si32

    %21
    lad16. la32 la16. la32 la16. la32
    sold16. sol32 sol16. sol32 sol16. sol32
    la'16. lad,32 lad16. lad32 lad16. lad32\mbreak

    %24
    si16. si32 si16. si32 si16. si32
    dod8 dod fad~
    fad re sol~

    %27
    sol mi la~
    la re, re~
    re si'16 la sol fad

    %30
    mi8 re dod
    re la re
    dod re8. la'16\mbreak

    %33
    la16. fad32 sol16. mi32 fad16. re32
    mi8 re' dod
    si la sol

    %36
    fad4 la8
    si la16 sol fad mi
    fad8 re re'~

    %39
    re la dod
    si mi, mi'~
    mi si re

    %42
    dod fad, fad'~\mbreak
    fad mi4
    re4.

    %45
    dod
    si
    la4 la8~

    %48
    la re,16 dod si la
    sold4.
    R

    %51
    r16. dod32 dod16. dod32 dod16. dod32
    fad4 fad8~
    fad mi re\mbreak

    %54
    dod16. dod32 dod16. dod32 dod16. dod32
    re16. re32 re16. re32 re16. re32
    sold,8 mid' fad

    %57
    re dod si
    la dod la
    re dod16 si la sold

    %60
    la4.
    R
    r16. red32 red16. red32 red16. red32\mbreak

    %63
    mi8 fad4
    si,4.
    R

    %66
    r16. dod32 dod16. dod32 dod16. dod32
    re8 mi4
    la,8 fad' re~

    %69
    re dod4~
    dod8 si sol'~
    sol dod, fad~

    %72
    fad si, mi\mbreak
    dod4.
    R

    %75
    r16. fad32 fad16. fad32 mi16. mi32
    re8 lad' si
    sol fad mi

    %78
    re4 fad8
    sol16. mi32 re16. dod32 si16. lad32
    si4.

}


Ibcn = \relative do {

    si4. \tuplet 3/4 { re32 dod si } fad'8.\tuplet 3/2 { re32 dod si } si'8.\tuplet 3/2 { re,32 dod si }
    fad'4. \tuplet 3/4 { lad32 sol fad }  dod'8.\tuplet 3/2 { lad32 sol fad } mi'8.\tuplet 3/2 { dod32 si lad }\mbreak
    si,4. \tuplet 3/4 { re32 dod si } fad'8.\tuplet 3/2 { re32 dod si } si'8.\tuplet 3/2 { re,32 dod si }

    %4
    fad'8. fad16 fad'4~fad8.\tuplet 3/2 { fad32 mi re } mi4~
    mi8.\tuplet 3/2 { mi32 re dod } re4~re8.\tuplet 3/2 { re32 dod si } dod8.\tuplet 3/2 { dod32 si lad }
    si,4. r32 si' dod re\mbreak dod4. r32 la? si dod

    %7
    re4 la sol8. fad16 mi8. re16
    la4 fad' mi re
    sol,2 la

    %10
    si4 fad' mi re
    sol,2 la
    re4. r32 fad  mi re la'4. r32 dod, si la\mbreak

    %13
    mi'4. r32 sol fad mi si'4. r32 re, dod si
    fad'2 sol
    fad sol,

    %16
    fad4. \tuplet 3/4 { mi'32 fad sol} fad8. mi16 re8. dod16 fad,1
    R4.*6\mbreak
    r16. fad'32 fad16. fad32 fad16. fad32

    %24
    sol16. sold32 sold16. sold32 sold16. sold32
    la16. lad32 lad16. lad32 lad16. lad32
    si16. si32 si16. si32 si16. si32

    %27
    dod16. dod32 dod16. dod32 dod16. dod32
    re16. fad,32 fad16. fad32 fad16. fad32
    sol16. sol32 mi16. mi32 sol16. sol32\mbreak

    %30
    la,4.^\tasto~
    la~
    la16. la'32 la16. fad32 sol16. mi32

    %33
    fad16. re32 mi16. dod32 re16. re,32
    \once\stemUp la'8 si' la
    sol fad mi

    %36
    re fad re
    sol la la,
    re4 r16 re\mbreak

    %39
    la'16. la,32 dod16. dod32 la16. la32
    mi'4 r16 mi
    si'16. si,32 re16. re32 si16. si32

    %42
    fad'4 r16 fad
    dod'8. r32 dod lad16. fad32
    si,16. si'32 sold16. sold32 mi16. mi32

    %45
    la,16. la'32 fad16. fad32 re16. re32
    sold,16. sold'32 mid16. mid32 dod16. dod32\mbreak
    fad16 mid fad sold la fad

    %48
    si,4.
    dod
    R4.*2

    %52
    r16. fad32 fad16. fad32 fad16. fad32
    sol16. sold32 sold16. sold32 sold16. sold32
    la16. lad32 lad16. lad32 lad16. lad32

    %55
    si16. si32 si16. si32 si16. si32
    dod8 re dod
    si la sol

    %58
    fad la fad
    si, dod dod,
    fad4.

    %61
    R
    r16. si'32 si16. si32 si16. si32
    dod8 red si

    %64
    mi4.
    R\mbreak
    r16. fad,32 fad16. fad32 fad16. fad32

    %67
    si8 dod la
    re,16. re'32 si16. si32 sol16. sol32
    dod,16. dod'32 lad16. lad32 fad16. fad32

    %70
    si,16. si'32 si16. si32 si16. si32
    lad16. la32 la16. la32 la16. la32
    sold16. sol32 sol16. sol32 sol16. sol32\mbreak

    %73
    fad4.^\tasto~
    fad~
    fad16. fad32 fad16. fad32 fad16. fad32

    %76
    si8 sol fad
    mi re dod
    si re si

    %79
    mi fad fad,
    si4.

}

Ibfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s1
    <7 _ _+>2 <_>4 <_>8 s
    s1
    <6 4>4 <_+> <2>8 <2> <6 5>4
    <4\+> <6> <2> <6+\\>8 <6+\\>
    s4. <6>16 <6> <7 5/>4 <6>8 <6>
    s2
    <4\+>8. <6>16 <6\\>4
    s <6> <6\\> s
    <6 5>2 <7>
    <5>4 <6> <6\\> s
    <6 5>2 <7>
    s <5 4>4 <3>
    <5 4> <3> <5 4> <3>
    <_+>2 <7>4 <6+\\>
    <_+>2 <7>4 <6+\\>
    <_+>1
    s
    s4.*6
    s16. <_+>32 s4
    <7>16. <5/>32 s4
    s16. <5/>32 s4
    s8 <6>4
    <7 5/>8 <6>4
    s8 <_> <_>
    <9 7>16 s <7>8 <7>
    s4.*2
    s8 <6 4> <4\+>
    <6> <6\\> s
    s <6>16 s <6> s
    <6 5> s <6>8 <6\\>
    s4.
    <6 5>8 <4> <7>
    s4.
    <5 4>8 <6> <6>
    <5 4>4 <3>8
    <5 4>8 <6> <6>
    <5 4>4 <3>8
    <5 4>8 <3> <5/>
    <9> <5/> s
    <9> <6 _ 5> <_>
    <9 5/>16 s <5/>8 <5/>
    <9+> <3> <3>
    <9 7>4 <6+ 5>8
    <_+>4.
    s
    s
    s8 <6> s
    <9 7> <5/> s
    s <5/> s
    s <6+ 5> s
    <_+> <2+> <6 4>
    <4\+ 3> <6> <6+\\>
    <_>4 <_>8
    <6+ 5> <4> <7 _+>
    s4.
    s
    s16. <_+>32 s4
    <7>8 <5/> <5/>
    <_+>4.
    s
    s
    <7>8 <5/> <5/>
    s <6 _ 5> <_>
    <9 5/>16 s <5/>8 <5/>
    <9> <8> <6>
    <7/> <6> s
    <7 5/> <6\\> s
    <_+>4.
    s
    s8 <7 _+> s
    s <2+> <6 4>
    <4\+ 3> <6> <6\\>
    <_>4 <_>8
    <6 5> <4> <7 _+>

}

forma = {

    \time 2/2
    \key si\minor
    \tempo 2 = 40\once\override Score.RehearsalMark.extra-offset = #'(+0 . -1.0)
    \mark\markup\huge "Grave"
    \repeat volta 2 {s1*15}
    \alternative  {{s1}{s}}\break\once\override Score.RehearsalMark.extra-offset = #'(+0 . -1.0)
    \mark\markup\huge "Presto"
    \time 3/8
    \set Score.currentBarNumber = #17
    \tempo 4. = 50
    \bar ".|:"
    s4.*64
    \bar":|."

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

    si4~\tuplet 3/2 { si8 (re dod) si[(lad si)] }
    sol4^\staccatissimo _+ fad^\staccatissimo r
    si4~\tuplet 3/2 { si8 (re dod) si[(lad si)] }

    %4
    mi,4_+^\staccatissimo re^\staccatissimo r
    si'4~\tuplet 3/2 { si8 (fad' mi re[dod si)]}
    si4(\tuplet 3/2 {
        dod8) sol'(fad mi[re dod)]

        %7
        si(dod re)
    } mi4 re
    re-+ dod2\mbreak
    re4~\tuplet 3/2 { re8(fad mi) re[(dod re)] }

    %10
    si4-+ la r
    re4~\tuplet 3/2 { re8(fad mi) re[(dod re)] }
    sol,4_+ fad r

    %13
    re'4~\tuplet 3/2 { re8(la' sol) fad[(mi re)] }
    si'4 dod-+ re
    \tuplet 3/2 { re,8(si sol') } mi2-+

    %16
    re2.\mbreak
    fad4~\tuplet 3/2 { fad8 la(sol fad[mi re)] }
    re4(\tuplet 3/2 { mi8)  sol(fad mi[re dod)]}

    %19
    dod4(\tuplet 3/2 { re8) fad(mi re[dod si)] }
    si4(lad2_+)
    \tuplet 3/2 { sol8(dod mi) fad,[(si re)] mi,(lad dod) }

    %22
    re,4\staccatissimo lad'(si)
    sol'8.-+ fad32 mi re4 dod-+
    si2.

    %25 si\maggiore
    red4~\tuplet 3/2 { red8 (fad mi)  red[(dod si)] }
    si4(\tuplet 3/2 { dod8) (mi   red) dod[(si lad)]}
    si4 sold fad

    %28
    mi2_+ red4
    sold~\tuplet 3/2 { sold8(lad si) si_+[( lad si)] }
    fad4~\tuplet 3/2 { fad8(lad si) si_+[( lad si)] }

    %31
    mi,4 mi' red
    red(dod2-+) red4(dod2-+)
    fad4~\tuplet 3/2 { fad8(mi red) red-+[(dod sid)] }

    %34
    red,(sid' dod) red\staccatissimo  mi4~
    mi~\tuplet 3/2 { mi8 red\staccatissimo dod\staccatissimo  dod-+[(si? lad)]}
    si,(lad' si) dod\staccatissimo red4

    %37
    \tuplet 3/2 { sold,8(si mi) fad,[(si red)] mi,(lad dod)}
    red,4 lad'(si)
    dod8(red mi4) red\staccatissimo

    %40
    red-+ dod2\mbreak
    fad4~\tuplet 3/2 { fad8(mi red) red-+[(dod si)] }
    sold'4~\tuplet 3/2 { sold8(fad mi) mi-+[(red dod)] }

    %43
    lad'4~\tuplet 3/2 { lad8(sold fad) fad-+[(mi red)] }
    si'2.\fermopz
    \tuplet 3/2 { sold8(si mi,) fad(si red,) mi(lad dod,) }

    %46
    red4~\tuplet 3/2 {
        red8 fad mi red[dod si]
        sold mi mi'
    } dod2-+
    si2.

}

IIvlIIn = \relative do'' {

    R2.
    dod,4\staccatissimo re\staccatissimo r
    R2.

    %4
    lad4\staccatissimo si\staccatissimo r
    fad' fad fad
    sol sol sol

    %7
    fad8 si lad4 si
    si-+ lad2
    R2.

    %10
    mi4\staccatissimo fad\staccatissimo r
    R2.\mbreak
    dod4\staccatissimo re\staccatissimo r

    %13
    fad2.
    mi2 re4~
    re re dod_+

    %16
    re2.
    re4 re'2~
    re4 dod2~

    %19
    dod4 si re,\staccatissimo
    re(dod2-+)
    mi4 re sol

    %22
    fad mi re\mbreak
    dod8 dod' si4 (lad_+)
    si2.

    %25
    fad
    sold2 fad4
    fad si, si

    %28
    si(lad)_+ si
    si si si
    si si si

    %31
    lad dod' si\mbreak
    si(lad2_+) si4(lad2_+)
    r4 red,2~

    %34
    red4 dod8_+(sid) dod4
    r dod2~
    dod4 si8_+(lad) si4

    %37
    si' si lad_+
    si mi, red
    dod dod si\mbreak

    %40
    si_+ lad2
    r4 fad'2~
    fad4 mi2~

    %43
    mi red4
    red2.\fermata
    si'4 si  lad_+

    %46
    si2 fad4
    mi8 dod' \appoggiatura si8 lad2-+
    si2.

}

IIvlan = \relative do' {

    R2.
    si4\staccatissimo si\staccatissimo r
    R2.

    %4
    fad'4\staccatissimo  fad\staccatissimo r
    si, si si
    si si si

    %7
    si fad' fad
    fad2.
    R

    %10
    re4\staccatissimo re\staccatissimo r
    R2.
    la4\staccatissimo la\staccatissimo r\mbreak

    %13
    re2.~
    re4 la la
    si la sol'

    %16
    fad2.
    la
    la2 fad4

    %19
    fad2 fad4
    fad2.
    lad,4 si dod

    %22
    si sol' fad
    sol fad mi
    re2.

    %25
    si
    si2 dod4
    red dod red

    %28
    sold fad fad
    mi si dod
    red fad fad

    %31
    fad fad fad
    fad2. fad\mbreak
    r4 sold sold

    %34
    sold2.
    r4 fad fad
    fad2.

    %37
    mi4 red dod
    si fad' fad
    fad2 fad4

    %40
    fad2.
    si,~
    si4 dod2~\mbreak

    %43
    dod si4
    si2.\fermata
    mi4 red dod

    %46
    si2 si4
    si8 sold' fad4 mi
    red2.

}


IIbcn = \relative do {

    si'2 re,4
    mi re r
    si'2 re,4

    %4
    dod si r
    re re re
    mi mi mi

    %7
    re dod si
    fad' fad,2
    re'' fad,4

    %10
    sol fad r
    re'2 fad,4
    mi re r

    %13
    re fad re
    sol2 fad4
    sol la la,

    %16
    re4~\tuplet 3/2 { re8(fad la) re[(dod re)] }
    re,2.
    la'2 lad4\mbreak

    %19
    si2 si,4
    fad' fad, fad
    r r lad'

    %22
    si dod re
    mi, fad fad,
    si2.

    %25 OOKK
    si'
    mi,
    red4 mi red

    %28
    dod fad, si
    mi' mi mi
    red red red

    %31
    dod lad si
    fad fad,2 fad'4 fad mi\mbreak
    red sold sold,

    %34
    dod2.
    dod4 fad fad,
    si2.

    %37
    r4 r fad'
    si dod red
    lad lad si

    %40
    fad fad, mi
    red2.
    mi

    %43
    fad
    sold\fermata
    r4 r fad'

    %46
    si, dod red
    mi fad fad,
    si2.

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6>4
    <6 5> <6> s
    s2 <6>4
    <6\\> s s
    <6>2.
    <6 5>
    <6>4 <6\\>2
    <6 4>4 <_+>2
    s <6>4
    <6 5> <6> s
    s2 <6>4
    <6\\>2.
    s
    <6 5>4 <4\+> <6>
    <6 5> <4> <7>
    s2.*2
    <5 4>4 <3> <5/>
    <9> <8> s
    <6 4> <_+> s
    s s <7/>
    s <6+\\ 5/> <6>
    <6 5> <4> <7 _+>
    s2.
    s
    <6 5>4 s <4\+>
    <6> <6 5> <6>
    <7> <7> s
    <6 5>2.
    <6>2 s4
    \bassFigureExtendersOn <6\\>2 <6\\>4
    <6 4>4 <3> s
    <6 4> <3 > <3>
    <7 5/>8 s <7 _ _+>4 <_>
    <9> <8> s
    s <7> s
    <9> <8> s
    s s <7>
    s <6\\> <6>
    <5/> s s
    <6 4> <3> <3>\bassFigureExtendersOff
    <6>2.
    <9 7>4 <6 5> s
    <7> s <6 4>
    <5>2.
    s4 s <7>
    s <6\\> <6>
    <6 5> <4> <7>

}

forma = {

    \time 3/4
    \once\override Score.RehearsalMark.extra-offset = #'(0 . +1.0)
    \key si\minor
    \tempo 2 = 57
    s2.*8
    \bar ":..:"
    s2.*16\break
    \bar ":..:"
    \mark\markup\huge "Aria 2.da"
    \key si\major
    \repeat volta 2{s2.*7}
    \alternative {{s2.}{s}}
    \set Score.currentBarNumber = #33
    \bar".|:"
    s2.*16
    \bar":|."
    \mark\markup\smaller\center-column {"D.C."\vspace #+0.2"al I.mo"}

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

    si2 dod8-+(si dod red)
    mi2. fad4-+
    sol8(fad) mi(re) dod(si) lad(fad')

    %4
    re2-+ \appoggiatura dod8 si2
    si' lad8(si) si(fad)
    fad1~

    %7
    fad2. mi4-+
    fad1 fad
    la,2 si8-+(la si dod)

    %10
    re2 mi8-+(re mi sol)
    fad4 la sol8(fad) mi(re)
    dod2-+ \appoggiatura si8 la2

    %13
    re' dod8(re) re(la)
    la1~
    la4 mi8(sol) fad(mi) re-+(dod)

    %16
    re4 re, fad'2~\mbreak
    fad4 mi8(re) dod-+(si) dod(red)
    mi2. fad4-+

    %19
    sol8(fad) mi(re?) dod4 si
    lad2_+ fad'~
    fad mi8-+(re mi fad)

    %22
    re2 dod8-+(si dod re)
    si4 sol fad8 mi re dod
    si1

    %25
    red'2 dod8-+(si dod red)
    si2. fad4
    sold8(si mi) sold\staccatissimo fad(mi) red(dod)

    %28
    \appoggiatura dod8 red2 \appoggiatura dod8 si4 fad'8(si)
    si(lad) lad(sold) sold(fad) fad(mid)
    fad,(mid' fad) mi\staccatissimo mi(red) red(dod)\mbreak

    %31
    mi(red) dod(si) lad(si) si4-+
    dod1 dod
    fad2 dod8-+(si) dod(red)

    %34
    mi2 si8-+ (lad) si(dod)
    red4 fad mi8(red) dod(si)
    \appoggiatura si8 lad2-+ \appoggiatura sold8 fad4 fad'\mbreak

    %37
    sold2 lad8-+(sold lad dod)
    si2 mi,8-+(red) mi(fad)
    mi(red) dod(si) \afterGrace dod2-+ ({si16[dod)]}

    %40
    si1

}

IIIvlIIn = \relative do'' {

    si2 dod8-+(si dod red)
    mi2. fad4-+
    sol8(fad) mi(re) dod(si) lad(fad')

    %4
    \appoggiatura mi8 re2-+ \appoggiatura dod8 si2
    fad'2\p mi8(re) re(dod)
    dod4 dod8(mi) re(si) dod(mi)

    %7
    re4 dod8(re) si2-+
    lad1-+ lad-+
    la!2 si8-+(la si dod)

    %10
    re2 mi8-+(re mi sol)
    fad4 la sol8(fad) mi(re)
    \appoggiatura re8 dod2-+ \appoggiatura si8 la2

    %13
    la'2\p sol8(fad) fad(mi)
    mi4 mi8(sol) fad(re) mi(sol)
    fad(re) mi(sol) fad(mi) re-+(dod)

    %16
    re4 re, fad'2~\mbreak
    fad4 mi8(re) dod-+(si) dod(red)
    mi2. fad4-+

    %19
    sol8(fad) mi(re?) dod4 si
    lad2_+ fad'~
    fad mi8-+(re mi fad)

    %22
    re2 dod8-+(si dod re)
    si4 sol fad8 mi re dod
    si1

    %25
    red'2 dod8-+(si dod red)
    si2. fad4
    sold8(si mi) sold\staccatissimo fad(mi) red(dod)

    %28
    \appoggiatura dod8 red2 \appoggiatura dod8 si4 fad'\p
    mi red dod si
    lad2._+ red8(dod)

    %31
    mi(red) dod(si) lad(si) si4-+\mbreak
    dod1 dod
    fad2 dod8-+(si) dod(red)

    %34
    mi2 si8-+ (lad) si(dod)
    red4 fad mi8(red) dod(si)
    lad2-+ \appoggiatura sold8 fad4 fad'

    %37
    sold2 lad8-+(sold lad dod)
    si2 mi,8-+(red) mi(fad)
    mi(red) dod(si) dod2-+

    %40
    si1

}

IIIvlan = \relative do' {

    si2 si4 si
    si dod si si'
    si2 lad_+

    %4
    si2 fad
    re' \parenthesize \p dod8(si) si(lad)
    lad4 lad_+ si lad_+

    %7
    si fad sol mi\mbreak
    dod1 dod2 la'?8 si la sol
    fad2 mi4 la,

    %10
    la2 la'
    la re,4 si'
    mi,1_+

    %13
    fad'2\parenthesize \p mi8(re) re(dod)
    dod4 dod,_+ re dod_+
    re si' la8 sol fad mi\mbreak

    %16
    fad2. si,4
    si2 si4 si
    si dod si si

    %19
    si2 mi
    dod lad'
    si dod

    %22
    fad, sol
    fad4 si,2 lad4_+
    si1

    %25
    fad'2 mi
    red si~
    si lad_+

    %28
    si2. red'4
    dod si lad sold
    fad2. fad4

    %31
    fad sold dod, red
    lad1 lad\mbreak
    r2 lad'

    %34
    sold sold
    fad sold
    dod, lad'

    %37
    si dod
    fad, fad
    fad4 mi fad mi

    %40
    red1

}


IIIbcn = \relative do {

    si4 si' mi, fad
    sol la sol fad
    mi dod fad fad,

    %4
    si dod re si
    R1
    r2 r4 fad'

    %7
    si la sol2
    fad8 mi fad sol fad mi re dod fad4 fad8 mi fad sol fad mi
    re2 sol4 mi

    %10
    fad re dod la
    re fad si sol
    la la, dod la

    %13
    R1
    r2 r4 la'
    re sol, la la,

    %16
    re2. re4
    mi2. fad4
    sol la sol fad

    %19
    mi2 sol
    fad4 fad, r fad'
    sold2 lad

    %22
    si mi,
    re4 mi fad fad,
    si1

    %25
    si'2 fad
    sold red
    mi4 dod fad fad,

    %28
    si dod red si
    R1
    r2 r4 fad'

    %31
    si mi, fad si,
    fad fad'8 mi fad sold lad fad fad,1
    r2 fad'

    %34
    dod mi
    si sold4 mi
    fad2 fad''~

    %37
    fad mi
    red dod
    si4 sold fad fad,

    %40
    si1

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s2 <6 5>4 <6+\\>
    <6>4 <6 5> <6> <6 4>
    <6 5> s <4> <7 _+>
    \bassFigureExtendersOn s4 <_>2 <_>4
    s1
    s2 s4 <7 _+>
    s <6> <7> <6\\>
    <_+>2 <_+>4 s
    <_+>2 <6>
    s <6 5>4 <6\\>
    <6> s <5/> s
    <_> <_> <6>8 s <6 5>4
    <7>2 <7>4 <7>
    s1\bassFigureExtendersOff
    s2 s4 <7>
    s <6 4> <4> <7>
    s2 s4 <6>
    <9 7>2 <6 5>4 <6+\\>
    <6\+> <6 5> <6> <6 4>
    <9 7>2 <6\\>
    <_+>1
    <7 5/>2 <5/>
    s <6 5>
    <6>4 <6 5> <4> <7 _+>
    s1
    s2 <7>
    <5> <6>
    <9 7>4 <7> <4> <7>
    s1
    s
    s2 s4 <7>
    s <6 5> <7> s
    s1*2
    s2 <6 5>
    s <6 5>
    s <6>4 <6 5>
    s1
    <2>2 <4\+>
    <6> <6\\>
    s4 <6> <4> <7>

}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \once\override Score.RehearsalMark.extra-offset = #'(+5 . +1.0)
    \key si\minor
    \tempo 1 = 57
    \repeat volta 2{s1*7}
    \alternative {{s1}{s}}
    \set Score.currentBarNumber = #9
    \bar ":..:"
    s1*16\break
    \bar ":..:"
    \mark\markup\huge "Allegro 2.do"
    \key si\major
    \repeat volta 2{s1*7}
    \alternative {{s1}{s}}
    \set Score.currentBarNumber = #33
    \bar".|:"
    s1*8
    \bar":|."
    \mark\markup\smaller\center-column {"D.C."\vspace #+0.2"al I.mo"}

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

    si4\staccatissimo si,4. re8
    dod2.
    dod'4\staccatissimo dod,4. mi8

    %4
    \appoggiatura mi re2_+ \appoggiatura dod8 si4
    fad''8.(si,16) si4. (sol'8)
    sol8.(lad,16) lad4. (mi'8)

    %7
    mi4(re8.-+) dod16 re4
    dod2.-+
    si4\staccatissimo si,4. re8

    %10
    dod2.
    dod'4\staccatissimo dod,4. mi8
    \appoggiatura mi re2_+ \appoggiatura dod8 si4

    %13
    fad''8.(si,16) si4. (sol'8)
    sol8.(lad,16) lad4. (mi'8)
    mi4(re8.-+) dod16 re4

    %16
    dod2.-+
    re4\staccatissimo re4. fad8
    mi8.-+(re16) mi4.(fad16 sol)\mbreak

    %19
    fad8. [la16 sol8. fad16 mi8. re16]
    dod2-+ \appoggiatura si8 la4
    fad'\staccatissimo fad4. la,8

    %22
    la4(sol8._+) fad16 sol4
    mi'\staccatissimo mi4. sol,8
    sol4(fad8._+) mi16 fad4

    %25
    re'\staccatissimo re4. re8
    re2.~
    re~\mbreak

    %28
    re\fermata
    sol4\staccatissimo sol4. mi8
    dod4.-+ (si16 la )re4

    %31
    mi8.(fad32 sol) mi4.-+ re8
    re2.
    fad4\staccatissimo fad4. la8

    %34
    la4(sol8.-+) [fad16 mi8. re16]
    dod4 fad4. mi8
    \appoggiatura mi8 re2-+ \appoggiatura dod8 si4\mbreak

    %37
    si\staccatissimo\p si4. re8
    dod8.-+(si16) dod4. red8
    mi4\staccatissimo mi4. fad8

    %40
    \appoggiatura fad sol2.\fermata
    sol8.\f[fad16 mi8. re16 dod8. si16]
    lad8.[(dod16) si8.(re16) dod8.(mi16)]

    %43
    re8.[(fad16) mi8.(sol16)] fad4~
    fad8(mi16-+ re) dod4.-+ (si8)\mbreak
    si8\staccatissimo fad(mi re dod si)

    %46
    \once\stemUp lad\staccatissimo mi''(re dod si lad?)
    \once\stemUp si,\staccatissimo fad''(mi re dod si)
    \once\stemUp dod,\staccatissimo sol''(fad mi re dod)

    %49
    re\p\staccatissimo si'\staccatissimo lad-+(si) lad-+(si)
    fad\staccatissimo fad\staccatissimo sol-+(fad) sol-+(fad)
    fad2 mid4-+

    %52
    fad8\staccatissimo lad,(si) re(dod) mi\staccatissimo\mbreak
    re\f\staccatissimo fad,(mi re dod si)
    \once\stemUp lad\staccatissimo mi''(re dod si lad?)

    %55
    \once\stemUp si,\staccatissimo fad''(mi re dod si)
    \once\stemUp dod,\staccatissimo sol''(fad mi re dod)
    re\p \staccatissimo si'\staccatissimo lad-+(si) lad-+(si)

    %58
    fad\staccatissimo fad\staccatissimo sol-+(fad) sol-+(fad)
    fad2 mid4-+
    fad8(lad,) si(re) dod(mi)\mbreak

    %61
    re16 si re fad si fad re si si' fad re si
    mi,(dod') sol'(dod,) mi,(dod') sol'(dod,) mi,(dod') sol'(dod,)
    re,(si') fad'(si,) re,(si') fad'(si,) re,(si') fad'(si,)

    %64
    <sol dod,>(lad) mi'(lad,)  <sol dod,>(lad) mi'(lad,)  <sol dod,>(lad) mi'(lad,)
    <re, si> (si') fad'(si,)  <re, si> (si') fad'(si,)  <re, si> (si') fad'(si,)
    mid,(re') sold(re) mid,(re') sold(re) mid,(re') sold(re)

    %67
    mi,!(dod') lad'(dod,) mi,(dod') lad'(dod,) mi,(dod') lad'(dod,)
    re,(si') si'(si,)mi, si' mi sol fad mi re dod\mbreak
    re si re fad si fad re si si' fad re si

    %70
    mi,(dod') sol'(dod,) mi,(dod') sol'(dod,) mi,(dod') sol'(dod,)
    re,(si') fad'(si,) re,(si') fad'(si,) re,(si') fad'(si,)
    <sol dod,>(lad) mi'(lad,)  <sol dod,>(lad) mi'(lad,)  <sol dod,>(lad) mi'(lad,)

    %73
    <re, si> (si') fad'(si,)  <re, si> (si') fad'(si,)  <re, si> (si') fad'(si,)
    mid,(re') sold(re) mid,(re') sold(re) mid,(re') sold(re)
    mi,!(dod') lad'(dod,) mi,(dod') lad'(dod,) mi,(dod') lad'(dod,)

    %76
    re,(si') si'(si,)mi, si' mi sol fad mi re dod\mbreak
    si8.\parenthesize \p  si16(si'2)~
    si8. si,16(si'2)~

    %79
    si8. si,16(si'2)~
    si4 (lad8.-+)[sold16 fad8. mi16]
    red8 fad,\staccatissimo sold_+(fad) sold4~

    %82
    sold8 mid\staccatissimo fad_+( mid) fad4~
    fad8 red\staccatissimo mi_+(red)mi4~\mbreak
    mi8 dod\staccatissimo red(fad) dod(mi)

    %85
    red8. si'16(si'2)~
    si8. si,16(si'2)~
    si8. si,16(si'2)~

    %88
    si4 lad8.[sold16 fad8. mi16]
    red8 fad,\staccatissimo sold_+(fad) sold4~
    sold8 mid\staccatissimo fad_+( mid) fad4~

    %91
    fad8 red\staccatissimo mi_+(red)mi4~\mbreak
    mi8 dod\staccatissimo red(fad) dod(mi)
    red fad\staccatissimo si16\f red dod mi red8 dod16-+ si

    %94
    dod mid, fad mid fad mid fad mid  fad8 dod'
    si16 dod red dod si lad sold fad mid fad sold si
    lad si dod si lad sold fad mi? fad mi red dod\mbreak

    %97
    red8 fad si16 red dod mi red8 dod16-+si
    dod mid, fad mid fad mid fad mid  fad8 dod'
    si16 dod red dod si lad sold fad mid fad sold si

    %100
    lad si dod si lad sold fad mid fad4
    r8 dod'~dod16 si lad sold fad8 mi?
    red8 red'~red16 dod si  lad sold8 fad

    %103
    mid16(dod') sold'(dod,) mid,(dod') sold'(dod,) fad,(dod') lad'(dod,)
    sold(dod) si'(dod,) sold(dod) si'(dod,) fad,(dod') lad'(dod,)
    mid,8 dod'\staccatissimo red\staccatissimo mid?\staccatissimo fad\staccatissimo sold-+

    %106
    lad2.~
    lad8 si,\staccatissimo dod\staccatissimo red\staccatissimo mid\staccatissimo fad\staccatissimo\mbreak
    sold2.~

    %109
    sold8 mid fad-+(mid) fad-+(mid)
    fad2.~
    fad~

    %112
    fad8. si,16 sold4._+ fad8
    fad fad'4 mi8\staccatissimo red\staccatissimo dod\staccatissimo
    sid\staccatissimo\f la\staccatissimo sold\staccatissimo fad\staccatissimo mi\staccatissimo red\staccatissimo

    %115
    dod mi'4 red8\staccatissimo dod\staccatissimo si\staccatissimo\mbreak
    lad8\staccatissimo sold\staccatissimo fad\staccatissimo mi\staccatissimo red\staccatissimo dod\staccatissimo
    si \once\stemDown fad'' \tuplet 3/2 { red,16(si 'fad') la\staccatissimo [fad\staccatissimo si,\staccatissimo] red,(si' fad') la\staccatissimo [fad\staccatissimo si,\staccatissimo] }

    %118
    \once\stemUp mi,8 sold' \tuplet 3/2 { mid,16(dod' sold') si\staccatissimo [sold\staccatissimo dod,\staccatissimo] mid,(dod' sold') si\staccatissimo [sold\staccatissimo dod,\staccatissimo] }
    fad,8 fad'16(red) mi(dod red si) mi(dod red si)\mbreak
    dod8.(red32 mi)  red8\staccatissimo dod\staccatissimo si-+ lad\staccatissimo

    %121
    \once\stemUp si, \once\stemDown fad'' \tuplet 3/2 { red,16(si 'fad') la\staccatissimo [fad\staccatissimo si,\staccatissimo] red,(si 'fad') la\staccatissimo [fad\staccatissimo si,\staccatissimo] }
    \once\stemUp mi,8 sold' \tuplet 3/2 { mid,16(dod' sold') si\staccatissimo [sold\staccatissimo dod,\staccatissimo] mid,(dod' sold') si\staccatissimo [sold\staccatissimo dod,\staccatissimo] }
    fad,8 fad'16(red) mi(dod red si) mi(dod red si)\mbreak

    %124
    dod8.(red32 mi)  dod2-+
    si4\f \staccatissimo si,4. re8
    dod2.

    %127
    dod'4\staccatissimo dod,4. mi8
    red2.
    mi8.(fad16) \afterGrace fad2_+({mi16[fad])}

    %130
    sol4(sold2)
    la4(lad2)
    si8.(dod16) dod2-+\mbreak

    %133
    re4\staccatissimo si,4. re8
    dod2.
    dod'4\staccatissimo dod,4. mi8

    %136
    red2.
    mi8.(fad16)\afterGrace fad2_+({mi16[fad])}
    sol4(sold2)

    %139
    la4(lad2)
    si8.(dod16) \afterGrace dod2-+({si16[dod)]}
    re4\staccatissimo sol\p(fad)

    %142
    mid8-.(mid-. mid-. mid-. mid-. mid-.)\mbreak
    fad,4 fad'(mi?)
    red8(red red red red red)

    %145
    mi,4 mi'\f(re?)
    dod2-+ si4
    \appoggiatura si8 lad2_+ si4~

    %148
    si8.\f[sol'16 fad8. mi16 re8. dod16]
    re4\staccatissimo sol\p(fad)
    mid8-.(mid-. mid-. mid-. mid-. mid-.)\mbreak

    %151
    fad,4 fad'(mi?)
    red8(red red red red red)
    mi,4 mi'\f(re?)

    %154
    \appoggiatura re8 dod2-+ si4
    lad2_+ si4~
    si8. dod16 dod2-+

    %157
    si8.[dod16 re8. mi16 fad8. sol16]
    lad,4 fad'2\mbreak
    sold,8.[la16 si8. dod16 re8. mi16]

    %160
    fad,4 re'2
    mi,8.[fad16 sol8. lad16 si8. dod16]
    re,8.[mi16 fad8. sol16 lad8. si16]

    %163
    mi,8. sol16 fad4 fad
    si,2.

}

IVvlIIn = \relative do'' {

    si4\staccatissimo si,4. re8
    dod2.
    dod'4\staccatissimo dod,4. mi8

    %4
    \appoggiatura mi re2_+ \appoggiatura dod8 si4
    fad''8.(si,16) si4. (sol'8)
    sol8.(lad,16) lad4. (mi'8)

    %7
    mi4(re8.-+) dod16 re4
    dod2.-+
    si4\staccatissimo si,4. re8

    %10
    dod2.
    dod'4\staccatissimo dod,4. mi8
    \appoggiatura mi re2_+ \appoggiatura dod8 si4

    %13
    fad''8.(si,16) si4. (sol'8)
    sol8.(lad,16) lad4. (mi'8)
    mi4(re8.-+) dod16 re4

    %16
    dod2.-+
    re4\staccatissimo re4. fad8
    mi8.-+(re16) mi4.(fad16 sol)\mbreak

    %19
    fad8. [la16 sol8. fad16 mi8. re16]
    dod2-+ \appoggiatura si8 la4
    fad'\staccatissimo fad4. la,8

    %22
    la4(sol8._+) fad16 sol4
    mi'\staccatissimo mi4. sol,8
    sol4(fad8._+) mi16 fad4

    %25
    re'\staccatissimo re4. re8
    re2.~
    re~\mbreak

    %28
    re\fermata
    sol4\staccatissimo sol4. mi8
    dod4.-+ (si16 la )re4

    %31
    mi8.(fad32 sol) mi4.-+ re8
    re2.
    fad4\staccatissimo fad4. la8

    %34
    la4(sol8.-+) [fad16 mi8. re16]
    dod4 fad4. mi8
    \appoggiatura mi8 re2-+ \appoggiatura dod8 si4

    %37
    fad\p \staccatissimo fad4. fad8\mbreak
    sol4 sol4. si8
    si4\staccatissimo si4. si8

    %43
    si2.\fermata
    sol'8.\f[fad16 mi8. re16 dod8. si16]
    lad8.[(dod16) si8.(re16) dod8.(mi16)]

    %43
    re8.[(fad16) mi8.(sol16)] fad4~
    fad8(mi16-+ re) dod4.-+ (si8)
    si8\staccatissimo fad(mi re dod si)

    %46
    \once\stemUp lad\staccatissimo mi''(re dod si lad?)
    \once\stemUp si,\staccatissimo fad''(mi re dod si)
    \once\stemUp dod,\staccatissimo sol''(fad mi re dod)

    %49
    re\p\staccatissimo fad\staccatissimo mi(fad) mi(re)
    dod\staccatissimo dod\staccatissimo re(dod) re(dod)
    si[(si si si si dod16 si)]

    %52
    lad8(mi') re(si) lad(dod)
    si\staccatissimo \f fad(mi re dod si)
    \once\stemUp lad\staccatissimo mi''(re dod si lad?)

    %55
    \once\stemUp si,\staccatissimo fad''(mi re dod si)
    \once\stemUp dod,\staccatissimo sol''(fad mi re dod)
    re\p \staccatissimo fad\staccatissimo mi(fad) mi(re)

    %58
    dod\staccatissimo dod\staccatissimo re(dod) re(dod)
    si[(si si si si dod16 si)]
    lad8(mi') re(si) lad(dod)

    %61
    si16 si re fad si fad re si si' fad re si
    mi,(dod') sol'(dod,) mi,(dod') sol'(dod,) mi,(dod') sol'(dod,)
    re,(si') fad'(si,) re,(si') fad'(si,) re,(si') fad'(si,)

    %64
    <sol dod,>(lad) mi'(lad,)  <sol dod,>(lad) mi'(lad,)  <sol dod,>(lad) mi'(lad,)
    <re, si> (si') fad'(si,)  <re, si> (si') fad'(si,)  <re, si> (si') fad'(si,)
    mid,(re') sold(re) mid,(re') sold(re) mid,(re') sold(re)

    %67
    mi,!(dod') lad'(dod,) mi,(dod') lad'(dod,) mi,(dod') lad'(dod,)
    re, si' fad' si mi,, si' mi sol fad mi re dod\mbreak
    re si re fad si fad re si si' fad re si

    %70
    mi,(dod') sol'(dod,) mi,(dod') sol'(dod,) mi,(dod') sol'(dod,)
    re,(si') fad'(si,) re,(si') fad'(si,) re,(si') fad'(si,)
    <sol dod,>(lad) mi'(lad,)  <sol dod,>(lad) mi'(lad,)  <sol dod,>(lad) mi'(lad,)

    %73
    <re, si> (si') fad'(si,)  <re, si> (si') fad'(si,)  <re, si> (si') fad'(si,)
    mid,(re') sold(re) mid,(re') sold(re) mid,(re') sold(re)
    mi,!(dod') lad'(dod,) mi,(dod') lad'(dod,) mi,(dod') lad'(dod,)

    %76
    re, si' fad' si mi,, si' mi sol fad mi re dod
    si8. \parenthesize \p si16(si'2)~
    si8. si,16(si'2)~

    %79
    si8. si,16(si'2)~
    si4 (lad8.-+)[sold16 fad8. mi16]
    red8 fad,\staccatissimo sold_+(fad) sold4~

    %82
    sold8 mid\staccatissimo fad_+( mid) fad4~
    fad8 red\staccatissimo mi_+(red)mi4~\mbreak
    mi8 dod\staccatissimo red(fad) dod(mi)

    %85
    red8. si'16(si'2)~
    si8. si,16(si'2)~
    si8. si,16(si'2)~

    %88
    si4 lad8.[sold16 fad8. mi16]
    red8 fad,\staccatissimo sold_+(fad) sold4~
    sold8 mid\staccatissimo fad_+( mid) fad4~

    %91
    fad8 red\staccatissimo mi_+(red)mi4~\mbreak
    mi8 dod\staccatissimo red(fad) dod(mi)
    red fad\staccatissimo si16\f red dod mi red8 dod16-+ si

    %94
    dod mid, fad mid fad mid fad mid  fad8 dod'
    si16 dod red dod si lad sold fad mid fad sold si
    lad si dod si lad sold fad mi? fad mi red dod\mbreak

    %97
    red8 fad si16 red dod mi red8 dod16-+si
    dod mid, fad mid fad mid fad mid  fad8 dod'
    si16 dod red dod si lad sold fad mid fad sold si

    %100
    lad si dod si lad sold fad mid fad4
    r8 dod'~dod16 si lad sold fad8 mi?
    red8 red'~red16 dod si  lad sold8 fad

    %103
    mid16(dod') sold'(dod,) mid,(dod') sold'(dod,) fad,(dod') lad'(dod,)
    sold(dod) si'(dod,) sold(dod) si'(dod,) fad,(dod') lad'(dod,)
    mid,8 dod'\staccatissimo red\staccatissimo mid?\staccatissimo fad\staccatissimo sold-+

    %106
    lad2.~
    lad8 si,\staccatissimo dod\staccatissimo red\staccatissimo mid\staccatissimo fad\staccatissimo\mbreak
    sold2.~

    %109
    sold8 mid fad-+(mid) fad-+(mid)
    fad2.~
    fad~

    %112
    fad8. si,16 sold4._+ fad8
    fad fad'4 mi8\staccatissimo red\staccatissimo dod\staccatissimo
    sid\staccatissimo\f la\staccatissimo sold\staccatissimo fad\staccatissimo mi\staccatissimo red\staccatissimo

    %115
    dod mi'4 red8\staccatissimo dod\staccatissimo si\staccatissimo\mbreak
    lad8\staccatissimo sold\staccatissimo fad\staccatissimo mi\staccatissimo red\staccatissimo dod\staccatissimo
    si \once\stemDown fad'' \tuplet 3/2 { red,16(si 'fad') la\staccatissimo [fad\staccatissimo si,\staccatissimo] red,(si' fad') la\staccatissimo [fad\staccatissimo si,\staccatissimo] }

    %118
    \once\stemUp mi,8 sold' \tuplet 3/2 { mid,16(dod' sold') si\staccatissimo [sold\staccatissimo dod,\staccatissimo] mid,(dod' sold') si\staccatissimo [sold\staccatissimo dod,\staccatissimo] }
    fad,8 fad'16(red) mi(dod red si) mi(dod red si)\mbreak
    dod8.(red32 mi)  red8\staccatissimo dod\staccatissimo si-+ lad\staccatissimo

    %121
    \once\stemUp si, \once\stemDown fad'' \tuplet 3/2 { red,16(si 'fad') la\staccatissimo [fad\staccatissimo si,\staccatissimo] red,(si 'fad') la\staccatissimo [fad\staccatissimo si,\staccatissimo] }
    \once\stemUp mi,8 sold' \tuplet 3/2 { mid,16(dod' sold') si\staccatissimo [sold\staccatissimo dod,\staccatissimo] mid,(dod' sold') si\staccatissimo [sold\staccatissimo dod,\staccatissimo] }
    fad,8 fad'16(red) mi(dod red si) mi(dod red si)\mbreak

    %124
    dod8.(red32 mi)  red4(dod-+)
    si4\f \staccatissimo si,4. re8
    dod2.

    %127
    dod'4\staccatissimo dod,4. mi8
    red2.
    mi8.(fad16) \afterGrace fad2_+({mi16[fad])}

    %130
    sol4(sold2)
    la4(lad2)
    si8.(dod16) dod2-+\mbreak

    %133
    re4\staccatissimo si,4. re8
    dod2.
    dod'4\staccatissimo dod,4. mi8

    %136
    red2.
    mi8.(fad16)\afterGrace fad2_+({mi16[fad])}
    sol4(sold2)

    %139
    la4(lad2)
    si8.(dod16) \afterGrace dod2-+({si16[dod)]}
    re2.\p\mbreak

    %142
    r4 dod(si)
    lad8(lad lad lad lad lad)
    si,4 si'(la)

    %145
    sol mi'\f re
    \appoggiatura re8 dod2-+ si4~
    \appoggiatura si8 lad2_+ si4~

    %148
    si8.\f[sol'16 fad8. mi16 re8. dod16]\mbreak
    re2.\p

    %142
    r4 dod(si)
    lad8(lad lad lad lad lad)
    si,4 si'(la)

    %145
    sol mi'\f re
    \appoggiatura re8 dod2-+ si4
    \appoggiatura si8 lad2_+ si4~
    si8. dod16 dod2-+

    %157
    si8.[dod16 re8. mi16 fad8. sol16]
    lad,4 fad'2\mbreak
    sold,8.[la16 si8. dod16 re8. mi16]

    %160
    fad,4 re'2
    mi,8.[fad16 sol8. lad16 si8. dod16]
    re,8.[mi16 fad8. sol16 lad8. si16]

    %163
    mi,8. sol16 fad4 fad
    si,2.

}

IVvlan = \relative do' {

    re4\staccatissimo re4. fad8
    mi2.
    fad4\staccatissimo fad4. fad8

    %4
    fad2.
    fad
    mi2 r8 dod'

    %7
    fad,2 fad4
    fad2 r8 mi
    re4\staccatissimo re4. fad8

    %10
    mi2.
    fad4\staccatissimo fad4. fad8
    fad2.

    %13
    fad
    mi2 r8 dod'
    fad,2 fad4

    %16
    fad2.
    fad4 la  la,
    la la la

    %19
    la2 si4\mbreak
    la2.
    la'4\staccatissimo la4. fad8

    %22
    si,2.
    sol'4\staccatissimo sol4. mi8
    la,2.

    %25
    la'4 la4. la8
    si la sol la si sol
    fad4 fad4. fad8

    %28
    fad2.\fermopz\mbreak
    si4 si4. sol8
    mi2 la4

    %31
    si,8 mi dod4._+ re8
    re2.
    si4 si4. si8

    %34
    si2 si4
    lad dod fad
    fad2.

    %37
    re4\staccatissimo \parenthesize \p re4. re8\mbreak
    mi4\staccatissimo mi4. fad8
    sol fad sol la sol fad

    %40
    mi2.\fermata
    mi4 sol mi
    dod8(mi) re(si') lad(dod)

    %43
    si4 lad si
    sol fad mi
    re2.

    %46
    mi\mbreak
    fad
    sol8 mi dod4 lad

    %49
    \once\stemUp si8\parenthesize \p \staccatissimo re'\staccatissimo dod(re) dod(si)
    lad\staccatissimo lad\staccatissimo si(lad) si(la)
    sol(sol sol sol sol sol)

    %52
    fad2.
    si,4 re2
    mi2.

    %55
    fad
    sol8 mi dod4 lad
    \once\stemUp si8\parenthesize \p \staccatissimo re'\staccatissimo dod(re) dod(si)

    %58
    lad\staccatissimo lad\staccatissimo si(lad) si(la)
    sol(sol sol sol sol sol)
    fad2.

    %61
    si,8(<la' si,>) <la si,> (<la si,>)  <la si,>  (<la si,> )\mbreak
    <sol si,>2.
    <fad si,>

    %64
    <mi lad,>
    <re si>
    <sold si,>

    %67
    <sol! lad,>
    <<{fad4 sol}\\\stemUp si,2>> <fad' lad,>4
    <fad si,>8 <fad si,> <fad si,> <fad si,> <fad si,> <fad si,>

    %70
    <sol si,>2.
    <fad si,>\mbreak
    <mi lad,>

    %73
    <re si>
    <sold si,>
    <sol! lad,>

    %76
    <<{fad4 sol}\\\stemUp si,2>> <fad' lad,>4
    <fad si,>8 si,\p-.(si-. si-. si-. si-.)
    r dod (dod dod dod dod)

    %79
    r red (red red red red)\mbreak
    red(dod) dod4 lad_+
    si2 r8 red

    %82
    dod2 r8 dod
    si2 r8 si
    lad4 si8(red) lad(dod)

    %85
    si8(si si si si si)
    r dod(dod dod dod dod)\mbreak
    r red (red red red red)\mbreak

    %88
    red(dod) dod4 lad_+
    si2 r8 red
    dod2 r8 dod

    %91
    si2 r8 si
    lad4 si8(red) lad(dod)
    si4. lad8 si fad'\mbreak

    %94
    fad4 dod4. fad8
    fad4 mid dod
    dod4. dod8 dod dod

    %97
    si4. lad8 si fad'
    fad4 dod4. fad8
    fad4 mid dod

    %100
    dod4. dod8 dod dod\mbreak
    fad4 fad fad
    fad sold sold

    %103
    sold sold fad
    mid mid fad
    dod2.

    %106
    r8 dod dod dod dod dod
    si2.
    r8 si si si si si\mbreak

    %109
    lad2 dod4\staccatissimo
    dod <<
        {
            dod'2~
            dod4 si2(

            %112
            sold8)[fad]
        }\\{
            lad2~
            lad4 sold2~
            \stemUp sold4
        }
    >> mid2_+
    fad2 la4
    sold8\staccatissimo la\staccatissimo sold\staccatissimo fad\staccatissimo mi?\staccatissimo red\staccatissimo

    %115
    dod2 sold'4
    fad8\staccatissimo sold\staccatissimo fad\staccatissimo mi\staccatissimo red\staccatissimo dod\staccatissimo\mbreak
    <<
        {
            si fad'(fad fad fad fad)

            %118
            <sold si,>\staccatissimo <sold dod,>\staccatissimo sold(sold sold sold)
        }\\{
            \stemUp s4 si,2
            s4 lad2
        }
    >>
    <lad' dod,>8 si, lad si lad si
    sold'4 fad8 mi red dod

    %121
    red <fad si,>(<fad si,> <fad si,> <fad si,> <fad si,>)
    <<{<sold si,>\staccatissimo <sold dod,>\staccatissimo sold(sold sold sold)}\\{\stemUp s4 dod,2} >>\mbreak
    <lad' dod,>8 si, lad si lad si

    %124
    sold' dod lad2_+
    si4 re,4. fad8
    mi2.

    %127
    fad
    fad
    si,4 si2

    %130
    si mi4~
    mi dod fad\mbreak
    si, si lad_+

    %133
    si re4. fad8
    mi2.
    fad

    %136
    fad
    si,4 si2
    si mi4~

    %139
    mi dod fad
    si, si lad_+\mbreak
    si2.

    %142
    <sold' dod,>
    <fad dod>
    <fad si,>

    %145
    <mi si>4 si'\staccatissimo\parenthesize \f si\staccatissimo
    sol2 fad4
    mi2 fad4

    %148
    sol8.[mi16 re8. dod16 si8. lad16]
    si2.\parenthesize \p \mbreak
    <sold' dod,>

    %151
    <fad dod>
    <fad si,>
    <mi si>4 si'\staccatissimo si\staccatissimo

    %154
    sol2 fad4
    mi2 fad4
    sol8. si,16 si4 lad_+

    %157
    si2 si4
    dod2 dod4\mbreak
    si2 si4

    %160
    lad si2
    mi8.[fad16 sol8. lad16 si8. dod16]
    re,8.[mi16 fad8. sol16 lad8. si16]

    %163
    mi,8. sol16 fad4 fad
    si,2.

}


IVbcn = \relative do {

    si'4 si,2
    si2.
    lad

    %4
    si4. lad8 si dod
    re2.
    dod2 r8. lad16

    %7
    si2 si'4
    fad8 mid fad sol lad fad\mbreak
    si4 si,2

    %10
    si2.
    lad
    si4. lad8 si dod

    %13
    re2.
    dod2 r8. lad16
    si2 si'4

    %16
    fad8 mi fad sol  fad mi\mbreak
    re4 fad4. re8
    dod2 la4

    %19
    re2 sol,4
    la la'8.[si16 dod8. la16]
    re,8.[dod16 re8. mi16 fad8. re16]

    %22
    mi8.[re16 mi8. fad16 mi8. re16]
    dod8.[si16 dod8. re16 mi8. dod16]\mbreak
    re8.[dod16 re8. mi16 re8. mi16]

    %25
    fad8.[(mi16) re8.(mi16) fad8.(re16)]
    sol8.[fad16 mi8. fad16 sol8. mi16]
    la8.[(sol16) fad8.(sol16) la8.(fad16)]

    %28
    si2.\fermopz
    mi,
    la2 fad4\mbreak

    %31
    sol la la,
    re8.[dod16 re8. mi16 fad8. mi16]
    red8.[dod16 si8. dod16 red8. si16]

    %34
    mi8.[red16 mi8.(fad16) sol8.(mi16)]
    fad4 lad, fad
    si2.

    %37
    R2.*4\mbreak
    dod2.
    fad

    %43
    si,4 dod re
    mi fad fad,
    si2.

    %46
    dod
    re
    mi4 fad fad,\mbreak

    %49
    si r r
    R2.*3
    si2.

    %54
    dod
    re
    mi4 fad fad,

    %57
    si r r
    R2.*3
    r8 si'\staccatissimo re\staccatissimo si\staccatissimo  re,\staccatissimo si\staccatissimo \mbreak

    %62
    mi2.
    re
    dod

    %65
    si
    mid
    mi!

    %68
    re8 si mi dod fad fad,
    si\staccatissimo si'\staccatissimo re\staccatissimo si\staccatissimo  re,\staccatissimo si\staccatissimo \mbreak
    mi2.

    %71
    re
    dod
    si

    %74
    mid
    mi!
    re8 si mi dod fad fad,

    %77
    si\p red(red red red red)
    r mi(mi mi mi mi)
    r fad(fad fad fad fad)

    %80
    sold mi fad4 fad,
    si si'4. si,8
    lad4 lad'4. lad,8

    %83
    sold4 sold'4. sold,8
    fad4 fad fad\mbreak
    si8 red(red red red red)

    %86
    r mi(mi mi mi mi)
    r fad(fad fad fad fad)
    sold mi fad4 fad,

    %89
    si si'4. si,8
    lad4 lad'4. lad,8
    sold4 sold'4. sold,8\mbreak

    %92
    fad4 fad fad
    si4.\f fad'8 si\staccatissimo si, \staccatissimo
    lad4. lad'8 lad, lad'

    %95
    sold4. sold8 sold, sold'
    fad4. fad8 fad, fad'
    si,4. fad'8\staccatissimo  si\staccatissimo si, \staccatissimo

    %98
    lad4. lad'8 lad, lad'
    sold4. sold8 sold, sold'
    fad4. sold8 lad fad

    %101
    lad,4 fad lad
    si sold si
    dod2.~

    %104
    dod~
    dod
    r8 fad\staccatissimo lad\staccatissimo dod\staccatissimo lad\staccatissimo fad\staccatissimo\mbreak

    %107
    red2.
    r8 mid\staccatissimo sold\staccatissimo si\staccatissimo sold\staccatissimo mid\staccatissimo
    fad,2 sold4

    %110
    lad8 fad'\staccatissimo lad\staccatissimo dod\staccatissimo lad\staccatissimo fad\staccatissimo
    si, sold' si red si sold
    dod4 dod,2

    %113
    fad fad4\mbreak
    sold8\staccatissimo la\staccatissimo sold\staccatissimo fad\staccatissimo mi\staccatissimo red\staccatissimo
    dod2 mi4

    %116
    fad8\staccatissimo sold\staccatissimo fad\staccatissimo mi\staccatissimo red\staccatissimo dod\staccatissimo
    si si' si si si si
    mi, dod dod dod dod dod

    %119
    fad2~fad8. red16
    mi4 fad fad,\mbreak
    si8 si' si si si si

    %122
    mi, dod dod dod dod dod
    fad2~fad8. red16
    mi4 fad fad,

    %125
    si\f si'2
    si2.
    lad

    %128
    la!\mbreak
    sol4 red2
    mi re?4

    %131
    dod fad mi
    re8. \parenthesize (mi16) fad4 fad,
    si si'2

    %134
    si2.
    lad
    la!\mbreak

    %137
    sol4 red2
    mi re?4
    do fad mi

    %140
    re8. \parenthesize (mi16) fad4 fad,
    si2.\p
    dod

    %143
    fad,
    si
    mi,4 sol'8.\f[(la16) fad8.(sol16)]

    %146
    mi8.[(re16) mi8.(fad16) re8.(mi16)]
    dod8.[(si16) dod8.(mi16) re8.(si16)]
    mi4 fad fad,

    %149
    si2.\p
    dod
    fad,

    %152
    si
    mi,4 sol'8.\f[(la16) fad8.(sol16)]
    mi8.[(re16) mi8.(fad16) re8.(mi16)]

    %155
    dod8.[(si16) dod8.(mi16) re8.(si16)]
    mi4 fad fad,
    si si'2

    %158
    lad4 la!2
    sold4 sol2
    fad4 fad2

    %161
    mi8.[fad16 sol8. lad16 si8. dod16]
    re,8.[mi16 fad8. sol16 lad8. si16]
    mi,8. dod16 fad4 fad,

    %164
    si2.

}

IVbfn = \figures {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2.
    <2>
    <5/>
    s
    <6>
    <6+ _ 5/>2 <_>8 <_>
    <9 4>4 <3> s
    <_+>8 <7> <7>4 <7>
    s2.
    <2>
    <5/>
    s
    <6>
    <6+ _ 5/>2 <_>8 <_>
    <9 4>4 <3> s
    <_+> s <6>8 <6\\>
    s4 <6>2
    <5/> <5/>4
    s2 <6 5>4
    s <7> <7>
    s2.
    <9 4>4 <3> s
    <5/>4 <5/> <5/>
    <5 4> <3> s
    <6> s s
    <6 _ 5> <_> <_>
    <6 4> s s
    <5>2.
    <7>2 s4
    <7>2 <6>8 s
    <6 5>4 <4> <7>
    s2.
    <5/>4 <_> <_>
    <8 4> <3> <6\\>
    <7 _+> <_> <_>
    s2.*5
    <7 5/>2 s4
    <7 _+> <6 4> <7 _+>
    s <6+ 5/> <6>
    <9 7> <5 4> <7 _+>
    s2.
    <6+ 5/>
    <6>2 s4
    <6 5> <4> <7 _+>
    s2.*5
    <6+ 5/>2.
    <6>2 s4
    <6 5> <4> <7 _+>
    s2.*5
    <6 _ 5>2 <_>4
    <6>2 <6>4
    <6+ _ 5/>4 <_> <_>
    s2.
    <7/>
    <4\+ 3>
    <6>8 s <6 5>4 <7 _+>
    s2.
    <6 _ 5>2 <_>4
    <6>2.
    <6+ 5/>
    s
    <7/>
    <4\+ 3>
    <6>8 s <6 5>4 <4>8 <7 _+>
    s8 <6> s2
    s8 <6 5> s2
    s8 <6 4> s2
    <5>16 s <6 5>8 <7>4 <7>
    s2 <6>4
    <7> <6> s
    <7> <6> s
    <7> <6 4> <7>
    s8 <6> s2
    s8 <6 5> s2
    s8 <6  4> s2
    <7 5>16 s <6 5>8 <7>4 <7>
    s2 <6>4
    <7> <6> s
    <7> <6> s
    <7> <6 4> <7>
    s4 s8 <7> s4
    <6>2.
    <7>4. <6+\\>8 s4
    s s8 <7> s4
    s s8 <7> s4
    <6>2 <6>4
    <7> s8 <6+\\> s4
    s s8 <6+\\> <6> <6>16 s
    <6>2 <5/>4
    s <7> <7>8 s
    <7 _ _+>4 <_> <6 4>
    <7 _ _+>4 <_> <6 4>
    <_+>2.
    s4 <_> <_>
    <6 5>2.
    s8 <5/> <5/>4 <5/>
    <9> <8> <6+\\>
    <6>2 <6>4
    <9 7> <6 _ 5> <_>
    <4> <7 _+> s
    s2 <6 5 _->4
    <_+>8 <_+> <_+>4 <6>8 <6\\>
    s2 <6 5>4
    <_> <_> <6>8 <6\\>
    s4 <7!> s
    <_>8 <_> <7 _+>2
    s2 s8. <6>32 s
    <6 5>4 <4> <7>
    s8 <7!> s2
    <_>8 <_> <7 _+>2
    s2 s8. <6>32 s
    <6 5>4 <4> <7>
    s2.
    <2>
    <5/>
    <4\+>
    <6>4 <5/>2
    <3>4 <_+> <4\+>
    <6> <_+> <4\+>
    <6>8 s16 <6 5> <4>4 <7 _+>
    s2.
    <2>
    <5/>
    <4\+>
    <6>4 <5/>2
    <3>4 <_+> <4\+>
    <6> <_+> <4\+>
    <6>8 s16 <6 5> <4>4 <7 _+>
    s2 <6 5>4
    <7 _+>2 s4
    <7! _+>2 s4
    <7! _+>2 s4
    s4 <6>8 s <6 4> s
    <6 _ 5>4 <_> <6>
    <6+> <6+> <6>8 s
    <6 5>4 <4> <7 _+>
    s2 <6 5>4
    <7 _+>2 s4
    <7! _+>2 s4
    <7! _+>2 s4
    s4 <6>8 s <6 4> s
    <6 _ 5>4 <_> <6>
    <6+> <6+> <6>8 s
    <6 5>4 <4> <7 _+>
    s2 <6>4
    <7/> <6> s
    <7> <6> s
    <_+> <6 4> s
    <6 _ 5>2 <_>4
    <6>2 <6>8 s
    <6 5>4 <4> <7 _+>

}

forma = {

    \time 3/4
    \once\override Staff.TimeSignature.style = #'single-digit
    \key si\minor
    \tempo 2 = 47
    s2.*76\break
    \once\override Score.RehearsalMark.extra-offset = #'(0 . -1)
    \mark\markup\huge "[Majeur]"
    \key si\major
    \tempo 2 = 50
    s2.*48\break
    \once\override Score.RehearsalMark.extra-offset = #'(0 . -1.0)
    \mark\markup\huge "[Mineur]"
    \key si\minor
    \tempo 2 = 47
    s2.*40
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
#(set-global-staff-size 17.5)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup\smaller{Concert de simphonies Op. IV n. III}
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
            \override StaffGrouper.staff-staff-spacing.padding = #2
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

\pageBreak

\markup \huge {[2.] Aria grazioso }

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
            \override StaffGrouper.staff-staff-spacing.padding = #2
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

\pageBreak

\markup \huge {[3.] Allegro }

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
            \override StaffGrouper.staff-staff-spacing.padding = #2
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

\pageBreak

\markup \huge {[4.] Passacaille }

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
            \override StaffGrouper.staff-staff-spacing.padding = #2
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
