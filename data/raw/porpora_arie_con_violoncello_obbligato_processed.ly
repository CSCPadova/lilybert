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


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \tupletSpan 4\senza
}


Ivocen = \relative do'' {

    \autoBeamOff
    R2.*25
    mi2^\markup\italic"ada[gio]" dod4
    \grace si8 la8. [sold16] la4 r8 mi'^\markup\italic"a tempo"

    %28
    fad4(mi) la,
    sold la r
    dod8.[(si16] dod4) mi

    %31
    mi(si) mi
    mi(la,) fad'
    \grace la,8 sold4. la8 si8. mi,16\mbreak

    %34
    dod'4 dod4. red16[mi]
    red4 red4. mi16[fad]
    mi4. dod8 la[sold16 la]

    %37
    fad'4. red8 si[la]
    sold4. mi8 sold[si]
    mi4. red16[dod] si4~

    %40
    si8 la sold4 fad\mbreak
    mi2 r4
    R2.*4

    %46
    r4 mi'2~
    mi4 re dod
    dod si dod~

    %49
    dod si la
    la sold r
    r mi' la,

    %52
    fad'4. re8 si fad'\mbreak
    mi4. re8 la mi'
    re4. si8 sold re'

    %55
    dod4. r16 dod dod8.\tr[si32(dod)]
    re4. r16 re re8.\tr[dod32(re)]
    mi4. r16 mi mi8.[re32(mi)]

    %58
    fad8 mi4 re dod16[si]\mbreak
    dod8. re16 \grace dod8 si4. la8
    la2.~

    %61
    la
    R2.*2\mbreak
    dod8.[re16] mi4 la,

    %65
    la sold re'
    dod(si) la
    mi'2.~

    %68
    mi~\mbreak
    mi~
    \tuplet 3/2 { mi8 [re mi] dod[si dod] } la8.[mi'16]

    %71
    fad4. mi16[fad] re8[mi16 fad]
    mi4. re16[mi] dod8[re16 mi]
    re4. dod16[re] si8[dod16 re]

    %74
    dod8[la16 sold] la8[la16 si] dod8[dod16 re]\mbreak
    mi4 r r
    r8 la,16[si] dod8[dod16 re] mi8[fad16 sold]

    %77
    la4 r r
    r8 r16 re,^\markup\italic"adag[i]o" \grace dod8 si4.\tr la8
    la4 r\fermata r

    %80
    R2.*9
    dod8.[(si16] dod4) fad
    si,8.[la16] si4 r8 dod

    %91
    la4 sold fad
    dod'8.[si16] dod4 r\mbreak
    R2.*2

    %95
    r4 dod4. dod8
    re4. fad8 fad8. re16
    dod4. fad8 fad8. dod16

    %98
    si8.[la16] \tuplet 3/2 { si8[dod re] dod[re si]\mbreak
    la[sold fad]} fad'2~
    fad4(red) mi~

    %101
    mi8. fad16 red4. dod8
    dod2 r4
    R2.*4

    %107
    r4 mi4. dod8
    \grace si lad4. mi'8 re8. dod16
    re[dod] si8 fad'4 fad,\mbreak

    %110
    sol(sold4.) la16[sold]
    la4(lad?4.) si16[lad]
    si8.[lad16] \tuplet 3/2 { si8[re dod] si[dod re] }

    %113
    mi2.~
    \tuplet 3/2 { mi8[re dod] re[fad mi] re[mi fad] }\mbreak
    sol4. fad8 \tuplet 3/2 { mi[fad sol] }

    %116
    fad4. lad,8 si4~
    si8. dod16 \grace si8 lad4. si8
    si8. mi16 \grace re8 dod4. si8

    %119
    si2  r4\fermata

}

Itesto = \lyricmode {

    Bella _ Di -- va all' om -- bre_a -- mica _ scor -- gi_al -- men con pu -- ro

    ci -- glio nel pe -- riglio _ il nostro _ a -- mor - - - - - - - - - - - il no -- stro_a --

    mor.

    Bel - la Di -- va all' om -- bre_a -- mica _ scor -- gi_al -- men con pu -- ro

    ci -- glio nel pe -- ri -- glio_il no -- stro_a -- mor - - - - - - - - - - - - - il no -- stro_a --

    mor, scor - gi_al -- men - il no -- stro_a -- mor - - - - - - - - - - - - - - - - - - - il no -- stro_a -- mor.

    Nu -- da splen -- de e chia - ra_in cie -- lo co -- me_al -- lor che senza _

    ve -- lo fosti_in _  brac - - - - cio al tuo Pa -- stor

    co -- me_al -- lor che senza _  ve -- lo fosti_in _  brac - - - - - - - - - - - - - - cio

    al tuo Pa -- stor al tuo Pa -- stor.

}

Ivcn = \relative do' {

    mi2_\markup\italic "Adagio" dod4
    \grace si8 la8. sold16 la4_\fermata r8 mi'
    fad4 mi la,

    %4
    sold la r
    la' la8.[sold16 fad8. mi16]
    \grace mi8 red4. fad16 mi \tuplet 3/2 { red8(mi fad)}

    %7
    la,8.\tr sold16 \tuplet 3/2 { la8 fad' mi red[mi fad]}\mbreak
    \grace la,8 sold4. \clef bass r16 si si8.\tr la32(si)
    \once\stemDown dod8 la,16. sold32 \once\stemUp la8. dod'16 dod8.\tr si32(dod)

    %10
    \once\stemDown red8 si,16. lad32 si8.\clef tenor  red'16 red8.\tr dod32 red
    mi2~mi8. red32(dod)
    si8. sold'16 \grace mi8 red4.\tr mi8

    %13
    mi2 r4\mbreak
    r16 mi re mi dod mi si mi la, fad' \once\stemUp dod, mi'
    fad la,(sold la) re, la'(sold la) fad' la, fad' la,

    %16
    mi' la,(sold la) dod, la'(sold la) mi' la, mi' la,
    \once\stemUp re, fad' mi fad \once\stemUp dod, mi' re mi \clef bass \once\stemUp si, re' dod re
    \once\stemUp la, dod' si dod \once\stemUp sold, si' la si \once\stemUp fad, la' sold la\mbreak

    %19
    mi,4 r16 mi' fad mi sold mi la mi
    si' mi,(red mi) fad mi sold mi la mi si' mi,
    dod' mi,(red mi) sold mi la mi si' mi, dod' mi,

    %22
    re' mi, fad mi la mi si' mi, dod' mi, re' mi,
    \clef tenor  mi'8 si la'4. sold16 fad
    mi8.\upl fad16 <<{\grace dod8 si4.\tr}\\mi,>> la8\mbreak

    %25
    <<<la mi>2\\la,>> r4
    R2.
    \clef bass r4 r r8 dod

    %28
    re4 dod r
    si la r
    \clef tenor mi''2.~

    %31
    mi~
    mi4 red2
    mi4 mi, sold\mbreak

    %34
    \clef bass la8 la,16. sold32 la8. la'16 la8. sold32(la)
    si8 si,16. lad32 si8 si' si8. la32 si
    dod8 dod,16. si32 dod8 dod' dod8. si32 dod

    %37
    \once\stemDown red8 si,16.(lad32) si8 \clef tenor red' red8.\tr dod32 (red)
    mi2.~
    mi8 mi, sold si mi4~
    mi8 fad red2\mbreak

    %41
    mi r4
    r16 mi re mi dod mi si mi la, mi' \once\stemUp dod, mi'
    fad la, sold la re, la' sold la fad' la, fad' la,

    %44
    mi' la, sold la dod, la' sold la mi' la, mi' la,
    \once\stemUp re, fad' mi fad \once\stemUp dod, mi' re mi \clef bass \once\stemUp si, re' dod re\mbreak
    \once\stemUp la, dod' si dod \once\stemUp sold, si' la si \once\stemUp fad, la' sold la

    %47
    mi,2.
    \clef tenor r4 mi''2~
    mi4 re dod

    %50
    <<{dod si}\\mi,2>> mi4\tr
    dod r mi'~
    mi8 re16 dod re2~\mbreak

    %53
    re8 dod16 si dod2~
    dod8 si16 la si4. sold8
    la4. r16 la la8.\tr sold32(la)

    %56
    si4. r16 si si8. la32 (si)
    dod4. r16 dod dod8. si32(dod)
    re8 dod4 si la16 sold\mbreak

    %59
    \clef bass la8. si16 \grace la8 sold4. la8
    \clef tenor r16 la( sold la) mi' la, sold la mi' la, mi' la,
    fad' la, sold la re, la' sold la fad' la, fad' la,

    %62
    mi' la, sold la dod, la' sold la mi' la, mi' la,
    \once\stemUp re, fad' mi fad\once\stemUp dod, mi' re mi \clef bass \once\stemUp si, re' dod re\mbreak
    \once\stemUp la, dod' si dod \once\stemUp sold, si' la si \once\stemUp fad, la' sold la

    %65
    mi,2 sold'4
    la sold fad
    r16 mi red mi fad mi sold mi la mi si' mi,

    %68
    dod' mi, red mi sold mi la mi si' mi, dod' mi,\mbreak
    re' mi, fad mi la mi si' mi, dod' mi, re' mi,
    \clef tenor mi'2.~

    %71
    mi8 re16 dod re2~
    re8 dod16 si dod2~
    dod8 si16 la si8 la16 si sold8 la16 si

    %74
    la4 r r\mbreak
    r8 la16 sold la8 la16 si dod8 dod16 re
    mi4 r r

    %77
    r8 la,16 si dod8  dod16 re mi8 fad16 sold
    la8[r16 fad] \grace la,8 sold4. la8
    <<<la mi>4\\la,>> la''8.\f[sold16 fad8. mi16]

    %80
    \grace mi8 red4. fad16 mi \tuplet 3/2 { red8 mi fad }\mbreak
    la,8.\tr sold16 \tuplet 3/2 { la8 fad' mi red[mi fad]}\mbreak
    \grace la,8 sold4 \clef bass r16 mi fad mi sold mi la mi

    %83
    si' mi,(red mi) fad mi sold mi la mi si' mi,
    dod' mi,(red mi) sold mi la mi si' mi, dod' mi,
    re' mi, fad mi la mi si' mi, dod' mi, re' mi,\mbreak

    %86
    \clef tenor mi'8 la, la'4. sold16 fad
    mi8. fad16 <<{\grace dod8 si4.\tr}\\mi,4>> la8\mbreak
    <<<la mi>2\\la,>> r4_\fermata^\markup\italic\center-align"[Fine]"

    %89 OOKK
    r4 fad''2~
    fad4  mid2
    fad8 fad, mi [mi'] re re,

    %92
    dod4 dod'4. re16 dod\mbreak
    re4(red4.) mi16 red
    mi4(mid4.) fad16 mid

    %95
    fad2.~
    fad~
    fad~

    %98
    fad4 mid2\mbreak
    fad4 red dod
    sid2 dod4~

    %101
    dod8. red16 \grace dod8 sid4. dod8
    dod4 la'2~
    la8. sold16 fad8. mi16 red8. dod16

    %104
    \grace dod8 sid4. red16 dod \tuplet 3/2 { sid8 dod red }\mbreak
    fad,8.\tr mid16 \tuplet 3/2 { fad8 red' dod sid[dod red] }
    mi,8. mi'16 \grace dod8 sid4. dod8

    %107
    dod4 dod, mi
    fad \clef bass fad, lad
    si r \clef tenor fad''~\mbreak

    %110
    fad8. mi16 mi4 re
    dod fad mi
    re2.~

    %113
    \tuplet 3/2 { re8 dod si dod[mi re] dod re mi }
    fad2.~\mbreak
    \tuplet 3/2 { fad8 mi red } mi2~

    %116
    mi4 re?8. dod16 re4~
    re8. mi16 \grace re8 dod4. si8
    si8. dod16 \grace si8 lad4. si8

    %119
    si2 r4\fermata

}


Ibcn = \relative do {

    R2.
    r4 r r8 dod^\markup\italic"a tempo giusto"
    re4 dod r

    %4
    si la r
    r dod la
    si si r

    %7
    red r si\mbreak
    mi mi, sold
    la r lad

    %10
    si r si
    dod si la
    sold8 mi la2

    %13
    mi4 mi' re\mbreak
    dod si dod
    re r r

    %16
    dod r r
    re dod si
    la sold fad

    %19
    mi2 r4
    mi r r
    mi r r

    %22
    mi r r
    dod' r r
    dod8. re16 mi4 mi,\mbreak

    %25
    la2 r4
    R2.
    r4 r r8 dod

    %28
    re4 dod r
    si la r
    la'2 r4

    %31
    sold2 r4
    fad2 si,4
    mi mi, sold\mbreak

    %34
    la2 r4
    si2 r4
    dod2 r4

    %37
    red2 r4
    mi mi, r
    r r sold4~

    %40
    sold8 la si2
    mi,4 mi' re
    dod la dod

    %43
    re2 r4
    dod2 r4
    re dod si\mbreak

    %46
    la sold fad
    mi2.
    mi2 r4

    %49
    mi2 r4
    mi2 re'4
    dod la dod

    %52
    re re, r\mbreak
    sold' la r
    fad sold r8 mi

    %55
    la,4 r r
    R2.*3\mbreak
    la4 mi' mi,

    %60
    la r dod
    re r r
    dod r r

    %63
    re dod si\mbreak
    la sold fad
    mi2 sold'4
    la sold fad

    %67
    mi2 r4
    mi r r\mbreak
    mi r r

    %70
    dod r dod
    re r r
    R2.*2

    %74
    la4 r r\mbreak
    R2.*3
    r8 r16 re_\markup\italic"adag[i]o" mi2

    %79
    la,4 dod_\markup\italic"[tempo giusto]" la'
    si si, r\mbreak
    si4 r si

    %82
    mi mi, r
    mi' r r
    mi r r

    %85
    mi r r\mbreak
    dod r r
    r8 r16 re mi4 mi,

    %88
    la2 r4\fermopz
    r4 fad' la
    sold2 dod,4

    %91
    fad mi re
    dod la lad\mbreak
    si si' la

    %94
    sold dod si
    la r lad
    si si, r

    %97
    la' la, r
    sold' sold,? dod\mbreak
    fad,2 la4

    %100
    sold2 dod4
    fad sold sold,?
    la la' sold

    %103
    fad2 r4
    sold sold, r\mbreak
    sold r r

    %106
    dod sold' sold,
    dod r mi
    fad fad, lad

    %109
    si re red\mbreak
    mi mi,2
    la4 fad2

    %112
    si'4 si, r
    sol' la r
    re, re, r\mbreak

    %115
    mi' mi, dod'
    lad fad si
    mi fad fad,

    %118
    sol'8. mi16 fad2
    si, r4\fermata

}

Ibfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s2.*2
    s4 <6>2
    <6+>2.
    s
    <_+>
    <5->2 <_+>4
    <_+>2.
    s
    <_+>
    s
    <6>4 <4> <3+>
    <_+>2 <6 4>4
    s2.*5
    <_+>2.
    s
    <6 4>
    <_+ 7>
    <6>
    s4 <4>4 <3+>
    s2.*3
    s4 <6>2
    <6+>2.
    s2.*2
    <7>4 <6+> <_+>
    <_+>2.
    s
    <_+>
    s
    s
    <_+>
    s4 s <6>
    s <6 4> <5 3+>
    s2.
    <6>
    s2.*7
    <6 4>4 <5 3+> <6 4+>
    s2.*29
    <_+>2.
    s
    <_+>
    s2.*9
    <_+>2.
    s
    s4 <_+>2
    s2.*3
    <7>4 <6+> <_+>
    s2 <6>4
    <7 _+>2.
    s2.*9
    s4 <_+>2
    s4 <_+>2
    s2.
    <6 5>
    <9>4 <8> s
    <9> <8>

}

forma = {

    \time 3/4
    \key re\major
    \tempo 4 = 70
    s2.
    s2 \tempo 2 = 55 s4
    s2.*86
    \bar "||"\break
    s2.*31
    \bar"|."
    \mark \markup\center-column {"Da""Capo"}

}


Ivoce = {
    \new Voice = "bella"
    %\notypeset
    \global
    <<\Ivocen \forma>>

}

Ivc = {
    \global
    \clef tenor
    <<\Ivcn \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

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


IIvlIn = \relative do'' {

    r4
    la r si
    sold r la
    la r fad

    %4
    si r la\mbreak
    la la sold
    la r la

    %7
    fad r sold
    la r sol!
    fad r la\mbreak

    %10
    si r si
    si r sold
    la r8 la[si8. dod16]

    %13
    sold4 r re'
    la r sold\mbreak
    fad r lad'\tr

    %16
    si r8 fad,[fad8. mid16]
    mid?4 r dod'
    r la sold

    %19
    la\fermopz r r\mbreak
    mi8 mi mi mi mi mi
    fad fad fad fad fad fad

    %22
    mi mi mi  mi mi mi
    re re re re re re
    re re re re dod dod\mbreak

    %25
    re8 re mi4 mi
    la,8 la' la la la la
    la la la la sold sold

    %28
    sold? sold sold sold fad fad
    fad fad fad fad mi mi\mbreak
    mi mi mi red red dod

    %31
    sid sid sid sid la'? la
    sold sold sold sold mi mi
    fad fad sold4 sold,

    %34
    dod2 r4

}


IIvlIIn = \relative do'' {

    r4
    fad, r fad
    dod r fad
    fad r si

    %4
    mi, r mi\mbreak
    fad fad mi
    mi r mi

    %7
    red r dod
    dod r dod
    re r fad\mbreak

    %10
    sold r sold
    sold? r mid
    fad r8 fad[sold8. la16]

    %13
    dod,4 r si'
    la r dod,\mbreak
    dod r sol''

    %16
    fad r8 re,[re8. dod16]
    dod4 r fad
    r fad sold

    %19
    fad\fermopz r r
    mi8 mi mi mi mi mi
    fad fad fad fad fad fad

    %22
    mi mi mi  mi mi mi
    re re re re re re
    re re re re dod dod\mbreak

    %25
    re8 re mi4 mi
    la,8 la' la la la la
    la la la la sold sold

    %28
    sold? sold sold sold fad fad
    fad fad fad fad mi mi\mbreak
    mi mi mi red red dod

    %31
    sid sid sid sid la'? la
    sold sold sold sold mi mi
    fad fad sold4 sold,

    %34
    dod2 r4

}


IIvlan = \relative do'{

    r4
    re r re
    dod r dod
    fad r fad
    mi r mi\mbreak
    re re si
    dod r dod
    si r si
    la r dod
    fad r fad\mbreak
    si, r re
    sold r dod,
    dod r8 dod[si8. la16]
    sold4 r sold'
    fad r dod\mbreak
    la r dod
    re r8 si[si8. la16]
    sold4 r la
    r dod2
    dod4\fermopz r r
    mi8 mi mi mi mi mi
    fad fad fad fad fad fad

    %22
    mi mi mi  mi mi mi
    re re re re re re
    re re re re dod dod\mbreak

    %25
    re8 re mi4 mi
    la,8 la' la la la la
    la la la la sold sold

    %28
    sold? sold sold sold fad fad
    fad fad fad fad mi mi\mbreak
    mi mi mi red red dod

    %31
    sid sid sid sid la'? la
    sold sold sold sold mi mi
    fad fad sold4 sold,

    %34
    dod2 r4

}


IIvocen = \relative do' {

    \autoBeamOff

    dod'8.[la16]
    fad4. la8 sold8. fad16
    fad8. mid16 mid4 r8 fad
    do'4 r8 si si8. la16

    %4
    sold4 r la\mbreak
    fad8. mi16 re2
    dod4 r dod'

    %7
    red,4. fad8 mid8. mid16
    fad8. dod16 dod4 lad'
    si4.(la8) la8.[sold16]\mbreak

    %10
    sold?4.(fad8) fad8. mid16
    mid?4 r8 mid fad8. sold16
    dod,2.

    %13
    dod4 re'2
    dod8. fad,16 fad4(mid)\mbreak
    fad4 r r

    %16
    R2.*3
    r8\fermopz la si re16 [dod] si8 la\mbreak
    sold8. sold16 sold4 r8 sold

    %21
    la4. re8 re la
    sold2 dod4
    fad,4. si8 si sold

    %24
    mi2 dod'4\mbreak
    si8. la16 la4(sold)
    la r dod

    %27
    si4. si,8 si si'
    la8. sold16 la4 r8 la
    sold4. sold8 dod la\mbreak

    %30
    fad4 r fad
    fad4. fad8 fad fad
    fad4. la8 sold4

    %33
    dod mi,(red)
    dod2 dod'8.[la16]

}

IItesto = \lyricmode {

    Con trop -- po fie -- re_im -- magi - ni mi rappre - senta_il _ duol nuo -- ve sventu - re,

    con trop -- po fie -- re_im -- magi - ni mi rap -- pre -- sen -- ta il duol nuo -- ve

    sven -- tu -- re, nuo -- ve  sven -- tu -- re.

    E pur cupe _ vo -- ragi - ni non a -- pre_an -- co -- ra_il suol per sep -- pel -- lirti _ sol fra

    l'om -- bre_o -- scu -- re,

    e pur cupe _ vo -- ragi - ni non a -- pre_an -- co -- ra_il suol per sep -- pel -- lirti _ sol fra

    l'om -- bre_o -- scu -- re. Con

}

IIvcn = \relative do' {

    r4
    R2.*18
    r4\fermopz r2
    <<{mi2._\markup\italic"Arpeggio" ~

       %21
       mi4 re2~
       re4 dod2~
       dod4 si2

       %24
       mi dod4\mbreak
       re8 dod dod4 si
       la8 mi'\noBeam mi2

       %27
       red4~ red mi
       dod2 red4
       sid2 dod4\mbreak

       %30
       fad2.
       red~
       red2 dod4~

       %33
       dod dod sid
       <dod mi,>2}\\{sold2.
                     fad
                     mi
                     fad
                     sold2 mi4\mbreak
                     fad8 mi mi4 re
                     <fad dod>8 dod'\noBeam dod2
                     si4 \parentSlur (si) sold
                     la2 fad4
                     sold2 mi4\mbreak
                     la2.
                     sid~
                     sid2 sold?4
                     fad sold2
                     dod,}>> r4

}


IIbcn = \relative do {

    r4
    re r si
    dod r la
    red4 r re

    %4
    re r dod\mbreak
    re si mi
    la, r la

    %7
    la r sold
    fad r mi'
    re r re\mbreak

    %10
    re r re
    re r8 re[dod8. si16]
    la4 r8 la'[sold8. fad16]

    %13
    mid4 r mid
    fad dod2\mbreak
    fad4 r mi

    %16
    re r r
    si r la
    r dod2

    %19
    fad,4\fermopz re'2\mbreak
    mi8 mi mi mi mi mi
    fad fad fad fad fad fad

    %22
    mi mi mi mi mi mi
    re re re re re re
    re re re re dod dod\mbreak

    %25
    re re mi mi mi, mi
    la la la la la' la
    la la la la sold sold

    %28
    sold?8 sold sold sold fad fad
    fad fad fad fad mi mi\mbreak
    mi mi mi mi red dod

    %31
    sid sid sid sid la! la
    sold sold sold sold mi' mi
    fad4 sold sold,

    %34
    dod2 la4

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s4
    s2.*6
    <2+>2 <6+>4
    s2 <4+ 6>4
    s2 <5>4
    <4+>2.
    <2+>
    s2.*3
    s2 <4+ 6>4
    s2.
    <4+>
    s
    s4 <6> <5>
    s2.*7
    <2>2.
    <2>
    <4 2>
    <2>
    <5>2 <6>4
    s2.*2
    s2 <6>4

}

forma = {

    \time 3/4
    \key re\major
    \tempo 4 = 60
    \partial 4 s4
    s4\once \override Score.RehearsalMark #'extra-offset = #'(-4 . 0.0) \mark \markup\smaller {\musicglyph #"scripts.segno" } s2
    s2.*17
    s4\bar"||"\break s2
    s2.*15
    \bar"||"
    \mark \markup \center-column{Dal Segno}

}



IIvlI = {
    \global
    %\notypeset
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


IIvoce = {
    \new Voice = "fiere"
    \global
    <<\IIvocen \forma>>

}

IIvc = {
    \global
    \clef tenor
    <<\IIvcn \forma>>

}

IIbc = {
    \global
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset

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


IIIvoceIn = \relative do'' {

    \autoBeamOff

    r4
    R1*4
    r4 si8 si dod16[si] dod[si] lad8 dod\mbreak
    re si re re re2~

    %7
    re4~re16 [fad mi re] dod8 re16 mi dod8. re16\mbreak
    re4 r r2
    R1

    %10
    r2 r4 si8 si\mbreak
    dod dod16[re] mi8 dod re si r4
    r si8 si lad lad si dod16 si

    %13
    lad8 fad fad fad\mbreak fad2~
    fad fad4 lad8 si
    dod16.[si32 dod8]~dod16.[re32 si16. dod32] re16.[dod32 re8]~re16.[mi32 dod16. re32]\mbreak

    %16
    mi16.[re32 mi8]~mi16.[dod32 re16. mi32] re8 mi16 fad re8 dod16[si]
    si4 r r2
    R1

    %19
    r2 r4\fermopz r
    r2 r4 la8 la
    si dod16 re mi8 re dod la la si\mbreak

    %22
    dod16.[si32  dod8]~dod16.[re32 si16. dod32] re16.[dod32 re8]~re16 [mi dod re]
    mi16.[re32 mi8]~mi16 [fad re mi] fad16.[mi32] re16.[mi32] dod8. re16
    re4 r r2\mbreak

    %25
    r4 dod8 dod
    si si la si16[la] sold8 sold sold sold
    sold?16.[fad32 sold8]~sold16.[la32 fad16. sold32] la16.[sold32 la8]~la16.[si32 sold16. la32]\mbreak

    %28
    si16.[la32 si8]~si16.[dod32 la16. si32] dod16[si] la[si] sold8. fad16
    fad4

}

IIItestoI = \lyricmode {
   
   Alla _ fé de no -- stri_a -- mori _ sem -- pre_e -- ter - ne il ciel da -- rà
   
   alla _ fé de no -- stri_a -- mori _ al -- la fé de no -- stri a -- mori _ 
   
   sem -- pre_e -- ter -- ne sem -- pre_e -- ter - - - ne il ciel da -- rà.
   
   Così _ ca -- ro il mio di -- letto _ immor - tal - - -  sem -- pre sa -- rà,
   
   così _ ca -- ro_è_il mio di -- letto _ immor - tal - - - sem -- pre sa -- rà.

}


IIIvoceIIn = \relative do' {

    \autoBeamOff
    r4
    R1*3
    r4 r8 si'16 lad si8 fad si dod16[si]
    lad8 fad r4 r2\mbreak

    %6
    r4 si8 si la? si16 la sol8. fad16
    fad[sol fad sol] la8 si la16[sol] fad sol mi8. re16\mbreak
    re4 r r2

    %9
    r r4 fad8 fad
    sold lad16[si] dod8 si lad fad r4\mbreak
    r2 r4 fad8 fad

    %12
    fad1
    fad4 r\mbreak r fad8 si
    lad lad si dod16[si] lad8 fad fad sold

    %15
    lad16.[sold32 lad8]~lad16.[si32 sold16. lad32] si16.[lad32 si8]~si16.[dod32 lad16. si32]\mbreak
    dod16.[si32 dod8]~dod16. [lad32 si16. dod32] si8 dod16 si si8 lad
    si4 r r2

    %18
    R1
    r2 r4\fermopz si8 si
    la? sol16 fad sol8 la fad re r4

    %21
    r2 r4 dod8 re\mbreak
    mi16.[re32 mi8]~mi16. [fad32 re16. mi32] fad16.[mi32 fad8]~fad16[sol mi fad]
    sol16.[fad32 sol8]~sol16[la fad sol] la16.[sol32] fad16.[sol32] mi8. re16

    %24
    re4 fad8 sold la la si la16[si]\mbreak
    dod8 la r4
    r2 r4 mid8 mid

    %27
    mid16[red mid8]~mid16.[fad32 red16. mid32] fad16.[mid32 fad8]~fad16.[sold32 mid16. fad32]\mbreak
    sold16.[fad32 sold8]~sold16.[la32 fad16. sold32]   la16[sold] fad[sold] mid8. fad16
    fad4

}

IIItestoII = \lyricmode {
   
   All' a -- mor de nostri _ ca -- ri sem -- pre_e -- ter -- ne il ciel da -- rà
   
   sem -- pre_e -- ter -- ne il ciel da -- rà,
   
   all' a -- mor de nostri _ ca -- ri sem -- pre_e -- ter -- ne 
   
   all' a -- mor de nostri _ ca -- ri sem -- pre_e -- ter - - - ne il ciel da -- rà.
   
   Co -- sì dol -- ce_il nostro _ af -- fetto _ immor - tal - - -  sem -- pre sa -- rà, 
   
   co -- sì dol -- ce_è_il no -- stro_af -- fetto _ immor - tal - - - sem -- pre sa -- rà.

}

IIIvcIn = \relative do' {

    r8 re16. dod32
    re8 si re mi16 re dod16. si32 dod8~dod16. dod32 lad16. si32
    dod16. si32 dod8~dod16. re32 si16. dod32 re16. dod32 re8~re16. mi32 dod16. re32
    mi16. re32 mi8~mi16. fad32 re16. mi32\mbreak fad16. mi32 re16. mi32 dod8. si16

    %4
    si4 r8 re16 dod re8 si re mi16 re
    dod8 fad, r re' mi16 re  mi re dod8 lad\mbreak
    si4 sol fad8 re' mi[la,]

    %7
    re, mi fad sol la re, la' la\mbreak
    re,8\noBeam re'16 mi fad sol mi fad sol16. fad32 sol8~sol16 sol fad mi
    fad16. re32 mi16. fad32 mi8.\tr re16 re4 r8 re16 dod

    %10
    si8 dod16. re32 mi8 re dod fad16. mi32 re8 si\mbreak
    si8 si si lad si4 r8 re16. dod32
    re8 si re16. dod32 re16. mi32 dod8 fad16. mi 32 re16. re32 mi16. re32

    %13
    dod4 r8 re16. dod32\mbreak re8. si16 re dod re mi
    re8 fad16 mi re16. re32 mi16. re32 dod8 fad16. fad32 fad8 fad,
    r mi'16. mi32 mi8 mi, r re'16. re32 re8 re,\mbreak

    %16
    r dod'16. dod32 dod8 fad, si mi fad[fad,]
    si4 r16 dod lad16. si32 dod16. si32 dod8~dod16. re32 si16. dod32
    re16. dod32 re8~re16 mi dod re mi16. re32 mi8~mi16 fad re mi\mbreak

    %19
    fad16. mi32 re16. mi32 dod8. si16 si4\fermopz re16. mi32 re16. mi32
    fad8 mi16 re mi8 la, re re16. mi32 fad8 re
    re mi16. fad32 sol8 fad mi dod16. re32 mi8 la,\mbreak

    %22
    r8 dod16. re32 mi4 r8 re16. mi32 fad4
    r8 mi16. fad32 sol8 sol, re' sol, la [la,]
    re' fad16 mi re8 re, dod' la re,[mi]\mbreak

    %25
    la dod16. re32 mi8 mi,
    sold dod fad, [si] r dod16. dod32 dod8[dod,]
    r si'16. si32 si8 si, r la'16. la32 la8 la,\mbreak

    %28
    r sold'16. sold32 sold8 sold,? fad' si dod[dod,]
    fad4

}

IIIvcIIn = \relative do' {

    r8 si16. lad32
    si8 fad si dod16 si lad16. fad32 lad8~lad16. lad32 dod16. si32
    lad16. fad32 lad8~lad16. si32 sold16. lad32 si16. fad32 si8~si16. dod32 lad16. si32
    dod16. si32 dod8~dod16. re32 si16. dod32\mbreak re16. dod32 si16. dod32 fad,8 lad

    %4
    si4 r8 fad \clef bass \key si\minor re8. dod16 si8 mi
    fad fad16. mi32 re8 si mi dod fad[fad,]\mbreak
    si4 sol' fad8 re mi[la]

    %7
    re, mi fad sol la re, la' la,\mbreak
    \clef tenor \key si\minor re8 la' re16 mi dod re mi16. re32 mi8~mi16 mi re dod
    re8 la16. re32 re8 dod re4 r8 re,

    %10
    mi re dod[mi] fad lad si[re,]\mbreak
    mi re dod fad si4 r8 si16. lad32
    si8 fad si[si,] fad' fad si[si]

    %13
    fad4 r8 si16. lad32\mbreak si8 fad si[si,]
    fad' fad si[si] fad fad'16. fad32 fad8 fad,
    r mi'16. mi32 mi8 mi, r re'16. re32 re8 re,\mbreak

    %16
    r dod'16. dod32 dod8 fad, si mi fad[fad,]
    si4 r16 lad fad16. sold32 lad16. fad32 lad8~lad16. si32 sold16. lad32
    si16. fad32 si8~si16 dod lad si dod16. si32 dod8~dod16 re si dod\mbreak

    %19
    re16. dod32 si16. dod32 lad8. si16 si4\fermopz si16. dod32 si16. dod32
    re8 re re[dod] re fad16. mi32 re8 fad,
    sol fad mi[sol] la la16. si32 dod8 la\mbreak

    %22
    r la16. si32 dod4 r8 la re4
    r8 dod16. re32 mi8 mi, re' sol, la[la,]
    re' re16 mi fad8 re dod la re,[mi]\mbreak

    %25
    la la16. si32 dod8 la
    sold dod fad, [si] r dod16. dod32 dod8[dod,]
    r si'16. si32 si8 si, r la'16. la32 la8 la,\mbreak

    %28
    r sold'16. sold32 sold8 sold,? fad' si dod[dod,]
    fad4

}


IIIbcn = \relative do {

    r4
    si4. mi8 r fad16. fad32 fad8[fad,]
    r mi'16. mi32 mi8 mi, r re'16. re32 re8 re,
    r dod'16. dod32 dod8 dod,\mbreak si' mi fad[fad,]

    %4
    si si'16. lad32 si8 fad re8. dod16 si8 mi
    fad fad16. mi32 re8 si mi dod fad[fad,]\mbreak
    si4 sol' fad8 re mi[la]

    %7
    re, mi fad sol la re, la' la,\mbreak
    re4 r r8 mi16 re dod8 la
    re re, la''[la,] re4 r8 re

    %10
    mi re dod[mi] fad fad, si [re]\mbreak
    mi re dod fad si,4 r
    r8 si si[si] fad' fad, si'[si,]

    %13
    fad' fad, r fad'\mbreak si si, r si
    fad' fad si [si,] fad'4 r8 fad
    mi4 r8 mi re4 r8 re\mbreak

    %16
    dod4 r8 fad si, mi fad[fad,]
    si re16. mi32 fad8 fad, r mi'16. mi32 mi8 mi,
    r re'16. re32 re8 re, r dod'16. dod32 dod8 dod,\mbreak

    %19
    si' mi fad fad, si4\fermopz sol'
    fad8 si mi,[la] re,4 r8 fad
    sol fad mi[sol] r la16. la32 la8 la,\mbreak

    %22
    r sol'16. sol32 sol8 sol, r fad'16. fad32 fad8 fad,
    r mi'16. mi32 mi8 mi, re' sol la [la,]
    re4 r8 re' dod la re,[mi]\mbreak

    %25
    la,4 r8 la'
    sold dod, fad[si,] dod4 r8 dod
    si4 r8 si la4 r8 la\mbreak

    %28
    sold4 r8 sold fad si dod[dod,]
    fad4

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s4
    s1*16
    s2 s8 <4+> s4
    s1*7
    s4 s8 <6>
    <7> <_+> s4 <_+>2



}

forma = {

    \time 4/4
    \key si\minor
    \tempo 4 = 45
    \partial 4 s4
    s1*18
    s2. \bar"||"\break s4
    s1*5
    \set Score.measureLength = #(ly:make-moment 2 4)
    s2
    \set Score.measureLength = #(ly:make-moment 4 4)
    s1*3
    \set Score.measureLength = #(ly:make-moment 1 4) s4
    \bar"||"
    \mark \markup \center-column{"Da""Capo"}

}

IIIvoceI = {
    %\notypeset
    \new Voice = "amor1"
    \global
    <<\IIIvoceIn \forma>>

}

IIIvoceII = {
    \new Voice = "amor2"
    \global
    <<\IIIvoceIIn \forma>>

}

IIIvcI = {
    \global
    \clef tenor
    <<\IIIvcIn \forma>>

}

IIIvcII = {
    \global
    \clef tenor
    <<\IIIvcIIn \forma>>
    \typeset

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

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


IVvocen = \relative do' {

   \autoBeamOff
   R1*2
   r2 r4 mi8 fad
   sol la16 si do8 si16 la\mbreak si8 mi, mi mi

   %5
   mi red16 mi fad8 fad16 fad fad8 mi sol4~
   sol8 fad la[si16 do] re8(sol,16) la fad4
   sol r r2
   
   %8
   r r4 si8 si
   do la16 sol fad8 sol16 la si8 mi, mi mi\mbreak
   mi red16 mi fad8 fad16 fad fad8 mi sol4~
   
   %11
   sol8 fad la4. si16 la sol8[fad]
   mi4 r \mbreak la4. si,8
   si'4 r do8[la] fad[la]
   
   %14
   si16[la sol fad mi sol fad sol] la[sol fad mi red fad mi fad]
   sol8 [si sol mi] la[do la fad]\mbreak
   si2~si8 [la16 sol] la4~
   
   %17
   la8 si16 la sol8[fad] mi4 r
   R1*2
   r4 sol8 sol la[do16 si] la8 sol
   
   %21
   fad4 sol8 la si16[la si la] sol4
   do4. re,8\mbreak re'4 re,8 sol
   sol4 la8 sol fad mi16[re] sib'4~
   
   %24
   sib8 la16 sol fad4 sol r\mbreak
   R1
   r4 si8 si si[la16 sol] fad8 fad
   
   %27
   sol4 fad8 fad re si r4
   mi4. dod8\mbreak fad4. re8
   sol4. mi8 lad4 si8 lad
   
   %30
   sol2~sol8[fad] fad4~
   fad8 sol dod,4 si r

}

IVtesto = \lyricmode {
   
   Fra gl'in -- sul -- ti di mar tempes - toso _ nave _ son che la sponda _ non miro _ 
   
   che la spon -- da non mi -- ro,
   
   fra gl'in -- sul -- ti di mar tempes - toso _ nave _ son che la sponda _ non miro _ 
   
   che la spon -- da non mi -- ro, na -- ve son che la spon - - - - - da non miro. _
   
   E più chie -- do con -- for -- to_e ri -- po -- so più m'af -- fan -- no più 
   
   pe -- no_e sos -- piro _ pe -- no_e sospi - ro, e più chie -- do con -- for -- to_e 
   
   ri -- po -- so più m'af -- fan - - - - no più pe -- no_e sos -- pi -- ro.

}


IVvlIn = \relative do'' {
   
   mi,16[sol mi sol mi sol mi sol] fad[la fad la fad la fad la]
   sol[si sol si sol si sol si] la[do la do la do la do]
   si8 mi, si'[si,] mi4 r
   
   %4
   r2\mbreak mi16[sol mi sol mi sol mi sol]
   fad[la fad la fad la fad la]  sol[si sol si sol si sol si] 
   la[do la do la do la do] si8 do re re,\mbreak
   
   %7
   sol16[si sol si sol si sol si] la[do la do la do la do]
   si re do mi re8 re, sol16[si sol si sol si sol si] 
   la[do la do la do la do] sol[si sol si sol si sol si]\mbreak
   
   %10
   fad[la fad la fad la fad la]  sol[si sol si sol si sol si] 
   la[do la do la do la do] si8 mi, si'[si,]
   mi16[sol mi sol mi sol mi sol]\mbreak fad[la fad la fad la fad la]
   
   %13
   sol[si sol si sol si sol si] la[do la do la do la do]
   sol[si sol si sol si sol si] fad[la fad la fad la fad la]  
   mi[sol mi sol mi sol mi sol] fad[la fad la fad la fad la]\mbreak
   
   %16
   sol[si sol si sol si sol si] la[do la do la do la do]
   si8 mi, si'[si,] mi16[sol mi sol mi sol mi sol]
   fad[la fad la fad la fad la]  sol[si sol si sol si sol si] \mbreak
   
   %19
   la[do la do la do la do] si8 mi, si'[si,]
   mi4\fermopz r r2
   r sol16[si sol si sol si sol si]
   
   %22
   la[do la do la do la do] \mbreak  si,[re si re si re si re]
   dod[mi dod mi dod mi dod mi] re[fad re fad dod mi dod mi]
   re sol re sol re8 re sol16[si sol si sol si sol si]\mbreak
   
   %25
   la[do la do la do la do] si re do mi re8 re,
   sol4 r r2
   r si,16[re si re si re si re]
   
   %28
   dod[mi dod mi dod mi dod mi] \mbreak re[fad re fad re fad re fad]
   mi[sol mi sol mi sol mi sol] mi[fad mi fad re fad re fad]
   re[mi re mi dod mi \parenthesize dod mi ]lad, [dod lad dod si re dod mi]
   
   %31
   re fad mi sol fad8 fad si,4 r\fermata
   
}


IVvlan = \relative do''{
   
   mi,16[sol mi sol mi sol mi sol] fad[la fad la fad la fad la]
   sol[si sol si sol si sol si] la[do la do la do la do]
   si8 mi, si'[si,] mi4 r
   
   %4
   r2\mbreak mi16[sol mi sol mi sol mi sol]
   fad[la fad la fad la fad la]  sol[si sol si sol si sol si] 
   la[do la do la do la do] si8 do re re,\mbreak
   
   %7
   sol16[si sol si sol si sol si] fad[la fad la fad la fad la]
   si re do mi re8 re, sol16[si sol si sol si sol si] 
   fad[la fad la fad la fad la] sol[si sol si sol si sol si]\mbreak
   
   %10
   fad[la fad la fad la fad la]  sol[si sol si sol si sol si] 
   la[do la do la do la do] si8 mi, si'[si,]
   mi16[sol mi sol mi sol mi sol]\mbreak fad[la fad la fad la fad la]
   
   %13
   sol[si sol si sol si sol si] la[do la do la do la do]
   sol[si sol si sol si sol si] fad[la fad la fad la fad la]  
   mi[sol mi sol mi sol mi sol] fad[la fad la fad la fad la]\mbreak
   
   %16
   sol[si sol si sol si sol si] la[do la do la do la do]
   si8 mi, si'[si,] mi16[sol mi sol mi sol mi sol]
   fad[la fad la fad la fad la]  sol[si sol si sol si sol si] \mbreak
   
   %19
   la[do la do la do la do] si8 mi, si'[si,]
   mi4\fermopz r r2
   r sol16[si sol si sol si sol si]
   
   %22
   la[do la do la do la do] \mbreak  si,[re si re si re si re]
   dod[mi dod mi dod mi dod mi] re[fad re fad dod mi dod mi]
   re sol re sol re8 re sol16[si sol si sol si sol si]\mbreak
   
   %25
   la[do la do la do la do] si re do mi re8 re,
   sol4 r r2
   r si,16[re si re si re si re]
   
   %28
   dod[mi dod mi dod mi dod mi] \mbreak re[fad re fad re fad re fad]
   mi[sol mi sol mi sol mi sol] mi[ fad mi fad re fad re fad]
   re[mi re mi dod mi dod mi ]lad, [dod lad dod si re dod mi]
   
   %31
   re fad mi sol fad8 fad si,4 r\fermata
   
   



}

IVvcIn = \relative do {

   sol'16[sol sol sol sol sol sol sol] la[la la la la la la la]
   si[si si si si si si si] do[do do do do do do do]
   si8 mi, si' si, mi4 r

   %4
   r2\mbreak sol16[sol sol sol sol sol sol sol]
   la[la la la la la la la] si[si si si si si si si]
   do[do do do do do do do] si8 do re re,\mbreak

   %7
   si'16[si si si si si si si] do[do do do do do do do]
   si8 do re re, sol16[si si si si si si si]
   do[do do do do do do do] si[si si si si si si si]\mbreak

   %10
   la[la la la la la la la] si[si si si si si si si]
   do[do do do do do do do] si8 mi, si'[si,]
   sol'16[sol sol sol sol sol sol sol]\mbreak la[la la la la la la la]

   %13
   si[si si si si si si si] do[do do do do do do do]
   si[si si si si si si si] la[la la la la la la la]
   sol[sol sol sol sol sol sol sol] la[la la la la la la la]\mbreak

   %16
   si[si si si si si si si] do[do do do do do do do]
   si8 mi, si' si, sol'16[sol sol sol sol sol sol sol]
   la[la la la la la la la] si[si si si si si si si]\mbreak

   %19
   do[do do do do do do do] si8 mi, si' si,
   mi4\fermopz r r2
   r si'16[si si si si si si si]

   %22
   do[do do do do do do do]\mbreak re[re re re re re re re]
   mi,[mi mi mi mi mi mi mi] fad[fad fad fad sol sol sol sol]
   sol sol sol sol re'8 re, si'16 [si si si si si si si]\mbreak

   %25
   do[do do do do do do do] si8 do re re,
   sol4 r r2
   r \clef tenor \key mi\minor re'16[re re re re re re re]

   %28
   mi[mi mi mi mi mi mi mi] \mbreak fad[fad fad fad fad fad fad fad]
   sol[sol sol sol sol sol sol sol] fad[fad fad fad fad fad fad fad]
   mi[mi mi mi mi mi mi mi] dod[dod dod dod re re mi mi]

   %31
   fad8 mi fad fad, si4 r\fermata

}

IVvcIIn = \relative do {
   
   mi16[mi mi mi mi mi mi mi] fad[fad fad fad fad fad fad fad]
   sol[sol sol sol sol sol sol sol] la[la la la la la la la]
   si8 mi, si' si, mi4 r
   
   %4
   r2\mbreak mi16[mi mi mi mi mi mi mi]
   fad[fad fad fad fad fad fad fad] sol[sol sol sol sol sol sol sol] 
   la[la la la la la la la] si8 do re re,\mbreak
   
   %7
   sol16[sol sol sol sol sol sol sol] la[la la la la la la la]
   si8 do re re, sol16[sol sol sol sol sol sol sol]
   la[la la la la la la la] sol[sol sol sol sol sol sol sol]\mbreak
   
   %10
   fad[fad fad fad fad fad fad fad] sol[sol sol sol sol sol sol sol] 
   la[la la la la la la la] si8 mi, si' si,
   mi16[mi mi mi mi mi mi mi] fad[fad fad fad fad fad fad fad]
   
   %13
   sol[sol sol sol sol sol sol sol] la[la la la la la la la]
   sol[sol sol sol sol sol sol sol] fad[fad fad fad fad fad fad fad]
   mi[mi mi mi mi mi mi mi] fad[fad fad fad fad fad fad fad]\mbreak
   
   %16
   sol[sol sol sol sol sol sol sol] la[la la la la la la la]
   si8 mi, si' si, mi16[mi mi mi mi mi mi mi] 
   fad[fad fad fad fad fad fad fad] sol[sol sol sol sol sol sol sol]\mbreak
   
   %19
   la[la la la la la la la] si8 mi, si' si,
   mi4\fermopz r r2
   r sol16[sol sol sol sol sol sol sol] 
   
   %22
   la[la la la la la la la]\mbreak si[si si si si si si si]
   dod[dod dod dod dod dod dod dod] re[re re re dod dod dod dod]
   re re re re re8 re, sol16[sol sol sol sol sol sol sol]\mbreak
   
   %25
   la[la la la la la la la] si8 do re re,
   sol4 r r2
   r si16[si si si si si si si]
   
   %28
   dod[dod dod dod dod dod dod dod]\mbreak re[re re re re re re re]
   mi[mi mi mi mi mi mi  mi] mi[mi mi mi re re re re]
   re[re re re dod dod si si] lad[lad lad lad si si dod dod]
   
   %31
   re8 mi fad fad, si4 r\fermata
   
}


IVbcn = \relative do {
   
   mi8 mi mi mi fad fad fad fad
   sol sol sol sol la la la la
   si mi, si' si, mi4 r
   
   %4
   r2 mi8 mi mi mi
   fad fad fad fad sol sol sol sol
   la la la la si do re re,\mbreak
   
   %7
   sol sol sol sol la la la la
   si do re re, sol sol sol sol
   la la la la sol sol sol sol\mbreak
   
   %10
   fad fad fad fad sol sol sol sol
   la la la la si mi, si' si,
   mi mi mi mi\mbreak fad fad fad fad
   
   %13
   sol sol sol sol la la la la
   sol sol sol sol fad fad fad fad
   mi mi mi mi mi mi mi mi\mbreak
   
   %16
   mi mi mi mi la, la la la
   si mi, si' si mi, mi mi mi
   fad fad fad fad sol sol sol sol\mbreak
   
   %19
   la la la la si mi, si' si
   mi,4\fermopz r r2
   r sol8 sol sol sol
   
   %22
   la la la la\mbreak si si si si
   dod dod dod dod re re dod dod
   re re re,[re] sol sol sol sol\mbreak
   
   %25
   la la la la si do re re,
   sol4 r r2
   r si8 si si si
   
   %28
   dod dod dod dod\mbreak re re re re
   mi mi mi mi mi mi re re
   re re dod si lad lad si dod
   
   %31
   re mi fad fad, si4 r\fermata

}

IVbfn = \figures {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 4/4
   \key mi\minor
   \tempo 2 = 50
   s1*19
   s4\bar "||"\break s4 s2
   s1*11
   \bar"||"
   \mark \markup\center-column {"Da""Capo"}

}



IVvlI = {
   \global
   %\notypeset
   <<\IVvlIn \forma>>

}

IVvla = {
   \global
   <<\IVvlan \forma>>

}


IVvoce = {
   \new Voice = "insulti"
   \global
   <<\IVvocen \forma>>

}

IVvcI = {
   \global
   \clef bass
   <<\IVvcIn \forma>>

}

IVvcII = {
   \global
   \clef bass
   <<\IVvcIIn \forma>>

}

IVbc = {
   \global
   \clef bass
   <<\IVbcn \forma \IVbfn>>
   \typeset

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

        systems-per-page = #5

    }

    \header {

        title = \markup \smaller{Arie con Violoncello obbligato}
        composer = \markup \center-column{"N. Porpora (1686-1768)"}

    }

    \markup \huge {"[1.] Aria ”Bella Diva” da ”L'Angelica” (1720)"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key re\major\time 3/4 \numericTimeSignature r2.^\markup \right-align"Med[or]o"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \Ivoce
                \new Lyrics \lyricsto "bella" \Itesto
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"Violongello"}
                \Ivc
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \Ibc
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
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

        systems-per-page = #3

    }

    \markup \huge {"[2.] Aria ”Con troppo fiere immagini” da ”L'Agrippina” (III.7) - Largo"}

    \score {

        \new ChoirStaff <<

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino I]"}
                \IIvlI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violino II]"}
                \IIvlII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup  \center-column{"[Viola]"}
                \IIvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  \center-column{"Violongello"}
                \IIvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key re\major\time 3/4 \numericTimeSignature dod''8._\markup \center-align"Agrip[pina]"[la'16]}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \IIvoce
                \new Lyrics \lyricsto "fiere" \IItesto
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \IIbc
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width = 1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine #'hair-thickness = #1.2
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

    \pageBreak

    \markup \huge {"[3.] Duetto ”All'amor de' nostri cori” da ”L'Agrippina” (III.13)"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key si\minor\time 4/4 r4^\markup \center-align"Giul[i]a"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \IIIvoceI
                \new Lyrics \lyricsto "amor1" \IIItestoI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key si\minor\time 4/4 r4^\markup \center-align"Cali[gola]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \IIIvoceII
                \new Lyrics \lyricsto "amor2" \IIItestoII
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  {"P."\super o "Violongello "}
                \IIIvcI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  {"2."\super o "Violongello"}
                \IIIvcII
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"[Basso]"}
                \IIIbc
            >>
        >>

        \layout {

            indent = 3\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override BarLine #'hair-thickness = #1.2
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

    \pageBreak

    \markup \huge {"[4.] Aria ”Fra gl'insulti di mar tempestoso” da ”L'Agrippina” (II.13) - All[egr]o"}

    \score {

        \new ChoirStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef alto \key mi\minor\time 4/4 r1^\markup \center-align"[Germanico]"}
                \clef violin
                \set Staff.midiInstrument = #"synth voice"
                \IVvoce
                \new Lyrics \lyricsto "insulti" \IVtesto
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup  \center-column{"[Violini]"\vspace #-0.3"Unisoni"}
                \IVvlI
            >>

            \new Staff
            <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit { \clef soprano \key mi\minor\time 4/4 \stemDown mi'16 ^\markup \center-align"Violetta"[sol' mi' sol']}
                \clef violin
                \set Staff.midiInstrument = #"viola"
                \IVvla
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  {"P."\super o "Violongello "}
                \IVvcI
            >>

            \new Staff
            <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup  {"2."\super o "Violongello"}
                \IVvcII
            >>

            \new Staff
            \with {
                fontSize = #+1
                \override StaffSymbol #'staff-space = #(magstep +1)
            }
            <<
                \set Staff.midiInstrument = #"contrabass"
                \set Staff.instrumentName = \markup  \center-column{"Violone e""Cemb[alo]"}
                \IVbc
            >>
        >>

        \layout {

            indent = 3\cm
            incipit-width = 2.5\cm

            \context	{
                \Score
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override BarLine #'hair-thickness = #1.2
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
