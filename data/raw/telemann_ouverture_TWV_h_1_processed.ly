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

soli = ^\markup \italic { seuls }

solo = ^\markup \italic { seul }

tu = ^\markup \italic {tous}

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
    \override TupletBracket.bracket-visibility = ##f
}

IobIn =  \relative do'' {

    r4 fad, re'4. mi8
    dod4. dod8 fad8.[mi16 re8. dod16]
    si4 r8 si mi4 r8 mi

    %4
    mi8.[re16 dod8. re16] re4.-+ dod8
    dod2 fad4. fad8
    fad4 si8. red,16 mi8. mi16 fad8. sol16

    %7
    fad4 si, la'4. si8
    sol4. fad8 fad4. mi8
    mi4. fad16 sol si,8. dod32 re dod8. re32 mi

    %10
    la,2 do4. re8\mbreak
    si4. si8 dod!4. re8
    dod4 mi sol4. la8

    %13
    fad4. fad8 sol8. la16 la8. sol32 la
    si4. la8 sol8. [fad16 mi8. re16 ]
    la'2 mi4 fad8 sol

    %16
    fad4. mi8 mi4.-+ re16 dod
    re8.[mi16 re8. mi16] mi4. fad8
    fad1 fad8 dod mi lad, si16 re dod si dod [mi re dod]

    %19
    re mi re mi fad[sol fad sol] sol,8 mi'4 red8\mbreak
    mi16 fad mi fad re![mi re mi] dod8 mi lad,[dod]
    re16 fad mi re mi[sol fad mi] fad8 la red,[fad]

    %22
    sol16 si la sol la[do si la] si do si la sol[la sol la]
    fad sol fad sol la[si la si] re,8 sol4 fad8
    sol16 la sol la fad[sol fad sol] mi fad mi fad re[mi re mi]

    %25
    dod re dod re mi[fad mi fad] la,8 re4 dod8\mbreak
    re16 fad mi re mi [sol fad mi] fad la sol fad sol[si la sol]
    la8 re,4 sol8 dod, mi4 la,8

    %28
    re16 mi re mi mi8. [re16] re8 [fad,16\solo sol] la8[si16 sol]
    la8 fad re [re] re fad16 sol la8[si16 sol]
    la8 re re re si mi mi mi
    dod dod16 re mi8[fad16 re] mi8 dod la[la]
    la dod16 re mi8[fad16 re] mi8 la la[la]
    fad si si si \mbreak sold16\tu[la sold la] si [dod si dod]

    %34
    mi,8 la4 sold8 la mi sol[dod,]
    re16 fad mi re mi[sol fad mi] fad sol fad sol mi[fad mi fad]
    re mi re mi dod[re dod re]mi fad mi fad re[mi re mi]

    %37
    dod re dod re si[dod si dod] lad4 r
    r2 si'8 fad la[red,]
    mi16 sol fad mi fad[la sol fad] sol la sol fad mi[sol fad sol]

    %40
    la8 dod, sol'[dod,]\mbreak  re16[fad mi re] mi sol fad mi
    fad8 dod mi[lad,] si16 re dod si dod [mi re dod]
    re fad mi re mi[sol fad mi] fad8 si,4 mi8~

    %43
    mi lad, dod[fad,] si16 dod si dod dod8.[si16]
    si8\solo re16 mi fad8[sol16 mi] fad8 re si[si]
    si re16 mi fad8[sol16 mi] fad8 sol sol sol

    %46
    sol fad fad fad fad[mi mi mi]
    mi re16 dod re[fad mi re] dod mi re dod re[fad mi re]
    dod mi re dod re[fad mi re] dod re dod re mi[fad mi fad]\mbreak

    %49
    sol4. sol8 fad4. mi8
    red2~ red8. red16 mi8.[fad16]
    si,4~si16 la sold32 fad mi16 re'4. mi8

    %52
    dod4. si16 la la'4. dod,8
    re4~re32 dod si la sol fad mi re do'4. re8
    si4 sol' dod,! mi

    %55
    lad,2 fad'4. sol8
    mi4. re8 dod4. si8
    si4 r r2

    %58
    fad'8 dod re lad si16 re dod si dod[mi re dod] si1

}

IobIIn = \relative do'' {

    r4 re, fad4. fad8
    sol2 fad4. fad8
    red2 si'4. si8

    %4
    dod8.[si16 lad8. si16] si4. lad8
    lad?2 si4. si8
    si2 si4. si8

    %7
    si2. red4
    mi4. fad8 red4. si8
    si2. la4

    %10
    la2 sol4. la8\mbreak
    sol4. sol8 sol4. la8
    la4. dod8 mi4. dod8

    %13
    re4. re8 re4 fad
    sol2 re4. re8
    re2 dod4. dod8

    %16
    re4. mi8 dod4. dod8
    si4. dod8 dod4. si8
    lad1 lad4 r r2

    %19
    si8 mi, la[red,] mi16 sol fad mi fad [la sol fad]\mbreak
    sol la sol la si [dod si dod] lad[ si lad si] dod re dod re
    fad,8 si4 lad8 si si si[si]

    %22
    si si la[re] re re re[re]
    re re re[re] si16 re do si do [mi re do]
    re [mi re mi] do re do re si [do si do] la si la si

    %25
    mi,8 mi mi[mi] fad16 la sol fad sol [si la sol]\mbreak
    re'16 fad mi re mi [sol fad mi] fad la sol fad sol[si la sol]
    la8 re,4 sol8 dod, mi4 la,8

    %28
    re16 mi re mi mi8. [re16] re8 re,16\solo mi fad8[sol16 mi]
    fad8 re re[re] re re16 mi fad8[sol16 mi]
    fad8 la la la sol si si si

    %31
    la la16 si dod8[re16 si]  dod8 la la[la]
    la la16 si dod8[re16 si] dod8 mi mi[mi]
    re fad fad fad\mbreak sold16\tu la sold la si[dod si dod]

    %34
    mi,8 la4 sold8 la mi sol[dod,]
    re16 fad mi re mi[sol fad mi] fad sol fad sol mi[fad mi fad]
    re mi re mi dod[re dod re]mi fad mi fad re[mi re mi]

    %37
    dod re dod re si[dod si dod] lad4 r
    r2 si'8 fad la[red,]
    mi16 sol fad mi fad[la sol fad] sol la sol fad mi[sol fad sol]

    %40
    la8 dod, sol'[dod,]\mbreak  re16[fad mi re] mi sol fad mi
    fad8 dod mi[lad,] si16 re dod si dod [mi re dod]
    re fad mi re mi[sol fad mi] fad8 si,4 mi8~

    %43
    mi lad, dod[fad,] si16 dod si dod dod8.[si16]
    si8\solo si16 dod re8[mi16 dod] re8 re si si
    si si16 dod re8[mi16 dod] re8 re si[si]

    %46
    dod dod la[la] si si si si
    dod si16 lad si [re dod si] lad[dod si lad] si re dod si
    lad dod si lad si[re dod si] lad si lad si dod[re dod re]\mbreak

    %49
    mi1
    la,4. la8 fad4. fad8
    sold2~sold8. si16 la8.[sold16]

    %52
    la2 dod4. dod8
    la2~la8. la16 sol8.[fad16]
    sol2 sol

    %55
    fad si4. si8
    lad4. si8 lad4. fad8
    fad4 r r2

    %58
    R1 fad

}

IvlIn = \relative do'' {

    r4 fad, re'4. mi8
    dod4. dod8 fad8.[mi16 re8. dod16]
    si4 r8 si mi4 r8 mi

    %4
    mi8.[re16 dod8. re16] re4.-+ dod8
    dod2 fad4. fad8
    fad4 si8. red,16 mi8. mi16 fad8. sol16

    %7
    fad4 si, la'4. si8
    sol4. fad8 fad4. mi8
    mi4. fad16 sol si,8. dod32 re dod8. re32 mi

    %10
    la,2 do4. re8\mbreak
    si4. si8 dod!4. re8
    dod4 mi sol4. la8

    %13
    fad4. fad8 sol8. la16 la8. sol32 la
    si4. la8 sol8. [fad16 mi8. re16 ]
    la'2 mi4 fad8 sol

    %16
    fad4. mi8 mi4. re16 dod
    re8.[mi16 re8. mi16] mi4. fad8
    fad1 fad8 dod mi lad, si16 re dod si dod [mi re dod]

    %19
    re mi re mi fad[sol fad sol] sol,8 mi'4 red8\mbreak
    mi16 fad mi fad re![mi re mi] dod8 mi lad,[dod]
    re16 fad mi re mi[sol fad mi] fad8 la red,[fad]

    %22
    sol16 si la sol la[do si la] si do si la sol[la sol la]
    fad sol fad sol la[si la si] re,8 sol4 fad8
    sol16 la sol la fad[sol fad sol] mi fad mi fad re[mi re mi]

    %25
    dod re dod re mi[fad mi fad] la,8 re4 dod8\mbreak
    re16 fad mi re mi [sol fad mi] fad la sol fad sol[si la sol]
    la8 re,4 sol8 dod, mi4 la,8

    %28
    re16 mi re mi mi8. [re16] re8 re,\solo[re re]
    re fad16 sol la8[si16 sol] la8 fad re[re]
    re fad16 sol la[si sol la] si8 sold16 la si[dod la si]

    %31
    dod8 la la[la] la dod16 re mi8[fad16 re]
    mi8 dod la[la] la dod16 re mi[fad re mi]
    fad8 red16 mi fad[sold mi fad]\mbreak sold\tu la sold la si [dod si dod]

    %34
    mi,8 la4 sold8 la mi sol[dod,]
    re16 fad mi re mi[sol fad mi] fad sol fad sol mi[fad mi fad]
    re mi re mi dod[re dod re]mi fad mi fad re[mi re mi]

    %37
    dod re dod re si[dod si dod] lad4 r
    r2 si'8 fad la[red,]
    mi16 sol fad mi fad[la sol fad] sol la sol fad mi[sol fad sol]

    %40
    la8 dod, sol'[dod,]\mbreak  re16[fad mi re] mi sol fad mi
    fad8 dod mi[lad,] si16 re dod si dod [mi re dod]
    re fad mi re mi[sol fad mi] fad8 si,4 mi8~

    %43
    mi lad, dod[fad,] si16 dod si dod dod8.[si16]
    si8\solo si si si si re16 mi fad8 [sol16 mi]
    fad8 re si[si] si re16 dod re[mi re mi]

    %46
    dod si dod re dod[re dod re] si la si dod si[dod si dod]
    lad8[r si] r dod[r si] r
    lad r r4 r2

    %49
    sol'4. sol8 fad4. mi8
    red2~ red8. red16 mi8.[fad16]
    si,4~si16 la sold32 fad mi16 re'4. mi8

    %52
    dod4. si16 la la'4. dod,8
    re4~re32 dod si la sol fad mi re do'4. re8
    si4 sol' dod,! mi

    %55
    lad,2 fad'4. sol8
    mi4. re8 dod4. si8
    si4 r r2

    %58
    fad'8 dod re lad si16 re dod si dod[mi re dod] si1

}

IvlIIn = \relative do'' {

    r4 re, fad4. fad8
    sol2 fad4. fad8
    red2 si'4. si8

    %4
    dod8.[si16 lad8. si16] si4. lad8
    lad?2 si4. si8
    si2 si4. si8

    %7
    si2. red4
    mi4. fad8 red4. si8
    si2. la4

    %10
    la2 sol4. la8\mbreak
    sol4. sol8 sol4. la8
    la4. dod8 mi4. dod8

    %13
    re4. re8 re4 fad
    sol2 re4. re8
    re2 dod4. dod8

    %16
    re4. mi8 dod4. dod8
    si4. dod8 dod4. si8
    lad1 lad4 r r2

    %19
    si8 mi, la[red,] mi16 sol fad mi fad [la sol fad]\mbreak
    sol la sol la si [dod si dod] lad[ si lad si] dod re dod re
    fad,8 si4 lad8 si si si[si]

    %22
    si si la[re] re re re[re]
    re re re[re] si16 re do si do [mi re do]
    re [mi re mi] do re do re si [do si do] la si la si

    %25
    mi,8 mi mi[mi] fad16 la sol fad sol [si la sol]\mbreak
    re'16 fad mi re mi [sol fad mi] fad la sol fad sol[si la sol]
    la8 re,4 sol8 dod, mi4 la,8

    %28
    re16 mi re mi mi8. [re16] re8 re,\solo[re re]
    re re16 mi fad8 [sol16 mi] fad8 re re[re]
    re re16 mi fad[sol mi fad] sol8 mi16 fad sold [la fad sold]

    %31
    la8 fad fad[fad] la la16 si dod8[re16 si]
    dod8 la la[la] la la16 si dod[re si dod]
    re8 si16 dod red [mi dod red]\mbreak mi8\tu sold16 la si[dod si dod]

    %34
    mi,8 la4 sold8 la mi sol[dod,]
    re16 fad mi re mi[sol fad mi] fad sol fad sol mi[fad mi fad]
    re mi re mi dod[re dod re]mi fad mi fad re[mi re mi]

    %37
    dod re dod re si[dod si dod] lad4 r
    r2 si'8 fad la[red,]
    mi16 sol fad mi fad[la sol fad] sol la sol fad mi[sol fad sol]

    %40
    la8 dod, sol'[dod,]\mbreak  re16[fad mi re] mi sol fad mi
    fad8 dod mi[lad,] si16 re dod si dod [mi re dod]
    re fad mi re mi[sol fad mi] fad8 si,4 mi8~

    %43
    mi lad, dod[fad,] si16 dod si dod dod8.[si16]
    si8\solo si si si si si16 dod re8[mi16 dod]
    re8 si si si si si16 la si[dod si dod]

    %46
    la sol la si la[si la si] sol fad sol la sol[la sol la]
    fad8[r fad] r fad[r fad] r
    fad r r4 r2

    %49
    mi'1
    la,4. la8 fad4. fad8
    sold2~sold8. si16 la8.[sold16]

    %52
    la2 dod4. dod8
    la2~la8. la16 sol8.[fad16]
    sol2 sol

    %55
    fad si4. si8
    lad4. si8 lad4. fad8
    fad4 r r2

    %58
    R1 fad

}

Ivlripn = \relative do'' {

    r4 fad, re'4. mi8
    dod4. dod8 fad8.[mi16 re8. dod16]
    si4 r8 si mi4 r8 mi

    %4
    mi8.[re16 dod8. re16] re4.-+ dod8
    dod2 fad4. fad8
    fad4 si8. red,16 mi8. mi16 fad8. sol16

    %7
    fad4 si, la'4. si8
    sol4. fad8 fad4. mi8
    mi4. fad16 sol si,8. dod32 re dod8. re32 mi

    %10
    la,2 do4. re8\mbreak
    si4. si8 dod!4. re8
    dod4 mi sol4. la8

    %13
    fad4. fad8 sol8. la16 la8. sol32 la
    si4. la8 sol8. [fad16 mi8. re16 ]
    la'2 mi4 fad8 sol

    %16
    fad4. mi8 mi4. re16 dod
    re8.[mi16 re8. mi16] mi4. fad8
    fad1 fad8 dod mi lad, si16 re dod si dod [mi re dod]

    %19
    re mi re mi fad[sol fad sol] sol,8 mi'4 red8\mbreak
    mi16 fad mi fad re![mi re mi] dod8 mi lad,[dod]
    re16 fad mi re mi[sol fad mi] fad8 la red,[fad]

    %22
    sol16 si la sol la[do si la] si do si la sol[la sol la]
    fad sol fad sol la[si la si] re,8 sol4 fad8
    sol16 la sol la fad[sol fad sol] mi fad mi fad re[mi re mi]

    %25
    dod re dod re mi[fad mi fad] la,8 re4 dod8\mbreak
    la8 re4 dod8 re re dod[dod]
    la16 dod si la si [re dod si] dod8 dod dod[dod]

    %28
    re re re[dod] la4 r
    R1*4

    %33
    r2 r8 mi' mi mi
    dod16 mi re dod re[fad mi re] mi8 mi dod dod
    la la si[la] re la lad[lad]

    %36
    si fad fad[fad] si16 dod si dod la [si la si]
    sol la sol fad mi8 [sol] fad[lad16 si] dod re dod re
    fad,8 si4 lad8 si si fad[fad]

    %39
    sol sol la[si] si si si[si]
    la la mi[mi]\mbreak fad fad sol[la]
    dod dod lad[lad] fad fad sol[fad]

    %42
    si si la[la] fad16 la sol fad sol[si la sol]
    la8 la la[la] si si si[lad]
    fad r r4 r2

    %45
    R1*4

    %49
    sol'4. sol8 fad4. mi8
    red2~ red8. red16 mi8.[fad16]
    si,4~si16 la sold32 fad mi16 re'4. mi8

    %52
    dod4. si16 la la'4. dod,8
    re4~re32 dod si la sol fad mi re do'4. re8
    si4 sol' dod,! mi

    %55
    lad,2 fad'4. sol8
    mi4. re8 dod4. si8
    si4 r r2

    %58
    fad'8 dod re lad si16 re dod si dod[mi re dod] si1

}

Ivlan = \relative do' {

    r4 si4 si4. si8
    mi2 dod4. fad8
    fad2 mi4. mi8

    %4
    mi4 fad fad4. fad8
    fad2 la4. la8
    la2 sol4. sol8

    %7
    si2. si4
    si do fad, si
    sol2. mi4

    %10
    re2 re4 fad\mbreak
    re4. re8 mi4. fad8
    mi2 la4. la8

    %13
    la4. la8 si4 do
    re2 si4. si8
    la2 la4. la8

    %16
    la4. si8 la4 fad
    fad4. fad8 sol2
    dod,1 dod8 r r4 r2

    %19
    R1\mbreak
    r2 fad8 dod mi[lad,]
    si16 re dod si dod[mi re dod]  re mi re mi fad[sol fad sol]

    %22
    si,8 mi re[re] sol sol sol[si]
    la la fad[fad] re re la'[la]
    sol re fad[la] si si, re[fad]

    %25
    mi mi dod [dod] la la mi'[mi]\mbreak
    re re si'[la] la la sol[sol]
    fad fad mi[mi] mi mi la[la]

    %28
    la la la[la] fad4 r
    R1*4
    r2 si8 si sold[sold]

    %34
    mi mi re[re] la' la mi[mi]
    fad fad sol[la] la la mi[mi]
    fad fad dod[dod] si si re[re]

    %37
    mi16 fad mi fad sol8[mi] dod dod lad[lad]
    re16 fad mi re mi[sol fad mi] fad8 fad red[red]
    si si do[si] mi mi mi[mi]

    %40
    mi mi dod![dod]\mbreak la la si[la]
    fad' fad dod[dod] re re mi[fad]
    fad fad fad[mi] re re dod[dod]

    %43
    dod dod fad[fad] fad fad fad[fad]
    re r r4 r2
    R1*4

    %49
    lad'1
    fad4. fad8 red4. red8
    mi2~mi8. mi16 mi8.[mi16]

    %52
    mi2 mi4. mi8
    re2~re8. re16 re8.[re16]
    re2 mi

    %55
    dod re4. si8
    mi4. fad8 fad4. fad8
    re4 r r2

    %58
    R1 re\mbreak

}


Ibcn = \relative do {

    si2 si'~
    si8. si16 la8.[sol16] la2~
    la8. la16 sol8.[fad16] sol8. fad16 mi8.[re16]

    %4
    dod4 fad si si,
    fad'4. mi8 red dod si la
    sol2~sol8. sol16 fad8.[mi16]

    %7
    red2. si'4
    mi la si si,
    mi2 sol4. sol8

    %10
    fad4. sol16 la mi8.[fad32 sol] re8. mi32 fad\mbreak
    sol,4 sol'8. fad16 mi4 re
    la'2 dod,4 la

    %13
    re re'8. dod16 si4 la
    sol4. la8 si4. si8
    fad4. sol8 la4. la8

    %16
    re,4  sol, la lad
    si4. la!8 sol2
    fad4. fad'8 fad8. mi16 re8.[dod16] fad,4 r r2

    %19
    R1*2
    r2 si'8 fad la[red,]
    mi16 sol fad mi fad[la sol fad] sol la sol la si[do si do]

    %23
    re8 la do[fad,] sol16 si la sol la[do si la]
    si do si do la[si la si] sol la sol la fad[sol fad sol]
    la8 mi sol[dod,] re16 fad mi re mi[sol fad mi]\mbreak

    %26
    fad8 si sol[la] re,16 fad mi re mi[sol fad mi]
    fad la sol fad sol[si la sol] la si la si sol[la sol la]
    fad sol fad sol la8[la,] re4 r

    %29
    R1*4
    r2 mi8 si re[sold,]
    la16 dod si la si[re dod si] dod re dod re mi[fad mi fad]

    %35
    la,8 re4 dod8 re16 mi re mi dod[re dod re]
    si dod si dod la[si la si] sol[la sol la] fad sol fad sol
    mi4 r fad'8 dod mi[lad,]

    %38
    si16 re dod si dod[mi re dod] re mi re mi fad[sol fad sol]
    si,8 mi4 red8 mi mi, mi'[re?]
    dod16 re dod re mi[fad mi fad]\mbreak lad,8 re4 dod8

    %41
    lad16 si lad si dod[re dod re] fad,8 si4 lad8
    si16 re dod si dod[mi re dod] re fad mi re mi[sol fad mi]
    fad sol fad sol mi[fad mi fad] re mi re mi fad8[fad,]

    %44
    si r r4 r2
    R1*4\mbreak
    fad1

    %50
    fad'4. fad8 si4. la8
    sold2~sold8. sold16 fad8.[mi16]
    la4~la32 sold fad mi re dod si la sol'4. la8

    %53
    fad2~fad8. fad16 mi8.[re16]
    sol2 mi
    mi re4. mi8

    %56
    dod4 si fad' fad,
    si16 re dod si dod[mi re dod] re fad mi re mi[sol fad mi]
    fad4 r r2 si,1

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 4/4
    \key si\minor
    \tempo 2 = 40
    \repeat volta 2 {s1*17}
    \alternative {{s1}{\time 2/2 \tempo 2 = 50 s}}\break
    \set Score.currentBarNumber = #19
    \repeat volta 2 {
        s1*30
        \time 4/4 \tempo 2 = 40 s1*8
    }
    \alternative {{\time 2/2 \tempo 2 = 60 s1*2}{\time 4/4 s1}}
    \bar"|."

}

IobI = {
    \Iglobal
    \notypeset
    <<\IobIn \forma>>

}

IobII = {
    \Iglobal
    <<\IobIIn \forma>>

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}

Ivlrip = {
    \Iglobal
    <<\Ivlripn \forma>>

}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma\Ibfn >>
    \typeset

}


IIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\tupletSpan 4 \con
			}

IIvlIn = \relative do'' {

    r8 si
    si4. dod8 re4 dod re4. mi8
    mi4. re16 mi fad4 sol mi4. re8
    mi4 dod fad mi8 re dod4 re8 si

    %4
    lad4. si8 dod4 fad, si dod
    re4. mi8 fad4 mi fad4. sol8
    sol4. fad16 sol la4 si sol4. fad8

    %7
    mi4 re8 dod re4. mi8 mi4. re8
    re2.~re2 r8 la\mbreak
    la4. re8 dod4 re si4. mi8

    %10
    dod4. si8 la4 la' sold4. la8
    fad4. sold8 la4 si sold4. fad8
    mid4 dod fad4. sold8 sold4. fad8

    %13
    fad4 mi8 red mi4. fad8 fad4. mi8
    mi4 re8 dod re4. mi8 mi4. re16 mi
    fad2 si,4 la8 sold la4. si8

    %16
    sold4. la8 si4 lad si4. dod8
    lad4 fad re'4. dod8 dod4. si8
    si2.~si2

}

IIvlIIn = \relative do'' {

    r8 fad,
    fad2 fad4 fad si re
    re dod re re dod2
    dod si4 sol sol2

    %4
    fad2. fad4 fad lad
    si2 la!4 la re2
    dod re4 re dod4. re8

    %7
    dod4 la re4. re8 dod4. la8
    la2.~la2 r8 fad\mbreak
    fad2 sol4 la si sold

    %10
    la2 la4 mi' re mi
    re2 mi4 re2 si4
    dod2 dod4 re2 dod4

    %13
    dod si si do si2
    si4 la la si dod!4.-+ si16 dod
    re2 fad, fad

    %16
    mi2. mi4 fad sol
    fad lad si4. dod8 lad4. fad8
    fad2.~fad2

}

IIvlan = \relative do' {

    r8 re
    re2 re4 fad fad la
    si la la sol sol2
    fad fad4 sol mi4. re8

    %4
    dod2. dod4 re mi
    fad2 re4 la' la2
    sol fad4 re sol la

    %7
    la2 fad4 si la2
    fad2.~fad2 r8 re\mbreak
    re2 sol4 fad mi mi

    %10
    mi2 mi4 la2 la4
    la2 la4 sold2 sold4
    sold?2 fad4 fad mid2

    %13
    fad mi!4 mi red2
    mi2 re!4 re la'2
    la si, si

    %16
    si2. mi4 re dod
    dod2 si4 sol' fad2
    re2.~re2

}


IIbcn = \relative do {

    r8 si
    si2 si'4 lad si fad
    sol la re, si dod si
    lad2 re,4 mi mi2

    %4
    fad fad'4 mi re dod
    si4. dod8 re4 dod re4. mi8
    mi4. re16 mi fad4 sol mi re

    %7
    la'2 si4 sol la la,
    re2.~re2 r8 re\mbreak
    re2 mi4 fad sold mi

    %10
    la2 la,4 dod si dod
    re re' dod si4. dod8 re4
    dod4. si8 la4 si dod si

    %13
    lad si sol la? si la
    sold la fad sol la la,
    re2 red si

    %16
    mi2. dod4 re mi
    fad2 si4 mi, fad fad,
    si2.~si2

}

IIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\time 6/4
\key si\minor
\tempo 1 = 55
\partial 4 s4
s1.*7
s2. s2
\bar":..:"
s4
s1.*9
s2. s2
\bar":|."

}

IIvlI = {
	\IIglobal
	%\notypeset
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

IIbc = {
	\IIglobal
	\clef bass
	<<\IIbcn \forma\IIbfn >>
	\typeset

}


IIIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\tupletSpan 4 \con
			}

IIIobIn =  \relative do'' {

    fad2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %4
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %7
    re dod8 si dod4 lad
    si1  si
    R1*8

    %17
    fad'2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %20
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %23
    re dod8 si dod4 lad
    si1
    fad'8 sol la4 fad8 sol la4

    %26
    si la la2
    fad8 sol la4 fad8 sol la4

    %28
    fad mi mi2
    la re,4 fad
    mi2 la,4 la'\mbreak

    %31
    fad mi8 re mi4 dod
    re8 dod re mi re mi mi8.-+ re32 mi
    fad2 si,4 re

    %34
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %36
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %39
    re dod8 si dod4 lad
    si fad si la
    sold2 r4 la

    %42
    mi2 r4 mi
    sold2 r4 sold

    %44
    la2 r4 la
    la2 r4 la
    la2 r4 la\mbreak

    %47
    la2 r4 la
    la2 r4 la
    lad2 r4 lad

    %50
    si2 r4 la!
    sol1
    fad

    %53
    fad'2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %56
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %59
    re dod8 si dod4 lad
    si1\fermata

}

IIIobIIn = \relative do'' {

    fad2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %4
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %7
    re dod8 si dod4 lad
    si1 si
    R1*8

    %17
    fad'2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %20
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %23
    re dod8 si dod4 lad
    si1
    re8 mi fad4 re8 mi fad4

    %26
    sol fad fad2
    re8 mi fad4 re8 mi fad4
    re dod dod2

    %29
    re r4 la4
    la2 r4 mi'\mbreak
    re la si la

    %32
    la1
    fad'2 si,4 re
    dod2 fad,4 fad'

    %35
    fad-+ mi mi fad8 sol
    la2 re,4 mi
    fad2 si,4 re

    %38
    dod2 fad,4 fad'
    re dod8 si dod4 lad
    si fad si la

    %41
    sold2 r4 la
    mi2 r4 mi
    sold2 r4 sold

    %44
    la2 r4 la
    la2 r4 la
    la2 r4 la\mbreak

    %47
    la2 r4 la
    la2 r4 la
    lad2 r4 lad

    %50
    si2 r4 la!
    sol1
    fad

    %53
    fad'2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %56
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %59
    re dod8 si dod4 lad
    si1\fermata

}

IIIvlIn = \relative do'' {

    fad2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %4
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %7
    re dod8 si dod4 lad
    si1  si
    fad'8(mi) fad4 fad8(mi) fad4

    %10
    sol8(fad) sol4 sol2
    si8(la) si4 sol8(fad) sol4
    fad8 mi fad4 fad2\mbreak

    %13
    si mi,4 sol
    fad2 si,4 si'
    sol fad8 mi fad4 red

    %16
    mi8 red mi fad mi fad re? mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %19
    fad-+ mi mi fad8 sol
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %23
    re dod8 si dod4 lad
    si1
    R1*8

    %33
    fad'2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %36
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %39
    re dod8 si dod4 lad
    si1
    re8 dod re mi re mi dod re

    %42
    si la si dod si dod si dod
    re dod re mi re mi re mi
    dod si dod re dod re dod re

    %45
    mi re mi4 mi8 re mi4
    fad8 mi fad4 fad2\mbreak
    la8 sol la4 fad8 mi fad4

    %48
    mi8 re mi4 mi2
    sol8 fad mi4 sol8 fad mi4
    re8 dod re4 re2

    %51
    mi8 fad re mi mi4. fad8
    fad1
    fad2 si,4 re

    %54
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol
    la2 re,4 mi

    %57
    fad2 si,4 re
    dod2 fad,4 fad'
    re dod8 si dod4 lad

    %60
    si1\fermata

}

IIIvlIIn = \relative do'' {

    fad2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %4
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %7
    re dod8 si dod4 lad
    si1  si
    red8 (dod) red4 red8 (dod) red4

    %10
    mi8(red) mi4 mi2
    sol8(fad) sol4 mi8(red) mi4
    re?8 dod re4 re2\mbreak

    %13
    mi r4 si
    si2 r4 fad'
    mi si do si

    %16
    si1
    fad'2 si,4 re
    dod2 fad,4 fad'

    %19
    fad-+ mi mi fad8 sol
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %23
    re dod8 si dod4 lad
    si1
    R1*8

    %33
    fad'2 si,4 re
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol

    %36
    la2 re,4 mi
    fad2 si,4 re
    dod2 fad,4 fad'

    %39
    re dod8 si dod4 lad
    si1
    si8 la si dod si dod la si

    %42
    sold fad sold la sold la sold la
    si la si dod si dod si dod
    la sold la si la si la si

    %45
    dod si dod4 dod8 si dod4
    re8 dod re4 re2\mbreak
    fad8 mi fad4 re8 dod re4

    %48
    dod8 si dod4 dod2
    mi8 re dod4 mi8 re dod4
    si8 lad si4 si2

    %51
    si4. dod8 dod4. si8
    lad1
    fad'2 si,4 re

    %54
    dod2 fad,4 fad'
    fad-+ mi mi fad8 sol
    la2 re,4 mi

    %57
    fad2 si,4 re
    dod2 fad,4 fad'
    re dod8 si dod4 lad

    %60
    si1\fermata

}

IIIvlripn = \relative do'' {

    re2 r4 fad,
    fad2 r4 dod'
    si2 r4 si

    %4
    la2 r4 dod
    re2 r4 fad,
    mi2 r4 dod'

    %7
    si si sol fad
    fad1 fad
    R1*8

    %17
    re'2 r4 fad,
    fad2 r4 dod'
    si2 r4 si

    %20
    la2 r4 dod
    re2 r4 fad,
    mi2 r4 dod'

    %23
    si si sol fad
    fad1
    R1*8

    %33
    re'2 r4 fad,
    fad2 r4 dod'
    si2 r4 si

    %36
    la2 r4 dod
    re2 r4 fad,
    mi2 r4 dod'

    %39
    si si sol fad
    fad1
    R1*12

    %53
    re'2 r4 fad,
    fad2 r4 dod'
    si2 r4 si

    %56
    la2 r4 dod
    re2 r4 fad,
    mi2 r4 dod'

    %59
    si si sol fad
    fad1\fermata

}

IIIvlan = \relative do' {

    si'2 r4 si,
    dod2 r4 la
    si2 r4 sol

    %4
    re'2 r4 sol
    la2 r4 si,
    dod2 r4 fad

    %7
    fad re mi dod
    re1 re
    si'2 r4 si

    %10
    si2 r4 si
    si2 r4 si
    si2 r4 si\mbreak

    %13
    sol2 r4 mi
    red2 r4 red
    mi sol, la si

    %16
    mi1
    si'2 r4 si,
    dod2 r4 la

    %19
    si2 r4 sol
    re'2 r4 sol
    la2 r4 si,

    %22
    dod2 r4 fad
    fad re mi dod
    re1

    %25
    R1*8
    si'2 r4 si,
    dod2 r4 la

    %35
    si2 r4 sol
    re'2 r4 sol
    la2 r4 si,

    %38
    dod2 r4 fad
    fad re mi dod
    re1

    %41
    R1*12
    si'2 r4 si,
    dod2 r4 la

    %55
    si2 r4 sol
    re'2 r4 sol
    la2 r4 si,

    %58
    dod2 r4 fad
    fad re mi dod
    re1\fermata

}


IIIfgn = \relative do {

    si'2 r4 si
    la2 r4 la
    sol2 r4 sol

    %4
    fad2 r4 mi
    re2 r4 si
    lad2 r4 lad

    %7
    si sol' mi fad
    si,8 si' la sol fad mi re dod si1
    si2 r

    %10
    R1*7
    si'2 r4 si
    la2 r4 la

    %19
    sol2 r4 sol
    fad2 r4 mi
    re2 r4 si

    %22
    lad2 r4 lad
    si sol' mi fad
    si4 fad si,2

    %25
    re2\solo r4 re
    re2 r4 re
    re2 r4 re

    %28
    la'2 r4 sol
    fad2 r4 re
    dod2. dod4\mbreak

    %31
    re fad, sol la
    re2 r4 dod
    si2 r4 si'

    %34
    la2 r4 la
    sol2 r4 sol
    fad2 r4 mi

    %37
    re2 r4 si
    lad2 r4 lad
    si sol' mi fad

    %40
    si,1
    R1*11
    r4 fad'8 sold la4 fad

    %53
    si2 r4 si
    la2 r4 la
    sol2 r4 sol

    %56
    fad2 r4 mi
    re2 r4 si
    lad2 r4 lad

    %59
    si sol' mi fad
    si,1\fermata

}


IIIbcn = \relative do {

    si'2 r4 si
    la2 r4 la
    sol2 r4 sol

    %4
    fad2 r4 mi
    re2 r4 si
    lad2 r4 lad

    %7
    si sol' mi fad
    si,1 si
    R1*8

    %17
    si'2 r4 si
    la2 r4 la

    %19
    sol2 r4 sol
    fad2 r4 mi
    re2 r4 si

    %22
    lad2 r4 lad
    si sol' mi fad
    si4 fad si,2

    %25
    R1*8
    si2 r4 si'

    %34
    la2 r4 la
    sol2 r4 sol
    fad2 r4 mi

    %37
    re2 r4 si
    lad2 r4 lad
    si sol' mi fad

    %40
    si,1
    R1*11
    r4 fad'8 sold la4 fad

    %53
    si2 r4 si
    la2 r4 la
    sol2 r4 sol

    %56
    fad2 r4 mi
    re2 r4 si
    lad2 r4 lad

    %59
    si sol' mi fad
    si,1\fermata

}

IIIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\time 4/4
\key si\minor
\tempo 1 = 55
\repeat volta 2{s1*7}
\alternative {{s1}{s}}
\set Score.currentBarNumber = #9
s1*8
s1*8
s1*8
s1*8
s1*12
s1*8
\bar "|."

}

IIIobI = {
	\IIIglobal
	%\notypeset
	<<\IIIobIn \forma>>

}

IIIobII = {
	\IIIglobal
	<<\IIIobIIn \forma>>

}

IIIvlI = {
	\IIIglobal
	<<\IIIvlIn \forma>>

}

IIIvlII = {
	\IIIglobal
	<<\IIIvlIIn \forma>>

}

IIIvlrip = {
	\IIIglobal
	<<\IIIvlripn \forma>>

}

IIIvla = {
	\IIIglobal
	\clef alto
	<<\IIIvlan \forma>>

}

IIIfg = {
	\IIIglobal
	\clef bass
	<<\IIIfgn \forma >>

}

IIIbc = {
	\IIIglobal
	\clef bass
	<<\IIIbcn \forma\IIIbfn >>
	\typeset

}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 4 \con
}

IVvlIn = \relative do'' {

    fad2 sol4
    mi re8 dod fad4
    si,8 dod re4 dod

    %4
    lad2 fad4
    si la! sol
    fad mi re\mbreak

    %7
    mi8 fad sol4 fad
    si,2. si
    re'2 mi4

    %10
    dod2 re4
    sol8 la si4 la
    fad2 mi4

    %13
    dod si8 la mi'4
    mi2.
    dod4 si8 la la'4

    %16
    la2.
    re,2 mi4
    dod2 re4

    %19
    sol8 la si4 la
    fad2-+ mi4
    re dod si

    %22
    la sol fad
    sol fad8 mi la4
    re, re' mi

    %25
    fad2 sol4
    mi re8 dod fad4
    si,8 dod re4 dod

    %28
    lad2 fad4
    si la! sol
    fad mi re\mbreak

    %31
    mi8 fad sol4 fad
    si,2.\fermata

}

IVvlIIn = \relative do'' {

    re2 mi4
    dod si8 la re4
    si2 sol4

    %4
    fad2 fad4
    si la sol
    fad mi re\mbreak

    %7
    mi8 fad sol4 fad
    si,2. si
    si'2 si4

    %10
    la2 re4
    dod re mi
    re2 dod4

    %13
    la2 r4
    la2 r4
    la2 r4

    %16
    dod2 r4
    la si la
    la2 re4

    %19
    dod re mi
    re2-+ dod4
    re dod si

    %22
    la sol fad
    sol fad8 mi la4
    re,2.

    %25
    re'2 mi4
    dod si8 la re4
    si2 sol4

    %28
    fad2 fad4
    si la sol
    fad mi re\mbreak

    %31
    mi8 fad sol4 fad
    si,2.\fermata

}

IVvlan = \relative do' {

    si'2 si4
    la2 la4
    re,2 mi4

    %4
    dod2 dod4
    si' la sol
    fad mi re\mbreak

    %7
    mi8 fad sol4 fad
    si,2. si
    fad'2 sol4

    %10
    mi2 fad4
    sol fad mi
    la2 la4

    %13
    mi2 r4\mbreak
    dod2 r4
    mi2 r4

    %16
    mi2 r4
    fad2 sol4
    mi2 fad4

    %19
    sol fad mi
    la2 la4
    re dod si

    %22
    la sol fad
    sol fad8 mi la4
    re,2.

    %25
    si'2 si4
    la2 la4
    re,2 mi4

    %28
    dod2 dod4
    si' la sol
    fad mi re\mbreak

    %31
    mi8 fad sol4 fad
    si,2.\fermata

}


IVbcn = \relative do {

    si'2 sol4
    la2 fad4
    sol2 mi4

    %4
    fad dod mi
    re2 mi4
    fad2 sol4\mbreak

    %7
    mi2 fad4
    si, re fad si,2.
    si'4 la sol

    %10
    la sol fad
    mi re dod
    re re' la

    %13
    sol2 r4
    sol fad8 mi sol4
    sol2 r4

    %16
    sol fad8 mi sol4
    fad si sol
    la sol fad

    %19
    mi re dod
    re re' la
    fad2 sol4

    %22
    la2 si4
    sol la la,
    re2.

    %25
    si'2 sol4
    la2 fad4
    sol2 mi4

    %28
    fad dod mi
    re2 mi4
    fad2 sol4\mbreak

    %31
    mi2 fad4
    si,2.\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}


forma = {

    \time 3/4
    \key si\minor
    \tempo 2 = 70
    \repeat volta 2 {s2.*7}
    \alternative {{s2.}{s}}
    \bar".|:" \set Score.currentBarNumber = #9
    s2.*16
    \bar":..:"
    s2.*8
    \bar":|."

}

IVvlI = {
    \IVglobal
    %\notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    \IVglobal
    <<\IVvlIIn \forma>>

}

IVvla = {
    \IVglobal
    \clef alto
    <<\IVvlan \forma>>

}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn \forma\IVbfn >>
    \typeset

}


Vglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\tupletSpan 4 \con
			}

VobIn =  \relative do'' {

    r4 fad,\tu si
    si lad r
    r fad re'

    %4
    re dod r
    r fad, fad'~
    fad mi8 re mi dod

    %7
    re mi dod4. si16 dod
    re4 fad, si
    si lad r

    %10
    r fad re'
    re dod r
    r fad, fad'\parentSlur (

    %13
    fad) mi8 re mi dod
    re mi dod4. si8
    si  fad' sol fad mi re\mbreak

    %16
    dod la la' sol fad mi
    fad re si' la sol fad
    sol fad mi re do si

    %19
    do la re do si la
    si sol mi' re dod! si
    dod fad, fad' mi re dod

    %22
    re fad sol fad mi re
    mi la, la' sol fad mi
    fad re si' la sol fad

    %25
    sol fad mi re do si
    do la re do si la
    si sol mi' re dod! si

    %28
    dod fad, fad' mi re dod
    re4 red4.-+ dod16 red\mbreak
    mi8 fad fad4.-+ mi16 fad

    %31
    sol4 sol4. la8
    fad4 fad4. sol8
    mi4. mi8 la4~

    %34
    la8 si sol4. fad8
    fad4. fad8 si red,
    mi fad fad4. mi16 fad

    %37
    sol4 sol4. la8
    fad4 fad4. sol8
    mi4. mi8 la4~\mbreak

    %40
    la8 si sol fad sol4~
    sol8 la fad mi fad4~
    fad8 si, re mi dod re

    %43
    dod la dod mi sol la
    fad4 la, re
    re dod r

    %46
    r la fad'
    fad mi r
    r la, la'~

    %49
    la sol8 fad sol mi
    fad sol mi4.-+ re16 mi
    fad4 la, re

    %52
    re dod r
    r la fad'\mbreak
    fad mi r

    %55
    r la, la'~
    la4 sol8 fad sol mi
    fad sol mi4. re8

    %58
    re4 re8\solo mi fad4
    r mi sol
    r fad8 sol la4~

    %61
    la sol8 fad sol fad
    mi4 fad8 mi fad mi
    re4 si8 dod re4

    %64
    r4 dod mi
    r re8 mi fad4~
    fad mi8(re) mi(re)

    %67
    dod(re) mi(fad) mi(fad)
    re(mi) fad(sol) fad(sol)
    mi(re) mi(fad) re(mi)

    %70
    dod\tu dod fad lad, dod fad\mbreak
    re fad si red, fad si
    sol si, mi sold, si mi

    %73
    dod mi la dod, mi la
    fad8 mi16 re sol8 fad16 mi la8 sol16 fad
    si sol sol sol mi sol sol sol si, mi mi mi

    %76
    dod la la la fad' dod dod dod lad dod dod dod
    re si si si red la la la fad' la, la la
    sol' mi mi mi la mi mi mi si' mi, mi mi

    %79
    do' mi, mi mi red fad fad fad si, la' sol fad
    sol8 mi si4 mi\mbreak
    mi red r

    %82
    r si sol'
    sol fad r
    s si, si'~

    %85
    si la8 sol la fad
    sol la fad4. mi16 fad
    sol4 si, mi

    %88
    mi red r
    r si sol'
    sol fad r

    %91
    r si, si'~
    si la8 sol la fad
    sol la fad4. mi8\mbreak

    %94
    mi4 si8\solo dod re4~
    re fad8 mi re4~
    re mi8 re mi re

    %97
    dod4 dod dod
    re re re
    mi mi mi

    %100
    fad si, si
    dod dod dod
    re re re

    %103
    dod dod re
    mi16\tu la, la si dod re mi fad sol fad sol mi
    fad mi re mi fad sol la si do si do la\mbreak

    %106
    si sol fad sol mi sol fad sol sol8.-+ fad32 sol
    la16 fad mi fad re fad mi fad fad8.-+ mi32 fad
    sol16 mi re mi dod mi re mi dod re si dod

    %109
    lad8 dod fad4. lad,8
    si8 re fad4. si,8
    lad dod fad4. dod8

    %112
    re16 mi re mi fad sol fad sol la si la si
    dod, re dod re mi fad mi fad sol la sol la
    si, dod si dod re mi re mi fad sol fad sol\mbreak

    %115
    lad, si lad si dod re dod re mi re mi dod
    re8(si) do(sol') sol(lad,)
    lad?(fad') fad(la) la(si,)

    %118
    si(dod!) dod (sold') sold(si)
    lad si dod,4. si8
    si4 fad si

    %121
    si lad r
    r fad re'
    re dod r

    %124
    r fad, fad'~
    fad mi8 re mi dod
    re mi dod4. si16 dod

    %127
    re4 fad, si
    si lad r
    r fad re'

    %130
    re dod r
    r fad, fad'
    fad mi8 re mi dod

    %133
    re mi dod4. si8
    si2.\fermata

}

VobIIn = \relative do'' {

    r4 re,\tu re
    mi mi mi
    fad fad fad

    %4
    sol sol sol
    fad lad lad
    si si si

    %7
    si lad lad
    si re, re
    mi mi mi

    %10
    fad fad fad
    sol sol sol
    fad lad lad

    %13
    si si si
    si lad lad
    fad4 si si\mbreak

    %16
    la la la
    la si si
    si si si

    %19
    la la la
    sol si si
    si lad lad

    %22
    si si si
    la! la la
    la si si

    %25
    si si si
    la la la
    sol si si

    %28
    si lad lad
    si si4. si8\mbreak
    si4 si4. si8

    %31
    si4 mi4. mi8
    re4 re4. re8
    re4 do4. do8

    %34
    si red mi4. fad8
    red4 red4. red8
    si4 si4. si8

    %37
    si4 mi4. re8
    mi4 re4. do8
    re4 do4. do8\mbreak

    %40
    si4 si4. si8
    dod?4 lad4. lad8
    si4 si2

    %43
    la4. dod8 mi dod
    re4 fad, fad
    sol sol sol

    %46
    la la la
    si si si
    la dod dod

    %49
    re re re
    re dod dod
    re fad, fad

    %52
    sol sol sol
    la la la\mbreak
    fad' mi r

    %55
    r la, la'~
    la4 sol8 fad sol mi
    fad sol mi4. re8

    %58
    re4 la\solo re
    r dod mi
    r re8 mi fad4~
    fad mi8 re mi re
    dod4 dod dod
    si fad si
    r lad dod
    r si8 dod re4~
    re dod8(si) dod(si)
    lad(si) dod(re) dod(re)
    si(dod) re(mi) re(mi)
    dod(si) dod(re) si(dod)
    lad\tu dod fad dod lad fad'\mbreak
    re fad si red, fad si
    sol si, mi sold, si mi

    %73
    dod mi la dod, mi la
    fad8 mi16 re sol8 fad16 mi la8 sol16 fad
    si sol sol sol mi sol sol sol si, mi mi mi

    %76
    dod la la la fad' dod dod dod lad dod dod dod
    re si si si red la la la fad' la, la la
    sol' mi mi mi la mi mi mi si' mi, mi mi

    %79
    do' mi, mi mi red fad fad fad si, la' sol fad
    sol8 mi si4 mi\mbreak
    mi red r

    %82
    r si sol'
    sol fad r
    s si, si'~

    %85
    si la8 sol la fad
    sol la fad4. mi16 fad
    sol4 si, mi

    %88
    mi red r
    r si sol'
    sol fad r

    %91
    r si, si'~
    si la8 sol la fad
    sol la fad4. mi8\mbreak

    %94
    mi4 sold,8 la si4(
    la) r re8 dod
    si4 si8 la si4
    la la la
    si si si
    dod dod dod
    re sol, sol
    la la la
    la la la
    la la la
    la16\tu la la si dod re mi fad sol fad sol mi
    fad mi re mi fad sol la si do si do la\mbreak

    %106
    sol8 re si16 mi re mi mi8.-+ re32 mi
    fad16 re dod re la re dod re re8.-+ dod32 re
    mi8 si sol mi sol sol

    %109
    fad lad si re dod fad,
    fad si re fad, si re
    dod lad si re dod fad,

    %112
    si4 la16 la la la la la la la
    la4 la16 la la la sol sol sol sol
    sol4 fad16 fad fad fad fad fad fad fad\mbreak

    %115
    fad sold fad sold lad si lad si dod si dod lad
    si4 sol2
    fad fad4

    %118
    mi sold si
    dod8 re lad4. fad8
    fad4  re re

    %121
    mi mi mi
    fad fad fad
    sol sol sol

    %124
    fad lad lad
    si si si
    si lad lad

    %127
    si re, re
    mi mi mi
    fad fad fad

    %130
    sol sol sol
    fad lad lad
    si si si

    %133
    si lad lad
    fad2.\fermata

}

VvlIn = \relative do'' {

    r4 fad,\tu si
    si lad r
    r fad re'

    %4
    re dod r
    r fad, fad'~
    fad mi8 re mi dod

    %7
    re mi dod4. si16 dod
    re4 fad, si
    si lad r

    %10
    r fad re'
    re dod r
    r fad, fad'\parentSlur (

    %13
    fad) mi8 re mi dod
    re mi dod4. si8
    si  fad' sol fad mi re\mbreak

    %16
    dod la la' sol fad mi
    fad re si' la sol fad
    sol fad mi re do si

    %19
    do la re do si la
    si sol mi' re dod! si
    dod fad, fad' mi re dod

    %22
    re fad sol fad mi re
    mi la, la' sol fad mi
    fad re si' la sol fad

    %25
    sol fad mi re do si
    do la re do si la
    si sol mi' re dod! si

    %28
    dod fad, fad' mi re dod
    re4 red4.-+ dod16 red\mbreak
    mi8 fad fad4.-+ mi16 fad

    %31
    sol4 sol4. la8
    fad4 fad4. sol8
    mi4. mi8 la4~

    %34
    la8 si sol4. fad8
    fad4. fad8 si red,
    mi fad fad4. mi16 fad

    %37
    sol4 sol4. la8
    fad4 fad4. sol8
    mi4. mi8 la4~\mbreak

    %40
    la8 si sol fad sol4~
    sol8 la fad mi fad4~
    fad8 si, re mi dod re

    %43
    dod la dod mi sol la
    fad4 la, re
    re dod r

    %46
    r la fad'
    fad mi r
    r la, la'~

    %49
    la sol8 fad sol mi
    fad sol mi4.-+ re16 mi
    fad4 la, re

    %52
    re dod r
    r la fad'\mbreak
    fad mi r

    %55
    r la, la'~
    la4 sol8 fad sol mi
    fad sol mi4. re8

    %58
    re4 fad,\solo fad
    sol sol sol
    la la la

    %61
    si si si
    dod dod dod
    re re, re

    %64
    mi mi mi
    fad fad fad
    sol sold sold

    %67
    lad lad lad
    si si si
    lad lad lad

    %70
    dod8\tu dod fad dod lad fad'\mbreak
    re fad si red, fad si
    sol si, mi sold, si mi

    %73
    dod mi la dod, mi la
    fad8 mi16 re sol8 fad16 mi la8 sol16 fad
    si sol sol sol mi sol sol sol si, mi mi mi

    %76
    dod la la la fad' dod dod dod lad dod dod dod
    re si si si red la la la fad' la, la la
    sol' mi mi mi la mi mi mi si' mi, mi mi

    %79
    do' mi, mi mi red fad fad fad si, la' sol fad
    sol8 mi si4 mi\mbreak
    mi red r

    %82
    r si sol'
    sol fad r
    s si, si'~

    %85
    si la8 sol la fad
    sol la fad4. mi16 fad
    sol4 si, mi

    %88
    mi red r
    r si sol'
    sol fad r

    %91
    r si, si'~
    si la8 sol la fad
    sol la fad4. mi8\mbreak

    %94
    mi4 sold,\solo sold
    la la la
    si si si

    %97
    si mi8 fad sol4
    sol si8 la sol4
    sol la8(sol) la(sol)

    %100
    fad4 sol8(fad) sol(fad)
    mi(fad) sol(la) sol(la)
    fad8(sol) la(si) la(si)

    %103
    sol(fad) sol(la) fad(sol)
    mi16\tu la, la si dod re mi fad sol fad sol mi
    fad mi re mi fad sol la si do si do la\mbreak

    %106
    si sol fad sol mi sol fad sol sol8.-+ fad32 sol
    la16 fad mi fad re fad mi fad fad8.-+ mi32 fad
    sol16 mi re mi dod mi re mi dod re si dod

    %109
    lad8 dod fad4. lad,8
    si8 re fad4. si,8
    lad dod fad4. dod8

    %112
    re16 mi re mi fad sol fad sol la si la si
    dod, re dod re mi fad mi fad sol la sol la
    si, dod si dod re mi re mi fad sol fad sol\mbreak

    %115
    lad, si lad si dod re dod re mi re mi dod
    re8(si) do(sol') sol(lad,)
    lad?(fad') fad(la) la(si,)

    %118
    si(dod!) dod (sold') sold(si)
    lad si dod,4. si8
    si4 fad si

    %121
    si lad r
    r fad re'
    re dod r

    %124
    r fad, fad'~
    fad mi8 re mi dod
    re mi dod4. si16 dod

    %127
    re4 fad, si
    si lad r
    r fad re'

    %130
    re dod r
    r fad, fad'
    fad mi8 re mi dod

    %133
    re mi dod4. si8
    si2.\fermata

}

VvlIIn = \relative do'' {

    r4 re,\tu re
    mi mi mi
    fad fad fad

    %4
    sol sol sol
    fad lad lad
    si si si

    %7
    si lad lad
    si re, re
    mi mi mi

    %10
    fad fad fad
    sol sol sol
    fad lad lad

    %13
    si si si
    si lad lad
    fad4 si si\mbreak

    %16
    la la la
    la si si
    si si si

    %19
    la la la
    sol si si
    si lad lad

    %22
    si si si
    la! la la
    la si si

    %25
    si si si
    la la la
    sol si si

    %28
    si lad lad
    si si4. si8\mbreak
    si4 si4. si8

    %31
    si4 mi4. mi8
    re4 re4. re8
    re4 do4. do8

    %34
    si red mi4. fad8
    red4 red4. red8
    si4 si4. si8

    %37
    si4 mi4. re8
    mi4 re4. do8
    re4 do4. do8\mbreak

    %40
    si4 si4. si8
    dod?4 lad4. lad8
    si4 si2

    %43
    la4. dod8 mi dod
    re4 fad, fad
    sol sol sol

    %46
    la la la
    si si si
    la dod dod

    %49
    re re re
    re dod dod
    re fad, fad

    %52
    sol sol sol
    la la la\mbreak
    fad' mi r

    %55
    r la, la'~
    la4 sol8 fad sol mi
    fad sol mi4. re8

    %58
    re4 re,\solo re
    mi mi mi
    fad fad fad

    %61
    sol sol sol
    la lad lad
    si si, si

    %64
    dod dod dod
    re re re
    mi mi mi

    %67
    fad fad fad
    fad fad fad
    fad fad fad

    %70
    fad8\tu dod' fad dod lad fad'\mbreak
    re fad si red, fad si
    sol si, mi sold, si mi

    %73
    dod mi la dod, mi la
    fad8 mi16 re sol8 fad16 mi la8 sol16 fad
    si sol sol sol mi sol sol sol si, mi mi mi

    %76
    dod la la la fad' dod dod dod lad dod dod dod
    re si si si red la la la fad' la, la la
    sol' mi mi mi la mi mi mi si' mi, mi mi

    %79
    do' mi, mi mi red fad fad fad si, la' sol fad
    sol8 mi si4 mi\mbreak
    mi red r

    %82
    r si sol'
    sol fad r
    s si, si'~

    %85
    si la8 sol la fad
    sol la fad4. mi16 fad
    sol4 si, mi

    %88
    mi red r
    r si sol'
    sol fad r

    %91
    r si, si'~
    si la8 sol la fad
    sol la fad4. mi8\mbreak

    %94
    mi4 mi,\solo mi
    fad fad fad
    sold sold sold

    %97
    la dod8 re mi4
    re r sol8 fad
    mi4 mi8 re mi4

    %100
    re mi8(re) mi(re)
    dod(re) mi(fad) mi(fad)
    re(mi) fad(sol) fad(sol)

    %103
    mi(re) mi(fad) re(mi)
    mi16\tu la, la si dod re mi fad sol fad sol mi
    fad mi re mi fad sol la si do si do la\mbreak

    %106
    sol8 re si16 mi re mi mi8.-+ re32 mi
    fad16 re dod re la re dod re re8.-+ dod32 re
    mi8 si sol mi sol sol

    %109
    fad lad si re dod fad,
    fad si re fad, si re
    dod lad si re dod fad,

    %112
    si4 la16 la la la la la la la
    la4 la16 la la la sol sol sol sol
    sol4 fad16 fad fad fad fad fad fad fad\mbreak

    %115
    fad sold fad sold lad si lad si dod si dod lad
    si4 sol2
    fad fad4

    %118
    mi sold si
    dod8 re lad4. fad8
    fad4  re re

    %121
    mi mi mi
    fad fad fad
    sol sol sol

    %124
    fad lad lad
    si si si
    si lad lad

    %127
    si re, re
    mi mi mi
    fad fad fad

    %130
    sol sol sol
    fad lad lad
    si si si

    %133
    si lad lad
    fad2.\fermata

}

Vvlripn = \relative do'' {

    r4 fad,\tu si
    si lad r
    r fad re'

    %4
    re dod r
    r fad, fad'~
    fad mi8 re mi dod

    %7
    re mi dod4. si16 dod
    re4 fad, si
    si lad r

    %10
    r fad re'
    re dod r
    r fad, fad'\parentSlur (

    %13
    fad) mi8 re mi dod
    re mi dod4. si8
    si  fad' sol fad mi re\mbreak

    %16
    dod la la' sol fad mi
    fad re si' la sol fad
    sol fad mi re do si

    %19
    do la re do si la
    si sol mi' re dod! si
    dod fad, fad' mi re dod

    %22
    re fad sol fad mi re
    mi la, la' sol fad mi
    fad re si' la sol fad

    %25
    sol fad mi re do si
    do la re do si la
    si sol mi' re dod! si

    %28
    dod fad, fad' mi re dod
    re4 red4.-+ dod16 red\mbreak
    mi8 fad fad4.-+ mi16 fad

    %31
    sol4 sol4. la8
    fad4 fad4. sol8
    mi4. mi8 la4~

    %34
    la8 si sol4. fad8
    fad4. fad8 si red,
    mi fad fad4. mi16 fad

    %37
    sol4 sol4. la8
    fad4 fad4. sol8
    mi4. mi8 la4~\mbreak

    %40
    la8 si sol fad sol4~
    sol8 la fad mi fad4~
    fad8 si, re mi dod re

    %43
    dod la dod mi sol la
    fad4 la, re
    re dod r

    %46
    r la fad'
    fad mi r
    r la, la'~

    %49
    la sol8 fad sol mi
    fad sol mi4.-+ re16 mi
    fad4 la, re

    %52
    re dod r
    r la fad'\mbreak
    si,4 si si

    %55
    la dod dod
    re re re
    re dod dod

    %58
    la r r
    R2.*11
    lad8\tu dod lad fad \parenthesize fad lad

    %71
    si re fad si, si red
    mi sol, si mi, mi sold
    la dod mi la, la dod

    %74
    re re dod dod re re
    re re si si si si
    la la dod lad fad fad

    %77
    fad fad fad fad si si
    si si mi mi mi mi
    mi do si si si si

    %80
    si4 sol sol\mbreak
    la la la
    si si si

    %83
    do do do
    si red red
    mi mi mi

    %86
    mi red red
    mi sol, sol
    la la la

    %89
    si si si
    do do do
    si red red

    %92
    mi mi mi
    mi red red\mbreak
    si4 r r

    %95
    R2.*9
    mi16\tu mi, fad sol la si dod re mi re mi dod
    re la si dod re mi fad sol la sol la fad\mbreak

    %106
    si sol fad sol mi sol fad sol sol8.-+ fad32 sol
    la16 fad mi fad re fad mi fad fad8.-+ mi32 fad
    sol16 mi re mi dod mi re mi dod re si dod

    %109
    lad8 dod fad4. lad,8
    si8 re fad4. si,8
    lad dod fad4. dod8

    %112
    re16 mi re mi fad sol fad sol la si la si
    dod, re dod re mi fad mi fad sol la sol la
    si, dod si dod re mi re mi fad sol fad sol\mbreak

    %115
    lad, si lad si dod re dod re mi re mi dod
    re8(si) do(sol') sol(lad,)
    lad?(fad') fad(la) la(si,)

    %118
    si(dod!) dod (sold') sold(si)
    lad si dod,4. si8
    si4 fad si

    %121
    si lad r
    r fad re'
    re dod r

    %124
    r fad, fad'~
    fad mi8 re mi dod
    re mi dod4. si16 dod

    %127
    re4 fad, si
    si lad r
    r fad re'

    %130
    re dod r
    r fad, fad'
    fad mi8 re mi dod

    %133
    re mi dod4. si8
    si2.\fermata

}

Vvlan = \relative do' {

    r4 si\tu re
    dod dod dod
    si re fad

    %4
    mi mi dod
    lad dod dod
    si mi mi

    %7
    fad fad fad
    fad si, re
    dod dod dod

    %10
    si re fad
    mi mi dod
    lad dod dod

    %13
    si mi mi
    fad fad fad
    fad re re\mbreak

    %16
    la' mi mi
    re fad fad
    mi mi mi

    %19
    la fad re
    dod mi mi
    mi dod fad

    %22
    fad re re
    la' mi mi
    dod fad fad

    %25
    mi mi mi
    la fad re
    re mi mi

    %28
    fad dod fad
    fad fad4. fad8\mbreak
    mi4 si4. si8

    %31
    si4 sol'4. sol8
    do4 si4. si8
    si4 la4. la8

    %34
    fad4 sol4. si8
    si4 si4. si8
    si4 fad4. fad8

    %37
    mi4 sol4. sol8
    do4 si4. si8
    si4 la4. la8\mbreak

    %40
    fad4 mi4. mi8
    mi4 re4. re8
    re4 mi2

    %43
    mi4. la8 dod, la'
    la4 re, fad
    mi mi mi

    %46
    re fad la
    sol sol mi
    dod mi mi

    %49
    re sol sol
    la la la
    la re, fad

    %52
    mi mi mi
    re fad la\mbreak
    sol sol mi

    %55
    dod mi mi
    re sol sol
    la la la

    %58
    fad r r
    R2.*11
    r8 fad\tu fad fad fad fad\mbreak

    %71
    fad fad fad fad fad fad
    mi mi mi mi mi mi
    mi mi mi mi mi mi

    %74
    re re sol sol fad fad
    mi mi mi mi mi mi
    mi mi fad fad dod dod

    %77
    re re fad fad fad red
    mi mi mi mi mi mi
    fad fad fad fad fad fad

    %80
    sol4 mi sol\mbreak
    fad fad fad
    mi sol si

    %83
    la la fad
    red fad fad
    mi la la

    %86
    si si si
    si mi, sol
    fad fad fad

    %89
    mi sol si
    la la fad
    red fad fad

    %92
    mi la la
    si si si\mbreak
    sold r r

    %95
    R2.*9
    r16 dod, dod re mi fad mi re dod8 la
    si16 fad' fad sol la si la sol la8 fad\mbreak

    %106
    re re mi mi mi mi
    re re re re re re
    dod dod dod dod dod dod

    %109
    dod4. fad8 mi4
    re r8 re re4
    fad r8 sol fad4

    %112
    fad fad16 fad fad fad fad fad fad fad
    mi4 mi16 mi mi mi si si si si
    mi4 re16 re re re re re re re\mbreak

    %115
    dod4 fad4. fad8
    fad4 mi2
    dod si4

    %118
    mi dod2
    fad4 fad2
    re4 si re

    %121
    dod dod dod
    si re fad
    mi mi dod

    %124
    lad dod dod
    si mi mi
    fad fad fad

    %127
    fad si, re
    dod dod dod
    si re fad

    %130
    mi mi dod
    lad dod dod
    si mi mi

    %133
    fad fad fad
    fad2.\fermata

}


Vbcn = \relative do {

    r4 si\tu si
    dod dod dod
    re re re

    %4
    mi mi mi
    fad fad fad
    sol sol sol

    %7
    fad fad fad
    si, si si
    dod dod dod

    %10
    re re re
    mi mi mi
    fad fad fad

    %13
    sol sol sol
    fad fad fad
    si, si si\mbreak

    %16
    dod dod dod
    re red red
    mi mi mi

    %19
    fad fad fad
    sol sol sol
    fad fad fad

    %22
    si, si si
    dod dod dod
    re red red

    %25
    mi mi mi
    fad fad fad
    sol sol sol

    %28
    fad fad fad
    si,8 si' fad la sol fad\mbreak
    sol mi red fad si, red

    %31
    mi si' do si la sol
    la fad si la sol fad
    sol mi la sol fad mi

    %34
    red si mi si sol mi
    si' si' fad la sol fad
    sol mi red fad si, red

    %37
    mi si' do si la sol
    la fad si la sol fad
    sol mi la sol fad mi\mbreak

    %40
    red si mi red dod si
    dod la re! dod si la
    sol4 sold2

    %43
    la r4
    re, re' re
    mi mi mi

    %46
    fad fad fad
    sol sol sol
    la la la

    %49
    si si si
    la la la
    re, re re

    %52
    mi mi mi
    fad fad fad\mbreak
    sol sol sol

    %55
    la la la
    si si si
    la la la

    %58
    re, r r
    R2.*11
    fad16\tu dod dod dod lad fad fad fad lad fad fad fad\mbreak

    %71
    si' fad fad fad red si si si red si si si
    mi mi, mi mi sold mi mi mi sold mi mi mi
    la' mi mi mi dod la la la dod la la la

    %74
    re la la la mi' la, la la fad' la, la la
    sol'8 si sol mi sold mi
    la dod lad fad fad, lad

    %77
    si si' fad si red, si
    mi sol do la sol mi
    la fad si la si si,

    %80
    mi4 mi, mi\mbreak
    fad fad fad
    sol sol sol

    %83
    la la la
    si si si
    do do do

    %86
    si si si
    mi, mi mi
    fad fad fad

    %89
    sol sol sol
    la la la
    si si si

    %92
    do do do
    si si si\mbreak
    mi,4 r r

    %95
    R2.*9
    r16 la' sol fad mi re dod si la8 la'
    re,16 re' dod si la sol fad mi re8 re'\mbreak

    %106
    sol, sol, sol' sol, sol' sol,
    fad' fad, fad' fad, fad' fad,
    mi' mi, mi' mi, mi' mi,

    %109
    fad16 fad' mi fad re fad mi fad dod mi re dod
    re fad mi fad re fad mi fad re dod re si
    fad fad' mi fad re fad mi fad lad, dod si lad

    %112
    si dod si dod re mi re mi fad sol fad sol
    la si la si dod, re dod re mi fad mi fad
    sol la sol la si, dod si dod re mi re mi\mbreak

    %115
    fad4 fad,4. fad8
    si4 mi,2~
    mi red4

    %118
    sol! mid2
    fad4 fad2
    si4 si si

    %121
    dod dod dod
    re re re
    mi mi mi

    %124
    fad fad fad
    sol sol sol
    fad fad fad

    %127
    si, si si
    dod dod dod
    re re re

    %130
    mi mi mi
    fad fad fad
    sol sol sol

    %133
    fad fad fad
    si,2.\fermata

}

Vbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\time 3/4
\key si\minor
\tempo 2 = 57
s2.*134
\bar"|."

}

VobI = {
	\Vglobal
	\notypeset
	<<\VobIn \forma>>

}

VobII = {
	\Vglobal
	<<\VobIIn \forma>>

}

VvlI = {
	\Vglobal
	<<\VvlIn \forma>>

}

VvlII = {
	\Vglobal
	<<\VvlIIn \forma>>

}

Vvlrip = {
	\Vglobal
	<<\Vvlripn \forma>>

}

Vvla = {
	\Vglobal
	\clef alto
	<<\Vvlan \forma>>

}

Vbc = {
	\Vglobal
	\clef bass
	<<\Vbcn \forma\Vbfn >>
	\typeset

}


VIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
			}

VIvlIn = \relative do'' {

    si2
    dod4 re mi dod
    re fad, si2
    dod4 re mi dod

    %4
    re si sol'2~
    sol4 mi dod la
    fad' re la'2~

    %7
    la4 fad red si
    sol' mi la dod,
    re4. mi8 mi4. re16 mi

    %10
    fad4 re la'2~
    la4 fad red si
    sol' mi la dod,\mbreak

    %13
    re4. mi8 mi4. re8
    re2 si'
    fad4 sol la fad

    %16
    sol mi si'2
    fad4 sol la fad
    sol mi la2

    %19
    fad sol
    mi fad
    dod4 re mi dod

    %22
    lad fad fad' lad,
    si4. dod8 dod4.-+ si16 dod
    re4 si fad'2

    %25
    dod4 re mi dod
    lad fad fad' lad,\mbreak
    si4. dod8 dod4. si8

    %28
    si2

}

VIvlIIn = \relative do'' {

    fad,2
    fad4 si si lad
    si re, fad2
    fad4 si si lad

    %4
    si2 r4 re
    mi2 la,
    la r4 mi'

    %7
    fad2 si,
    si la4 la
    re re re dod

    %10
    re2 r4 mi
    fad2 si,
    si la4 la\mbreak

    %13
    re re re dod
    la2 mi'
    si4 mi mi red

    %16
    mi si mi2
    si4 mi mi red
    mi si mi2

    %19
    re re
    dod re
    sol,4 la si sol

    %22
    fad2 fad4 fad
    si si si lad
    si fad si2

    %25
    sol4 la si sol
    fad2 fad4 fad\mbreak
    si si si lad

    %28
    fad2

}

VIvlan = \relative do' {

    re2
    fad4 fad sol fad
    fad si, re2
    fad4 fad sol fad

    %4
    fad2 r4 si
    la2 mi
    fad r4 dod'

    %7
    si2 fad
    sol mi4 la
    fad si la la

    %10
    la2 r4 dod
    si2 fad
    sol mi4 la\mbreak

    %13
    fad si la la
    fad2 si
    si4 si do si

    %16
    si mi, si'2
    si4 si do si
    si sol la2

    %19
    la si
    la la
    sol4 fad  mi mi

    %22
    dod2 si4 dod
    re fad fad fad
    fad re fad2

    %25
    sol4 fad mi mi
    dod2 si4 dod\mbreak
    re fad fad fad

    %28
    re2

}


VIbcn = \relative do {

    si'2
    lad4 si mi, fad
    si,2 si'
    lad4 si mi, fad

    %4
    si,2 r4 si
    dod2 la
    re r4 dod

    %7
    red2 si
    mi dod4 la
    si sol' la la,

    %10
    re2 r4 dod
    red2 si
    mi dod4 la\mbreak

    %13
    si sol' la la,
    re2 sol
    red4 mi la, si

    %16
    mi2 sol
    red4 mi la, si
    mi2 dod

    %19
    re sol
    la re,
    mi4 fad sol mi

    %22
    fad2 re4 fad
    re si fad' fad,
    si2 re

    %25
    mi4 fad sol mi
    fad2 re4 fad\mbreak
    re si fad' fad,

    %28
    si2

}

VIbfn = \figures {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown



}


forma = {

\time 2/2
\key si\minor
\tempo 1 = 70
\partial 2 s2
s1*13
s2
\bar ":..:"\break
s2
s1*13
s2
\bar":|."

}

VIvlI = {
	\VIglobal
	\notypeset
	<<\VIvlIn \forma>>

}

VIvlII = {
	\VIglobal
	<<\VIvlIIn \forma>>

}

VIvla = {
	\VIglobal
	\clef alto
	<<\VIvlan \forma>>

}

VIbc = {
	\VIglobal
	\clef bass
	<<\VIbcn \forma\VIbfn >>
	\typeset

}


VIIglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
		\tupletSpan 4 \con
			}

VIIobIn =  \relative do'' {

    re4 re
    mi mi mi mi
    mi re sol si,
    do si8 do la4 re

    %4
    si sol re' re
    mi mi mi mi
    mi re sol si,

    %7
    do si8 do la4 re
    si2 re4 re
    sol sol sol sol

    %10
    sol fad la la
    la sol sol fad\mbreak
    fad fad la la

    %13
    la1~
    la2 la4 la
    la sol8 fad mi4. re8

    %16
    re2 sol,4 si
    la re si sol
    fad re re' re

    %19
    re1~
    re2 re4 re
    re do8 si la4. sol8

    %22
    sol2

}

VIIobIIn = \relative do'' {

    si4 si
    do do do do
    do? si si sol
    sol sol sol fad

    %4
    sol re si' si
    do do do do
    do si si sol

    %7
    sol sol sol fad
    sol2 si4 si
    mi mi mi mi

    %10
    mi re fad fad
    fad mi mi re\mbreak
    re dod re fad

    %13
    mi dod re fad
    mi dod re fad
    fad mi8 re dod4. re8

    %16
    re2 si4 sol
    fad re sol si
    la re la si

    %19
    la fad sol si
    la fad sol si
    si la8 sol fad4. sol8

    %22
    sol2



}

VIIvlIn = \relative do'' {

    sol,4 sol'
    mi sol mi do
    sol' sol, si mi
    do mi la fad

    %4
    re si' sol, sol'
    mi sol mi do
    sol' sol, si mi

    %7
    do mi la fad
    re2 sol,4 sol'
    mi mi' dod la

    %10
    re, re' re, re'
    si sol la re,\mbreak
    la la' fad re'

    %13
    dod la fad re'
    dod la fad re'
    si sol la mi

    %16
    fad2 re~
    re1~
    re2 si4 sol'

    %19
    fad re si sol'
    fad re si sol'
    mi do re fad

    %22
    <<sol2\\\stemUp\shiftOn sol,>>

}

VIIvlIIn = \relative do'' {

    sol4 sol,
    do mi sol mi
    sol, sol' re sol
    mi do mi la

    %4
    sol, sol' sol sol,
    do mi sol mi
    sol, sol' re sol

    %7
    mi do re la'
    sol,2 sol'4 sol,
    sol' mi mi' dod

    %10
    la re, re' re,
    sol mi' dod la\mbreak
    la la, la' fad

    %13
    la dod la fad
    la dod la fad
    sol si la, la'

    %16
    re,1~
    re~
    re2 re4 si

    %19
    re fad re si
    re fad re si
    do re fad re

    %22
    sol,2

}


forma = {

\time 2/2
\key si\minor
\tempo 1 = 70
\partial 2 s2
s1*7
s2
\bar ":..:"
s
s1*13
s2
\bar":|."

}

VIIobI = {
	\VIIglobal
	%\notypeset
	<<\VIIobIn \forma>>

}

VIIobII = {
	\VIIglobal
	<<\VIIobIIn \forma>>

}

VIIvlI = {
	\VIIglobal
	<<\VIIvlIn \forma>>

}

VIIvlII = {
	\VIIglobal
	<<\VIIvlIIn \forma>>
	\typeset

}


VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 4 \con
}

VIIIvlIn = \relative do'' {

    fad2 mi4
    re dod si
    sol'2 fad4

    %4
    sol mi8 fad sol mi
    la2 sol4
    fad mi re

    %7
    dod re si
    lad2. lad
    fad'2 sol4

    %10
    la fad8 sol la4
    dod,2 re4
    mi re8(dod si la)

    %13
    re4 la2
    mi'4 la,2\mbreak
    fad'4 re dod

    %16
    re4. mi8 re mi
    fad2 mi4
    re dod si

    %19
    sol'2 fad4
    sol mi8 fad sol mi
    la2 sol4

    %22
    fad mi re
    dod si lad
    si2. si

}

VIIIvlIIn = \relative do'' {

    re4 dod lad
    si2.
    si4 si si

    %4
    si2.
    mi4 dod mi
    re dod la

    %7
    sol fad mi
    fad2. fad
    re'2 re4

    %10
    re2.
    sol,2 la4
    la2.

    %13
    la2 la4
    la2 la4\mbreak
    la la la

    %16
    la2.
    re4 dod lad
    si2.

    %19
    si4 si si
    si2.
    mi4 dod mi

    %22
    re2 si4
    lad2 fad4
    fad2. fad

}

VIIIvlan = \relative do' {

    fad2 fad4
    fad2.
    sol4 sol si

    %4
    sol2.
    mi4 la la
    la sol fad

    %7
    mi re mi
    dod2. dod
    re2 re4

    %10
    la'2.
    mi2 fad4
    dod2.

    %13
    re2 fad4
    mi2 sol4\mbreak
    fad fad mi

    %16
    fad2.
    fad2 fad4
    fad2.

    %19
    sol4 sol si
    sol2.
    mi4 la la

    %22
    la la2
    fad fad4
    re2. re

}


VIIIbcn = \relative do {

    si'4 lad fad
    si,2.
    mi,4 mi' red

    %4
    mi2.
    dod4 la dod
    re mi fad

    %7
    mi fad sol
    fad lad fad fad,2.
    re'2 si4

    %10
    fad2.
    mi2 mi4
    la la' sol

    %13
    fad2 re4
    dod2 la4\mbreak
    re fad la

    %16
    re, re' dod
    si lad fad
    si,2.

    %19
    mi,4 mi' red
    mi2.
    dod4 la dod

    %22
    re2 mi4
    fad2 fad,4
    si4. dod8 si dod si2.

}


forma = {

    \time 3/4
    \key si\minor
    \tempo 2 = 75
    \repeat volta 2{s2.*7}
    \alternative {{s2.}{s}}
    \set Score.currentBarNumber = #9
    \repeat volta 2{s2.*15}
    \alternative {{s2.}{s}}
    \bar"|."

}

VIIIvlI = {
    \VIIIglobal
    %\notypeset
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    \VIIIglobal
    <<\VIIIvlIIn \forma>>

}

VIIIvla = {
    \VIIIglobal
    \clef alto
    <<\VIIIvlan \forma>>

}

VIIIbc = {
    \VIIIglobal
    \clef bass
    <<\VIIIbcn \forma>>
    \typeset

}


IXglobal = 	{
		\override Score.MetronomeMark.transparent = ##t
		\override Score.BarNumber.font-size = #0.5
		\override Score.BarNumber.padding = #1.3
		\override TupletBracket.bracket-visibility = ##f
			}

IXvlIn = \relative do'' {

    R2.*16

}

IXvlIIn = \relative do'' {

    R2.*16

}

IXfgIn = \relative do {

    fad4. sol8 fad sol
    la4 fad8 sol la4
    la(si) la

    %4
    la2.
    fad2 mi4
    re re8 mi fad sol

    %7
    la4 sol fad
    mi2.
    mi4. fad8 mi fad

    %10
    sol4 mi8(fad) sol4
    sol(si) sol
    sol2.

    %13
    fad4 sol mi
    fad re mi
    fad(mi-+) re

    %16
    re2.

}


IXfgIIn = \relative do {

    re4. mi8 re mi
    fad4 re8 mi fad4
    fad(sol) fad

    %4
    fad2.
    re2 la4
    fad la re8 mi

    %7
    fad4 mi re
    la2.
    dod4. re8 dod re

    %10
    mi4 dod8(re) mi4
    mi(sol) mi
    mi2.

    %13
    re4 mi la,
    re fad, la
    re la re,

    %16
    re2.

}


forma = {

\time 3/4
\key si\minor
\tempo 2 = 75
s2.*8
\bar ":..:"
s2.*8
\bar":|."

}

IXvlI = {
	\IXglobal
	%\notypeset
	<<\IXvlIn \forma>>

}

IXvlII = {
	\IXglobal
	<<\IXvlIIn \forma>>

}

IXfgI = {
	\IXglobal
	\clef bass
	<<\IXfgIn \forma>>

}

IXfgII= {
	\IXglobal
	\clef bass
	<<\IXfgIIn \forma>>
	\typeset

}

\pointAndClickOff

#(set-global-staff-size 16)

\paper  {

    print-first-page-number = ##t
    first-page-number = #2

}


\bookpart {

    \paper  {

        systems-per-page = #3

    }

    \header {
        title = \markup\smaller{Ouverture TWV 55:h1}
        composer = \markup \center-column{"G. Ph. Telemann (1681-1767)"}

    }

    \markup \huge {[1.] Ouverture }

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }

        <<

            \new PianoStaff<<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \IobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \IobII
                >>
            >>

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1.""Conc[ertante]"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2.""Conc[ertante]"}
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violino""Rip[ieno]"}
                \set Staff.midiInstrument = #"violin"
                \Ivlrip
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \Ivla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"bassoon"
                \Ibc
            >>
        >>

        \layout {

           #(layout-set-staff-size 15)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing .padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[2.] Courante }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1.""Hautbois 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \IIvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2.""Hautbois 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \IIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"bassoon"
                \IIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[3.] Air en Rondeau }

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }

        <<

            \new PianoStaff<<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \IIIobII
                >>
            >>

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1.""Conc[ertante]"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2.""Conc[ertante]"}
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violino""Rip[ieno]"}
                \set Staff.midiInstrument = #"violin"
                \IIIvlrip
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"[Fagotto]"}
                \set Staff.midiInstrument = #"bassoon"
                \IIIfg
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"cello"
                \IIIbc
            >>
        >>

        \layout {

           #(layout-set-staff-size 14)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing .padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[4.] Menuet }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1.""Hautbois 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \IVvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2.""Hautbois 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \IVvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \IVvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"bassoon"
                \IVbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

    \paper  {

        systems-per-page = #3

    }

    \markup \huge {[5.] Chaconne }

    \score {

        \new ChoirStaff
        \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #1
        }

        <<

            \new PianoStaff<<

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \VobI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \VobII
                >>
            >>

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1.""Conc[ertante]"}
                    \set Staff.midiInstrument = #"violin"
                    \VvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2.""Conc[ertante]"}
                    \set Staff.midiInstrument = #"violin"
                    \VvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violino""Rip[ieno]"}
                \set Staff.midiInstrument = #"violin"
                \Vvlrip
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \Vvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"bassoon"
                \Vbc
            >>
        >>

        \layout {

           #(layout-set-staff-size 15)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing .padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #2
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

    \paper  {

        systems-per-page = #4

    }

    \markup \huge {[6.] Gavotte 1. altern[ativement] avec 2. }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1."}
                    \set Staff.midiInstrument = #"violin"
                    \VIvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2."}
                    \set Staff.midiInstrument = #"violin"
                    \VIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \VIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"cello"
                \VIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

    \pageBreak

    \markup \huge {[7.] Gavotte 2. }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois 1."}
                    \set Staff.midiInstrument = #"oboe"
                    \VIIobI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Hautbois 2."}
                    \set Staff.midiInstrument = #"oboe"
                    \VIIobII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Violino 1."}
                \set Staff.midiInstrument = #"violin"
                \VIIvlI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Violino 2."}
                \set Staff.midiInstrument = #"violin"
                \VIIvlII
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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

    \pageBreak

    \markup \huge {[8.] Menuet 1. }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1."}
                    \set Staff.midiInstrument = #"violin"
                    \VIIIvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2."}
                    \set Staff.midiInstrument = #"violin"
                    \VIIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Viola"}
                \set Staff.midiInstrument = #"viola"
                \VIIIvla
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basso"}
                \set Staff.midiInstrument = #"cello"
                \VIIIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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


    \markup \huge {[9.] Menuet 2. a deux Bassons }

    \score {

        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #8
        } <<

            \new PianoStaff <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 1."}
                    \set Staff.midiInstrument = #"violin"
                    \IXvlI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup  \center-column{"Violino 2."}
                    \set Staff.midiInstrument = #"violin"
                    \IXvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \center-column{"Basson 1."}
                \set Staff.midiInstrument = #"bassoon"
                \IXfgI
            >>

            \new Staff  <<
                \set Staff.instrumentName = \markup  \center-column{"Basson 2."}
                \set Staff.midiInstrument = #"bassoon"
                \IXfgII
            >>
        >>

        \layout {

            #(layout-set-staff-size 17)
            indent = 1.9\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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