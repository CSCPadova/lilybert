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



IvlIn = \relative do'' {

    re8[r16 re la8 r16 la] fad8[r16 fad re8 r16 re]
    la''8.[la16 mi8. mi16] dod8.[dod16 la8. la16]
    re'8.[re16 si8. si16] sol8.[sol16 re8. re16]

    %4
    dod4 r re16 [re8. re16 re8.]
    re'16[dod si la sol fad mi re] re16 [re8. re16 re8.]\mbreak
    re'16[dod si la sol fad mi re]mi la, fad' la, sol' la, fad' la,

    %7
    fad'8\tr mi r fad mi16 la, fad' la, sol' la, fad' la,
    fad'8\tr mi r4 r2
    re'16 [re8. re16 re8.] re16[dod si la sol fad mi re]

    %10
    dod'16 [dod8. dod16 dod8.] dod16[si la sol fad mi re  dod]\mbreak
    si'16[si8. si16 si8.] si16[la sol fad mi re dod si]
    la'16[la8. la16 la8.] la16[sol fad mi re dod si la]

    %13
    sol'16 [sol8. sol16 sol8.] \tuplet 3/2 { sol16(fad mi) } fad8\noBeam \tuplet 3/2 { mi16(re dod) } re8\noBeam
    la dod'4 re8 \tuplet 3/2 { sol,16(fad mi) } fad8\noBeam \tuplet 3/2 { mi16(re dod) } re8\noBeam
    la16 la dod mi la8 r fad16 la, re fad la8 r

    %16
    mi16 la, dod mi la8 r\mbreak  fad fad sol mi
    re8. re16 la8. la16 fad8.[fad16 re8. re16]
    la''8.[la16 mi8. mi16]dod8.[dod16 la8. la16]

    %19
    re'8.[re16 si8. si16] sol8. [sol16 re8. re16]
    dod2\fermata r16 la re fad la4
    r16 la, dod mi la4 r16 re, fad la re4\mbreak

    %22
    r16 dod, mi la dod4 r16 la, re fad la4
    r16 la mi dod la4 r2
    re'16[re8. re16 re8.] re16[dod si la sol fad  mi re]

    %25
    dod'16[dod8. dod16 dod8.] dod16[si la sol fad mi re dod]
    si'16[si8. si16 si8.] si16[la sold fad mi re dod si]\mbreak
    dod8[la'16 la la8 la] la la sold sold

    %28
    la8.[la16 mi8. mi16] dod8.[dod16 la8. la16]
    mi'8.[mi16 si8. si16] sold8.[sold16 mi8. mi16]
    la'8.[la16 fad8. fad16] re8.[re16 la8. la16]

    %31
    sold si mi sold si8 r la la la sold\mbreak
    la4 r sol, mi'
    mi1~

    %34
    mi4 re \tuplet 3/2 { fad16(mi re)} si'8\noBeam \tuplet 3/2 { fad16(mi re) } si'8\noBeam
    sol si4 sol8 \tuplet 3/2 { mi16(re dod) } la'8\noBeam \tuplet 3/2 { mi16(re dod) } la'8\noBeam
    fad la4 fad8 \tuplet 3/2 { re16(dod si) } si'8\noBeam \tuplet 3/2 { re,16 dod si } si'8\noBeam\mbreak

    %37
    sold4 la sold2
    fad8.[fad16 dod8. dod16] la8.[la16 fad8. fad16]
    si'8.[si16 sold8. sold16] mi8.[mi16 si8. si16]

    %40
    la'8.[la16 mi8. mi16] dod8.[dod16 la8. la16]
    fad'8.[fad16 re8. re16] la8.[la16 fad8. fad16]\mbreak
    fad'8.[fad16 fad8. fad16] la16[sol fad mi re dod si la]

    %43
    fad'8.[fad16 fad8. fad16] la16[sol fad mi re dod si la]
    fad'8 fad mi mi fad16[mi re dod si la sol fad]
    fad'8 fad mi mi fad16[mi re dod si la sol fad]

    %46
    fad'8 fad mi mi re2\fermata

}

IvlIIn = \relative do'' {

    la8[r16 la fad8 r16 fad] re8[r16 re la8 r16 la]
    mi''8.[mi16 dod8. dod16] la8.[la16 mi8. mi16]

    %3
    si''8.[si16 sol8. sol16] re8.[re16 si8. si16]
    mi4 r r2
    re16 re8. re16 re8. re'16[dod si la sol fad mi re]\mbreak

    %6
    re[re8. re16 re8.] dod16 la re la mi' la, re la
    re8\tr dod r re dod16 la re la mi' la, re la
    re8\tr dod r4 la'16[la8. la16 la8.]

    %9
    la16[sol fad mi re dod si la] sol'[sol8. sol16 sol8.]
    sol16[fad mi re dod si la sol] fad'16[fad8. fad16 fad8.]\mbreak
    fad16[mi re dod si la sol fad] mi'16[mi8. mi16 mi8.]

    %12
    mi16[re dod si la sol fad mi] re'16[re8. re16 re8.]
    re16 dod si la sol fad mi re mi'8(re) sol[(fad)]
    mi16 re dod si la8[fad'] mi(re) sol[(fad)]

    %15
    mi4 r16 la, dod mi la8 r r16 la, re fad
    la8 r r16 la, dod mi\mbreak la8 re, mi dod
    re8. la16 fad8. fad16 re8.[re16 la8. la16]

    %18
    mi''8.[mi16 dod8. dod16]  la8.[la16 mi8. mi16]
    si''8.[si16 sol8. sol16] re8.[re16 si8. si16]
    mi2\fermata r4 r16 la, re fad

    %21
    la4 r16 la, dod mi  fad4 r16 re fad la\mbreak
    dod4 r16 dod, mi la fad4 r16 la, re fad
    mi mi dod la mi4 la'16[la8. la16 la8.]

    %24
    la16[sol fad mi re dod si la] sol'16[sol8. sol16 sol8.]
    sol16[fad mi re dod si la sol] fad'[fad8. fad16 fad8.]
    fad16[mi re dod si la sol fad] mi'16[mi8. mi16 mi8.]\mbreak

    %27
    mi8[dod16 dod dod8 dod] si si si mi
    mi8.[mi16 dod8. dod16] la8.[la16 mi8. mi16]
    si'8.[si16 sold8. sold16] mi8.[mi16 si8. si16]

    %30
    fad''8.[fad16 re8. re16] la8.[la16 fad8. fad16]
    si16 sold si mi sold8 r dod, dod si si\mbreak
    dod4 r mi, si'

    %33
    dod1
    si4 si r2
    \tuplet 3/2 { si16(la sol) } mi'8\noBeam \tuplet 3/2 { si16(la sol) } mi'8\noBeam dod mi4 dod8

    %36
    \tuplet 3/2 { si16(la sol) } re'8\noBeam \tuplet 3/2 { la16 sol fad } re'8\noBeam re re4 re8\mbreak
    dod4. fad8 fad4 mid
    dod8.[dod16 la8. la16] fad8.[fad16 dod8. dod16]

    %39
    sold''8. [sold16 mi8. mi16] si8. [si16 sold8. sold16]
    mi'8.[mi16 dod8. dod16] la8.[la16 mi8. mi16]
    re'8.[re16 la8. la16] fad8.[fad16 re8. re16]\mbreak

    %42
    re'16[re8. re16 re8.] fad16[mi re dod si la sol fad]
    re'16[re8. re16 re8.] fad16[mi re dod si la sol fad]
    re'8 re dod dod re16 dod si la sol fad mi re

    %45
    re'8 re dod dod re16 dod si la sol fad mi re
    re'8 re re dod re2\fermata

}

Ivlan = \relative do' {

    fad8[r16 fad re8 r16 re] la8[r16 la fad8 r16 fad]
    dod''8.[dod16 la8. la16] mi8.[mi16 dod8. dod16]
    sol'8.[sol16 re8. re16] si8.[si16 sol8. sol16]

    %4
    la4 r fad'8. [fad16 mi8. mi16]
    re8.[re16 dod8. dod16] si8.[si16 la8. la16]\mbreak
    sol8.[sol16 la8. la16] la8 la la la

    %7
    la la r la la la la la
    la la r4 re8 re re re
    fad fad fad re si si' si sol

    %10
    mi mi mi dod la la' la fad\mbreak
    re re re si sol sol' sol mi
    dod dod dod la fad fad' fad re

    %13
    si si si sol dod re la[la']
    dod, mi4 la,8 dod re la la'\mbreak
    dod, mi mi mi fad fad fad fad

    %16
    mi mi mi mi\mbreak re la' si la
    fad8. fad16 re8. re16 la8.[la16 fad8. fad16]
    dod''8.[dod16 la8. la16] mi8.[mi16 dod8. dod16]

    %19
    sol'8.[sol16 re8. re16] si8.[si16 sol8. sol16]
    la2\fermata fad'8 la sol fad
    mi fad mi dod fad la sol fad\mbreak

    %22
    mi fad mi dod fad la sol fad
    dod mi re dod re re re re
    fad fad fad re si si' si sol

    %25
    mi mi mi dod la la' la fad
    re re re si sol sol' sol mi\mbreak
    dod[mi16 mi mi8 mi] mi mi mi mi

    %28
    dod'8.[dod16 la8.la16]mi8.[mi16 dod8. dod16]
    sold'8. [sold16 mi8. mi16] si8.[si16 sold8. sold16]
    re''8.[re16 la8. la16] fad8.[fad16 re8. re16]

    %31
    mi8 mi mi mi mi mi mi mi\mbreak
    mi4 r si sol'!
    lad1

    %34
    fad4 fad re8 re re re
    re re re re dod dod dod dod
    dod dod dod dod si si si si\mbreak

    %37
    si si fad'[dod] dod dod dod dod
    la'8.[la16 fad8. fad16]dod8.[dod16 la8. la16]
    mi''8.[mi16 dod8. dod16] sold8.[sold16 mi8. mi16]

    %40
    dod'8.[dod16 la8. la16] mi8.[mi16 dod8. dod16]
    la'8.[la16 fad8. fad16] re8. [re16 la8. la16]\mbreak
    la'8 la la la la la la la

    %43
    la la la la la la la la
    la la la la la la la la
    la la la la la la la la

    %46
    la la la la fad2\fermata

}

Isopranon = \relative do'' {

    \autoBeamOff
    R1*16
    fad,2 la
    dod mi

    %19
    re~re4 re
    dod2\fermata r
    la4 dod re8. re16 re4\mbreak

    %22
    mi4 mi8 mi fad2
    mi r
    re~re16[dod si la] sol8[re']

    %25
    dod2~ dod16[si la sol] fad8[dod']
    si2~si16[la sold fad] mi8[si']\mbreak
    dod dod16 dod dod8 dod si2

    %28
    la r
    R1*3
    la4 dod mi2~

    %33
    mi4 mi8 mi mi4 mi8 mi
    mi4 re fad re
    r2 mi4 dod

    %36
    r4 r8 dod fad4 fad\mbreak
    dod4 la sold2
    la4 r dod la

    %39
    r2 mi'4 si
    r2 dod4 la
    r2 la4 fad\mbreak

    %42
    re'1~
    re2~re8 re re re
    re4 dod re r8 re

    %45
    re re dod4 re r
    R1

}

ItestoI = \lyricmode {

    Di -- xit di -- xit Do -- mi -- nus di -- xit Do -- mi -- nus Do -- mino _ me -- o:

    se - - - - - - de a dextris _ me -- is.

    Di -- xit Do -- mi -- nus Do -- mino _ me -- o: se -- de se -- de a dex -- tris me - - is

    se -- de se -- de se -- de se -- de se -- de a dex -- tris me -- is a dextris _ me -- is.

}

Ialton = \relative do' {

    \autoBeamOff
    R1*16
    re2 fad
    la dod

    %19
    sol~sol4 sol
    mi2\fermata re4 fad
    la8. la16 la4 la la8 la\mbreak

    %22
    dod4 dod la la8 la
    la4 la la2~
    la16[sol fad mi] re8[la'] sol2~

    %25
    sol16[fad mi re] dod8[sol'] fad2~
    fad16[mi re dod] si8 [fad'] mi2 \mbreak
    mi8 mi16 mi la8 la la4(sold)

    %28
    la2 r
    R1*3\mbreak
    r2 sol4 si

    %33
    lad lad8 lad lad4 lad8 lad
    fad4 fad re' si
    r2 dod4 la

    %36
    r4 r8 fad si4 si\mbreak
    sold fad2 mid4
    fad r la fad

    %39
    r2 sold4 mi
    r2 mi4 dod
    r2 fad4 re\mbreak

    %42
    fad1~
    fad2~fad8 fad fad fad
    fad4 mi fad r8 fad

    %45
    fad fad mi4 fad r
    R1

}

ItestoII = \lyricmode {

    Di -- xit di -- xit Do -- mi -- nus di -- xit Do -- mi -- nus Do -- mino _ me -- o Do -- mino _ me -- o:

    se - - - - - - - de a dextris _ me -- is.

    Di -- xit Do -- mi -- nus Do -- mino _ me -- o: se -- de se -- de a dex -- tris me - - is

    se -- de se -- de se -- de se -- de se -- de a dextris _ me -- is a dextris _ me -- is.

}

Itenoren = \relative do' {

    \autoBeamOff
    R1*16
    la2 re
    mi dod

    %19
    re~re4 sol,
    la2\fermata r
    R1\mbreak

    %22
    la4 dod re8. re16 re4
    re dod8 dod re re r4
    fad4~fad16[mi re dod] si4~si16[si dod re]

    %25
    mi4~mi16[re dod si] la4~la16[la si dod]
    re4~re16[dod si la] si2\mbreak
    la8 la16 mi'  mi8 mi mi2

    %28
    dod r
    R1*3\mbreak
    r2 si4 mi

    %33
    dod dod8 dod dod4 dod8 dod
    si4 si r2
    si4 sol r2

    %36
    la4 fad8 re' fad4 si,\mbreak
    dod1
    dod4 r dod fad,

    %39
    r2 si4 si
    r2 la4 la
    r2 re4 la\mbreak

    %42
    la1~
    la2~la8 la la la
    la2 la4 r8 la

    %45
    la la la4 la r
    R1

}

ItestoIII = \lyricmode {

    Di -- xit di -- xit Do -- mi -- nus di -- xit Do -- mi -- nus Do -- mino _ me -- o:

    se - - - - - - de a dextris _ me -- is.

    Di -- xit Do -- mi -- nus Do -- mino _ me -- o: se -- de se -- de a dex -- tris me -- is

    se -- de se -- de se -- de se -- de se -- de a dex -- tris_me -- is a dextris _ me -- is.

}

Ibasson = \relative do {

    \autoBeamOff
    R1*16
    re2 re
    dod dod

    %19
    si~si4 si
    la2\fermata r
    r re4 fad\mbreak

    %22
    la8. la16 la4 re, re8 re
    la4 la fad'2
    si mi,

    %25
    la re,
    sol sold\mbreak
    la8 la,16 la la8 la mi'2

    %28
    la, r
    R1*3
    r2 mi'4 sol!

    %33
    fad fad8 fad fad4 fad8 fad
    si4 si, r2
    sol'4 mi r2

    %36
    fad4 re8 re si4 si'\mbreak
    mid,4 fad si, dod
    fad r fad fad

    %39
    r2 mi4 mi
    r2 la4 la,
    r2 re4 re

    %42
    re1~
    re2~re8 re re re
    la'4 la, re r8 re

    %45
    re8 re la'[la,] re4 r
    R1

}

ItestoIV = \lyricmode {

    Di -- xit di -- xit Do -- mi -- nus di -- xit Do -- mi -- nus Do -- mino _ me -- o:

    se - - - - - - - de a dextris _ me -- is.

    Di -- xit Do -- mi -- nus Do -- mino _ me -- o: se -- de se -- de a dex -- tris me - - - is

    se -- de se -- de se -- de se -- de se -- de a dex -- tris me -- is a dextris _ me -- is.

}

Ibcn = \relative do {

    re16\f[mi fad sol la si dod re] re,[mi fad sol la si dod re]
    dod,[re mi fad sol la si dod] dod,[re mi fad sol la si dod]
    si,[dod re mi fad sol la si] si,[dod re mi fad sol la si]

    %4
    la4 r re8. [re16 dod8. dod16]
    si8.[si16 la8. la16] sol8.[sol16 fad8. fad16]\mbreak
    mi8.[mi16 re8. re16] la8 la la  la

    %7
    la16[si dod re mi fad sol la] la,8 la la la
    la16[si dod re mi fad sol la] fad8 fad fad fad
    si si si si mi, mi mi mi

    %10
    la la la la re, re re re\mbreak
    sol sol sol sol dod, dod dod dod
    fad fad fad fad si, si si si

    %13
    mi mi mi mi la, la la la
    la la la la la la la la
    la dod dod dod re re re re

    %16
    dod dod dod dod\mbreak re re sol, la
    re16[mi fad sol la si dod re] re,[mi fad sol la si dod re]
    dod,[re mi fad sol la si dod] dod,[re mi fad sol la si dod]

    %19
    si,[dod re mi fad sol la si] si,[dod re mi fad sol la si]
    la,2_\fermata re8 fad mi re
    la' sol la la, re fad mi re\mbreak

    %22
    la' sol la la, re fad mi re
    la dod si la fad' fad fad fad
    si si si si mi, mi mi mi

    %25
    la la la la re, re re re
    sol sol sol sol sold sold sold sold\mbreak
    la la, la la mi' mi mi, mi

    %28
    la16[si dod re mi fad sold la] la,[si dod re mi fad sold la]
    sold,[la si dod re mi fad sold] sold,[la si dod re mi fad sold]
    fad,[sold la si dod re mi fad] fad,[sold la si dod re mi fad]

    %31
    mi,8 mi mi mi la la re mi\mbreak
    la,4 r mi' sol!
    fad8 fad fad fad fad fad fad fad

    %34
    si4 si, si8 si si si
    mi mi mi mi la, la la la
    re re re re si si si si\mbreak

    %37
    mid4 fad si, dod
    fad,16[sold la si dod re mi fad] fad,[sold la si dod re mi fad]
    mi,[fad sold la si dod re mi ] mi,[fad sold la si dod re mi]

    %40
    la,[si dod re mi fad sold la] la,[si dod re mi fad sold la]
    re,[mi fad sol? la si dod re] re,[mi fad sol la si dod re]\mbreak
    re,[mi fad sol la si dod re]re,8 re re re

    %43
    re16[mi fad sol la si dod re] re,8 re re re
    la' la la, la re4 r8 re
    re re la'[la,] re4 r8 re

    %46
    re re la'[la,] re,2\fermata

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 50
    s1*46
    \bar "|."

}

IvlI = {
    \notypeset
    <<\IvlIn \forma>>

}

IvlII = {
    <<\IvlIIn \forma>>

}

Ivla = {
    \clef alto
    <<\Ivlan \forma>>

}

Isoprano = {
    \new Voice = "dixit1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "dixit2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "dixit3"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "dixit4"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset
}





IIvlIn = \relative do'' {

    si8\f r fad r si,4 r8 r32 re mi fad
    si,8 r32 re mi fad si,8 r32 re mi fad lad,4 r
    fad''8 r dod r fad,4 r8 r32 dod' re mi

    %4
    fad,8 r32 dod' re mi fad,8 r32 dod' re mi re4 si,
    fad''8\p fad fad fad sol sol sol sol
    mi mi mi mi fad fad fad fad\mbreak
    re re re re dod4 r8 fad

    %8
    re si sol mi lad, r si\pp r
    mi r fad r si,4\f r
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad

    %11
    lad,4 r fad'8 r32 dod' re mi fad,8 r32 dod' re mi\mbreak
    fad,8 r32 dod' re mi fad,8 r32 lad sold fad si,4 r
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad

    %14
    lad,4 r fad'8 r32 dod' re mi fad,8 r32 dod' re mi
    fad,8 r32 dod' re mi fad,8 r32 lad sold fad si8 fad 're si
    fad re' si fad re si' re, si

    %17
    fad'4 fad fad'8\p fad fad fad
    sol sol sol sol mi mi mi mi
    fad fad fad fad re re re re

    %20
    mi mi mi mi\mbreak dod dod dod dod
    re re dod si la8 la'\f fad re
    sol,! mid fad la si sold dod dod,

    %23
    fad8 r32 la si dod fad,8 r32 la si dod mid,8 r32 mid fad sold? si,8 r32 mid fad sold!
    \once\stemUp la,8 la''\upl si\upl sold\upl fad4 r

    %25
    r2 fad,8 r32 dod' re mi fad,8 r32 lad sol fad
    si8 r32 re, mi fad si,8 r32 re dod si mi4 r
    r2  mi8 r32 sold la si mi,8 r32 sold fad mi

    %28
    la8 r32 dod, re mi la,8 r32 dod re mi \once\stemUp la,8 mi''\p mi mi
    fad fad fad fad fad fad fad fad\mbreak
    mi mi mi mi mi mi mi mi

    %31
    re re re re re re re re
    re re dod dod fad,8 r32 lad si dod fad,8 r32 lad sol fad

    %33
    si8 fad si, si' mi, dod fad fad
    si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad \mbreak
    si,8 r32 re mi fad si,8 r32 re mi fad  si,8 r32 re mi fad si,8 r32 re mi fad

    %36
    si,8 r32 re mi fad si,8 r32 re mi fad \once\stemUp si,8 fad'' re si
    sol! mid fad si mi,? sol fad fad
    si, fad' fad sol mi mi mi fad\mbreak

    %39
    re fad\p fad sol mi mi mi fad
    re4 si'8\f r mi, r fad r
    si,1\fermata

}

IIvlIIn = \relative do'' {

    si8\f r fad r si,4 r8 r32 re mi fad
    si,8 r32 re mi fad si,8 r32 re mi fad lad,4 r
    fad''8 r dod r fad,4 r8 r32 dod' re mi

    %4
    fad,8 r32 dod' re mi fad,8 r32 dod' re mi re4 si,
    re'8\p re re re si si si si
    dod dod dod dod la la la re\mbreak
    si si si si lad4 r8 fad'

    %8
    re si sol mi lad, r si\pp r
    mi r fad r si,4\f r
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad

    %11
    lad,4 r fad'8 r32 dod' re mi fad,8 r32 dod' re mi\mbreak
    fad,8 r32 dod' re mi fad,8 r32 lad sold fad si,4 r
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad

    %14
    lad,4 r fad'8 r32 dod' re mi fad,8 r32 dod' re mi
    fad,8 r32 dod' re mi fad,8 r32 lad sold fad si8 fad 're si
    fad re' si fad re si' re, si

    %17
    fad'4 fad re'8\p re re re
    si si si si dod dod dod dod
    la la la la si si si si

    %20
    sol sol sol sol\mbreak lad lad lad lad
    fad fad' mi re dod8 la'\f fad re
    sol,! mid fad la si sold dod dod,

    %23
    fad8 r32 la si dod fad,8 r32 la si dod mid,8 r32 mid fad sold? si,8 r32 mid fad sold!
    \once\stemUp la,8 fad''\upl sold\upl mid\upl fad4 r

    %25
    r2 fad,8 r32 dod' re mi fad,8 r32 lad sol fad
    si8 r32 re, mi fad si,8 r32 re dod si mi4 r
    r2  mi8 r32 sold la si mi,8 r32 sold fad mi

    %28
    la8 r32 dod, re mi la,8 r32 dod re mi la,8 la'\p la la
    la la la la sold sold sold sold\mbreak
    sold? sold sold sold fad fad fad fad

    %31
    fad fad fad fad mi mi mi mi
    mi mi mi mi fad8 r32 lad si dod fad,8 r32 lad sol fad

    %33
    si8 fad si, si' mi, dod fad fad
    si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad \mbreak
    si,8 r32 re mi fad si,8 r32 re mi fad  si,8 r32 re mi fad si,8 r32 re mi fad

    %36
    si,8 r32 re mi fad si,8 r32 re mi fad \once\stemUp si,8 fad'' re si
    sol! mid fad si mi,? sol fad fad
   si, re re mi dod dod dod dod\mbreak

    %39
    si re\p re mi dod dod dod dod
    si4 si'8\f r mi, r fad r
    si,1\fermata

}

IIvlan = \relative do' {

    si'8\f r fad r si,4 r8 r32 re mi fad
    si,8 r32 re mi fad si,8 r32 re mi fad lad,4 r
    fad''8 r dod r fad,4 r8 r32 dod' re mi

    %4
    fad,8 r32 dod' re mi fad,8 r32 dod' re mi re4 si,
    si'8\p si si si mi, mi mi mi
    la la la la re, re re re\mbreak
    mid mid mid mid fad4 r8 fad'

    %8
    re si sol mi lad, r si\pp r
    mi r fad r si,4\f r
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad

    %11
    lad,4 r fad'8 r32 dod' re mi fad,8 r32 dod' re mi\mbreak
    fad,8 r32 dod' re mi fad,8 r32 lad sold fad si,4 r
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad

    %14
    lad,4 r fad'8 r32 dod' re mi fad,8 r32 dod' re mi
    fad,8 r32 dod' re mi fad,8 r32 lad sold fad si8 fad 're si
    fad re' si fad re si' re, si

    %17
    fad'4 fad, si'8\p si si si
    mi, mi mi  mi la la la la
    re, re re re sol sol sol sol

    %20
    dod, dod dod dod\mbreak fad fad fad fad
    si, dod re mid fad8 la\f fad re
    sol! mid fad la si sold dod dod,

    %23
    fad8 r32 la si dod fad,8 r32 la si dod mid,8 r32 mid fad sold? si,8 r32 mid fad sold!
    \once\stemUp la,8 dod'\upl re\upl dod\upl la4 r

    %25
    r2 fad8 r32 dod' re mi fad,8 r32 lad sol fad
    si8 r32 re, mi fad si,8 r32 re dod si mi4 r
    r2  mi8 r32 sold la si mi,8 r32 sold fad mi

    %28
    la8 r32 dod, re mi la,8 r32 dod re mi la,8 dod\p dod dod
    re re re re si si si si\mbreak
    dod dod dod dod la la la la

    %31
    si si si si sold sold sold sold
    la la la la fad'8 r32 lad si dod fad,8 r32 lad sol fad

    %33
    si8 fad si, si' mi, dod fad fad,
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad \mbreak
    si,8 r32 re mi fad si,8 r32 re mi fad  si,8 r32 re mi fad si,8 r32 re mi fad

    %36
    si,8 r32 re mi fad si,8 r32 re mi fad \once\stemUp si,8 fad'' re si
    sol! mid fad si mi,? sol fad fad,
   si si si si mi, fad fad fad\mbreak

    %39
    fad fad\p si si mi, fad fad fad
    fad8 r si'8\f r mi, r fad r
    si,1\fermata

}

IIsopranon = \relative do'' {

    \autoBeamOff
    R1*13
    fad4 dod lad fad
    fad8. fad16 sold8. lad16\mbreak si4 si

    %16
    r8 si si si si4 si8 si
    si4 lad r2
    R1*3

    %21
    r2 r8 fad' re si
    sol![mid] fad la si sold? dod[dod,]
    fad4 r r2

    %24
    r fad'4 dod\mbreak
    la fad mi'8 mi mi mi
    mi4 re mi si

    %27
    sold mi re'8 re re re
    re4 dod r2
    R1*3

    %32
    r2 mi4 mi8 mi
    re[mi] fad re dod2\tr
    si4 r r2\mbreak

    %35
    R1
    fad'4 re8 si si[fad'] re si
    sol![mid] fad si mi, re fad4\tr

    %38
    si,2 r
    R1*3

}

IItestoI = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bellum _ pedum _ tu -- o -- rum.

    Sca -- bellum _ pedum _ pedum _ tu -- o -- rum.

    Do -- nec po -- nam ini - mi -- cos tu -- os do -- nec po -- nam ini - mi -- cos tu -- os

    sca -- bellum _ pedum _ tu -- o -- rum sca -- bellum _ pedum _ tu -- o -- rum pedum _ tu -- o -- rum.

}

IIalton = \relative do' {

    \autoBeamOff
    R1*11
    r2 si'4 fad
    re si si8. dod16 re8. mi16

    %14
    fad4 fad r fad
    fad8. [mi16] re8[dod]\mbreak si4 si
    si8 fad'4 fad8 fad2

    %17
    fad r8 si,\solo re fad
    sol4~sol 16 [mi sol si] dod8.[si16 la sol fad mi]
    fad4~fad16[re fad la] si8.[la16 sol fad mi re]

    %20
    mi4~mi16[sol fad mi]\mbreak lad8.[sol16 fad mi re dod]
    re8[dod] si4 r8 fad' re si'
    sol![mid] fad la si sold dod[dod,]

    %23
    fad4 r r2
    R1\mbreak
    r2 lad8 lad lad lad

    %26
    fad4 fad r2
    r sold8 sold sold sold
    mi4 mi r8 mi\solo la mi

    %29
    fad[re fad la] re8.[dod16 si la sold fad]\mbreak
    mi8[dod mi sold] dod8.[si16 la sold fad mi]
    re8[si re fad] si8.[la16 sold fad mi re]

    %32
    re4\tr dod lad' lad8 lad
    fad4 fad8 fad fad2
    fad4 r r2\mbreak

    %35
    r si4 fad8 re
    re2~re8[fad] re si'
    sol![mid] fad si mi,? sol fad4\tr

    %38
    si,2 r\mbreak
    R1*3

}

IItestoII = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pedum _ pedum _ tu -- o -- rum.

    Sca -- bellum _ pe - - - - - - dum sca -- bellum _ pedum _ pedum _ tu -- o -- rum.

    Ini - mi -- cos tu -- os ini - mi -- cos tu -- os

    sca -- bellum _ pe - - - - - - dum  sca -- bellum _ pedum _ tu -- o -- rum

    sca -- bellum _ pe  -- dum tu -- o -- rum pe  -- dum tu -- o -- rum.

}

IItenoren = \relative do' {

    \autoBeamOff
    R1*10
    fad4 dod lad fad\mbreak
    fad8. fad16 sold8. lad16 si4 si

    %13
    r fad fad fad
    dod'2 dod~
    dod4 dod8 dod\mbreak re4 re

    %16
    re2 re4 re
    dod dod r2
    R1*3

    %21
    r2 r8 fad re si
    sol![mid] fad la si sold dod[dod,]
    fad4 r r2

    % 24
    R1
    r2 dod'8 dod dod dod
    si4 si r2

    %27
    r si8 si si si
    la4 la r2
    R1*3

    %32
    r2 dod4 dod8 dod
    si[dod] re si si4 lad
    si r r2\mbreak

    %35
    fad'4 re8 si fad2~
    fad~fad8[fad'] re si
    sol![mid] fad si mi,? sol fad4\tr

    %38
    si,2 r
    R1*3

}

IItestoIII = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe - dum  tu -- o -- rum

     pe -- dum tu -- o -- rum.

    Sca -- bellum _ pedum _ pe -- dum tu -- o -- rum.

    Ini - mi -- cos tu -- os ini - mi -- cos tu -- os sca -- bel -- lum pedum _ tu -- o - rum

    sca -- bel -- lum pe  -- dum tu -- o -- rum pedum _ tu -- o -- rum.

}

IIbasson = \relative do {

    \autoBeamOff
    R1*8
    r2 si'4 fad
    re si si8. dod16 re8. mi16

    %11
    fad4 fad r fad\mbreak
    fad8[mi] re[dod] si2
    si~si4 si

    %14
    lad lad fad'2
    fad4 fad\mbreak si si,
    si2 si

    %17
    fad' r
    R1*3
    r2 r8 fad re si

    %22
    sol'![mid] fad la si sold dod[dod,]
    fad4 r r2
    R1\mbreak

    %25
    r2 fad8 fad fad fad
    si4 si, r2
    r mi8 mi mi mi

    %28
    la4 la, r2
    R1*3
    r2 fad'4 fad8 fad

    %33
    la[fad] si, si' mi,[dod] fad4
    si, r si' fad8 re\mbreak
    si2~si~

    %36
    si si8[fad'] re' si
    sol![mid] fad si mi, sol fad[fad,]
    si2 r

    %39
    R1*3

}

IItestoIV = \lyricmode {

    Do -- nec po -- nam ini - mi -- cos tu -- os sca -- bel -- lum pe -- dum  tu -- o -- rum

     sca -- bel -- lum pe -- dum tu -- o -- rum.

    Sca -- bellum _ pedum _ pe -- dum tu -- o -- rum.

    Ini - mi -- cos tu -- os ini - mi -- cos tu -- os sca -- bel -- lum pedum _ tu -- o - rum

    sca -- bel -- lum pe  - dum tu -- o -- rum pedum _ tu -- o -- rum.

}

IIbcn = \relative do {

    si'8\f r fad r si,4 r8 r32 re mi fad
    si,8 r32 re mi fad si,8 r32 re mi fad lad,4 r
    fad''8 r dod r fad,4 r8 r32 dod' re mi

    %4
    fad,8 r32 dod' re mi fad,8 r32 dod' re mi re4 si,
    R1*2\mbreak
    r2 r4 r8 fad''

    %8
    re si sol mi lad, r si\pp r
    mi r fad r si,4\f r
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad

    %11
    lad,4 r fad'8 r32 dod' re mi fad,8 r32 dod' re mi\mbreak
    fad,8 r32 dod' re mi fad,8 r32 lad sold fad si,4 r
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad

    %14
    lad,4 r fad'8 r32 dod' re mi fad,8 r32 dod' re mi
    fad,8 r32 dod' re mi fad,8 r32 lad sold fad si8 fad 're si
    fad re' si fad re si' re, si

    %17
    fad'4 fad, r2
    R1*3
    r2 r8 \clef alto la'' fad re

    %22
    \clef bass sol,! mid fad la si sold dod dod,
    fad8 r32 la si dod fad,8 r32 la si dod mid,8 r32 mid fad sold? si,8 r32 mid fad sold!
    la,8 fad' la, dod fad,4 r\mbreak

    %25
    r2 fad'8 r32 dod' re mi fad,8 r32 lad sol fad
    si8 r32 re, mi fad si,8 r32 re dod si mi4 r
    r2  mi8 r32 sold la si mi,8 r32 sold fad mi

    %28
    la8 r32 dod, re mi la,8 r32 dod re mi la,4 r
    R1*3
    r2 fad'8 r32 lad si dod fad,8 r32 lad sol fad

    %33
    si8 fad si, si' mi, dod fad fad,
    si8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad si,8 r32 re mi fad \mbreak
    si,8 r32 re mi fad si,8 r32 re mi fad  si,8 r32 re mi fad si,8 r32 re mi fad

    %36
    si,8 r32 re mi fad si,8 r32 re mi fad \once\stemUp si,8 fad'' re si
    sol! mid fad si mi,? sol fad fad,
    si si si si dod lad lad lad\mbreak

    %39
    si\p si si si dod lad lad lad
    si4 si'8\f r mi, r fad r
    si,1\fermata

}

IIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s1*31
    s2 <7 _+>

}


forma = {

    \time 4/4
    \key si\minor
    \tempo 4 = 60
    s1*41
    \bar "|."

}

IIvlI = {
    \notypeset
    <<\IIvlIn \forma>>

}

IIvlII = {
    <<\IIvlIIn \forma>>

}

IIvla = {
    \clef alto
    <<\IIvlan \forma>>

}

IIsoprano = {
    \new Voice = "donec1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "donec2"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "donec3"
    <<\IItenoren \forma>>
}

IIbasso = {
    \clef bass
    \new Voice = "donec4"
    <<\IIbasson \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
    \typeset
}





IIIvlIn = \relative do'' {

    re4 fad,~fad8 sol la si
    la4 la'\p~la8[sol16 la si8 la]
    sol4 sol,\f~sol8[fad16 sol la8 sol]

    %4
    fad4 fad'\p~fad8[mi16 fad sol8 fad]
    mi la,\f la'4~la8[do,16 si do8 re]
    si4 si'\p~si8[re,16 dod? re8 mi]\mbreak

    %7
    dod4 mi\f~mi8[sol,16 fad sol8 la]
    fad4 r8 fad'\p \appoggiatura {mi16[fad]} sol8 fad r fad
    \appoggiatura {mi16[fad]} sol8 fad r4 fad16\f fad sol fad fad8 r

    %10
    fad16\p fad sol fad fad8 r fad16\f fad sol fad fad fad sol fad
    fad\p fad sol fad fad fad sol fad mi4\f r8 re
    fad,8. mi32 re mi4 re r\mbreak

    %13
    re'4\p fad,~fad8 sol la si
    si4 la8 re mi16 re dod si la8 sol
    sol4\tr fad re' mi8 fad

    %16
    mi \appoggiatura re dod \appoggiatura si la dod re2\tr
    dod16 dod re dod dod dod re dod dod4 mi,\mbreak
    fad4~fad16 la sol fad re'4~re16 dod si la

    %19
    sold4~sold16 si la sold mi'4~mi16 re dod si
    la4~la16 dod si la fad'4~fad16 mi re dod
    si16 si dod si si8 r si16 si dod si si8 r

    %22
    si16 si dod si si si dod si si si dod si si si dod si\mbreak %%fine p. 23
    dod4 r la'8\f[sold16 fad mi re dod si]
    dod8 si16 la si4\tr la' dod,4~

    %25
    dod8 re mi fad mi16 mi fad mi mi mi fad mi
    mi\p mi fad mi mi mi fad mi la8\f[sold16 fad mi re dod si]
    dod8 si16 la si4\tr la\p la~\mbreak

    %28
    la8 dod re mi fad4 mi8 la,
    sold16 mi re'4(si8) dod16 dod re dod dod dod re dod
    dod4 re8 mi lad,4. sold16 fad

    %31
    dod'4. si16 lad? sold'8 [fad16 mi re8 dod]\mbreak
    re16 re mi re re re mi re re4 r
    si8 r mi r sol si, si mi

    %34
    dod r fad r lad dod, dod fad
    re r fad r sol sol sol dod,
    dod16 dod re dod dod dod re dod\mbreak dod dod re dod dod dod re dod

    %37
    mi8\tr re16 dod re8\tr dod16 si dod8\tr si16 lad si8 re
    mi8\tr re16 dod re8\tr dod16 si dod8\tr si16 lad si8 si
    fad' mi16 re dod si lad sol fad8 si16 dod dod4\tr

    %40
    si'\f re,~re8 mi fad sol\mbreak
    fad si, la'4~la8[sol16 la si8 la]
    sol4 sol,\p\parentSlur (sol8)[fad16 sol la8 sol]

    %43
    fad4 fad'\f~fad8[mi16 fad sol8 fad]
    mi la, r4 re\p fad,~
    fad8 sol la si si4\tr la8 re

    %46
    mi16 re dod si la8 sol sol4 fad\mbreak
    r8 la si do do\tr si16 la si4~
    si8 si dod? re re\tr dod16 si dod8 mi

    %49
    sol,2\tr fad16 fad' sol fad fad fad sol fad
    fad4 re si~si16 la sol fad
    mi8 si'4 mi8\mbreak dod4~dod16 si la sol

    %52
    fad8 dod'4 fad8 re4~re16 dod si la
    sol8 re'4 sol8 mi16 re dod si la8 sol
    sol8. la16 la4\tr fad'16 fad sol fad fad fad sol fad

    %55
    fad\pp fad sol fad fad fad sol fad\mbreak fad\p fad sol fad fad fad sol fad
    fad\pp fad sol fad fad fad sol fad fad mi fad sol la8 re,
    dod16 re mi re dod si la sol fad8 mi16 re mi4\tr

    %58
    re8 re' la[fad] re[mi16 fad sol la si dod]\mbreak
    re\f[la si dod re mi fad sol] la8 re, mi4\tr
    fad16 fad sol fad fad fad sol fad \appoggiatura {mi16[fad]} sol8 fad r fad\p

    %61
    \appoggiatura {mi16[fad]} sol8 fad\f r16 fad sol fad fad fad sol fad fad fad sol fad
    re'8[dod16 si la sol fad mi] fad8 mi16 re mi4\tr\mbreak
    re1\fermata

}

IIIvlIIn = \relative do'' {

    la4 re,~re8 mi fad sol
    fad4 fad'\p~fad8[mi16 fad sol8 fad]
    mi4 mi,\f~mi8[re16 mi fad8 mi]

    %4
    re4 re'\p~re8[dod16 re mi8 re]
    dod la\f mi'4 fad8[la,16 sol la8 la]
    sol4 re'\p mi8[si16 la si8 dod]\mbreak

    %7
    la4 dod\f~dod8[mi,16 re mi8 mi]
    re4 r8 re' \p\appoggiatura {dod16[re]} mi8 re r re
    \appoggiatura {dod16[re]} mi8 re r4 re16\f re mi re re8 r

    %10
    re16\p re mi re re8 r re16\f re mi re re re mi re
    re\p re mi re re re mi re dod4\f r8 fad,
    re4 dod re r\mbreak

    %13
    la'\p re,~re8 mi fad sol
    sol4 fad8 la dod la mi dod
    la la'4 sol8 fad la sol la

    %16
    dod, la' mi la fad re' si sold
    la16 la si la la la si la la4 r8 dod,\mbreak
    la[la'16 sol la8 la] r la16 [sol la8 la]

    %19
    r si16[la si8 si] r si16[la si8 si]
    r dod16[si dod8 dod] r dod la la
    sold16 sold la sold sold8 r sold16 sold la sold sold8 r

    %22
    sold?16 sold la sold sold sold la sold sold sold la sold sold sold la sold\mbreak
    la4 r mi'8.\f[re16 dod si la sold]
    la8 la4 sold8 mi'4 la,~

    %25
    la8 si dod re dod16 dod re dod dod dod re dod
    dod\p dod re dod dod dod re dod mi8.\f[re16 dod si la sold]
    la8 la4 sold8 la4\p dod~\mbreak

    %28
    dod8 la si dod re4\tr dod8 dod
    si16 sold si4 sold8 la16 la si la la la si la
    la4 r8 si dod4. si16 lad

    %31
    lad?4. sol16 fad mi'8[re16 dod si8 lad!]\mbreak
    si16 si dod si si si dod si si4 r
    sol8 r si r si sol sol si

    %34
    lad r dod r dod lad lad lad
    fad r re' r si si si si
    lad16 lad si lad lad lad si lad\mbreak lad lad si lad lad lad si lad

    %37
    dod8 lad si fad mi'\tr re16 dod re8\tr dod16 si
    dod8 lad si fad mi'\tr re16 dod re8\tr dod16 si
    fad'8 mi16 re dod si lad sol fad8 si4 lad8

    %40
    re4 si~si8 dod re mi\mbreak
    re4 fad~fad8[mi16 fad sol8 fad]
    mi4 mi,\p~mi8[re16 mi fad8 mi]

    %43
    re4 re'\f~re8[dod16 re mi8 re]
    dod4 r la\p re,~
    re8 mi fad sol sol4\tr fad

    %46
    dod'8 la mi[dod] dod[fad16 sol la8 sol]\mbreak
    fad fad sol la la\tr sol16 fad sol4
    r8 sold la si si\tr la16 sold la8 dod

    %49
    mi,2\tr re16 re' mi re re re mi re
    re4 r8 la re, re re re
    si mi mi si'\mbreak mi, mi mi mi

    %52
    dod fad fad dod' fad, fad fad fad
    re sol sol re' sol, sol sol mi
    la8. la16 la4 re16 re mi re re re mi re

    %55
    re\pp re mi re re re mi re\mbreak re\p re mi re re re mi re
    re\pp re mi re re re mi re re mi fad sol la8 re,
    dod16 re mi re dod si la sol fad8 mi16 re mi4\tr

    %58
    re8 re' la[fad] re8[mi16 fad sol la si dod]\mbreak
    re\f[la si dod re mi fad sol] la8 re, dod4\tr
    re16 re mi re re re mi re \appoggiatura {dod16[re]} mi8 re r re\p
    %61
    \appoggiatura {dod16[re]} mi8 re\f r16 re mi re re re mi re re re mi re
    si'8[la16 sol fad mi re dod] re4 dod\tr \mbreak
    re1\fermata

}

IIIvlan = \relative do' {

    r8 fad16[sol la8 sol] fad4 r
    r8 fad16\p[sol la8 sol] fad4 r
    r8 dod16\f[re mi8 re] dod4 r

    %4
    r8 fad16\p[sol la8 sol] fad4 r
    r8 dod16\f[re mi8 dod] re4 r
    r8 si16\p[dod re8 dod] si4 r\mbreak

    %7
    r8 mi16\f[re mi8 re] dod4 r
    r8 fad16\p[sol la8 fad] r8 fad16[sol la8 fad]
    r8 fad16[sol la8 fad] fad\f fad mi mi

    %10
    re\p re dod dod si \f si la la
    sol\p sol fad fad la4\f r8 la
    la4 la la r\mbreak

    %13
    r8 re16[mi fad8 mi] re[la] re dod
    re,[re'16 mi fad8 re] la si dod la
    re,[re'16\p mi fad8 re] re fad  mi re

    %16
    la [la16 si dod8 la] si si' sold mi
    la, mi' mi mi mi4 r8 la,\mbreak
    re,[re'16 mi fad8 re] r re16[mi fad8 re]

    %19
    r mi16[fad sold8 mi] r mi16[fad sold8 mi]
    r fad16[sold la8 fad] r re16[dod re8 re]
    mi sold fad fad mi mi re re

    %22
    dod dod si si la la sold sold\mbreak
    mi'4 r dod8\f[fad] dod mi
    mi4. mi8 dod[mi16 re mi8 re]

    %25
    dod4 r dod8 dod' si si
    la\p la sold sold dod,\f fad si, mi
    mi4. mi8 dod\p[mi16 re dod8 si]\mbreak

    %28
    la[la'] mi la, re sold, la la'
    mi[sold16 fad mi8 mi] mi mi mi mi
    mi4 r8 sol,! fad[fad'16 mi fad8 fad,]

    %31
    r fad'16[mi fad8 fad,] r fad' sold lad\mbreak
    fad fad fad fad fad4 r
    mi8 r mi r mi mi mi mi

    %34
    fad r fad r fad fad fad fad
    si, r si r mi mi mi mid
    fad fad fad fad\mbreak fad fad fad fad

    %37
    fad, fad fad fad fad fad fad fad
    fad fad fad fad fad fad fad fad
    re' mi fad sol dod, fad fad fad

    %40
    fad[re16 mi fad8 mi] re4 r\mbreak
    si' la8 sol si,4 r8 red
    si[sol16\p la si8 sol] la4 r8 dod

    %43
    la[fad'16\f sol la8 sol] fad4 si
    mi,8[dod16 re mi8 dod] r re16\p[mi fad8 mi]
    re la re[dod] re,[re'16 mi fad8 re]

    %46
    la si dod la re,[re'16 mi fad8 mi]\mbreak
    re4. re8 re, re' si[sol]
    mi'4. mi8 mi, mi' dod[la]

    %49
    r la16[si dod8 la] re la' la la
    la4 r8 fad, sol sol sol sol
    sol sol sol sol\mbreak la la la la

    %52
    la la la la si si si si
    si si si si dod dod dod dod
    re re re re fad fad mi mi

    %55
    re\pp re dod dod\mbreak si\p si la la
    sol\pp sol fad fad la' sol fad si
    mi, dod re mi la,4 dod

    %58
    \once\stemUp la8 re' la[fad] re4 r\mbreak
    la\f r fad'8 la la la
    fad la la la dod la\p la la

    %61
    dod la\f la la la la la la
    r re, la' la la4 la\mbreak
    fad1\fermata

}

IIIsopranon = \relative do'' {

    \autoBeamOff
    R1*12
    re4 fad,~fad8 sol la si
    si4 la8 re mi16 [re dod si la8] sol
    sol4\tr fad re' mi8 fad

    %16
    mi \appoggiatura re dod \appoggiatura si la dod re2\tr
    dod4 r mi mi,\mbreak
    fad4~fad16 [la sol fad] re'4~re16 [dod si la]

    %19
    sold4~sold16 [si la sold] mi'4~mi16[ re dod si]
    la4~la16 [dod si la] fad'4~fad16 [mi re dod]
    si8 mi, r mi mi sold sold si\mbreak

    %22
    si[dod] dod[re] re4. dod16[si]\mbreak
    dod[la dod re] mi[dod si la] la'8[sold16 fad] mi[re] dod[si]
    dod8[si16 la] si4\tr la r

    %25
    R1*2
    r2 mi'4 la,~

    %28
    la8 dod re mi fad4 mi8 la,
    sold16 [mi] re'4(si8) dod[si] la4
    r8 dod re mi lad,4. sold16 [fad]

    %31
    dod'4. si16 [lad?] sold'8  fad16 [mi] re8 dod\mbreak
    re16[dod] si8 r4 fad' fad,
    sol16 [sol la sol] si [si dod si]  mi [re mi re] mi[re dod si]

    %34
    lad[lad si lad] dod[dod re dod] fad[mi fad mi] fad[mi re dod]
    si[si dod si] re[re mi re] sol[fad sol fad] mi[re dod si]
    lad8 fad r fad\mbreak mi'8 mi16 mi mi8 mi

    %37
    mi8\tr [re16 dod] re8\tr [dod16 si] dod8\tr [si16 lad] si8 [re]
    mi8\tr [re16 dod] re8\tr [dod16 si] dod8\tr [si16 lad?] si8 si
    fad' mi16 re dod [si] lad [sol] fad8 si16 dod dod4\tr

    %40
    si4 r r2\mbreak
    R1*3
    r2 re4 fad,~
    fad8 sol la si si4\tr la8 re

    %46
    mi16 [re dod si la8] sol sol4 fad\mbreak
    r8 la si do do\tr si16 [la] si4~
    si8 si dod? re re\tr dod16 [si] dod8 mi

    %49
    sol,2\tr fad4 r
    re re' si~si16[la sol fad]
    mi8 si'4 mi8\mbreak dod4~dod16[si la sol]

    %52
    fad8 dod'4 fad8 re4~re16 [dod si la]
    sol8 re'4 sol8 mi16 [re dod si] la8 sol
    sol8. fad16 fad4 r re

    %55
    fad la\mbreak re4~re16[mi re mi]
    re4~re16[mi re mi] re[mi fad sol] la8[re,]
    dod16 [re mi re] dod [si la sol] fad8 mi16 re mi4\tr

    %58
    re8 re' la fad re[mi16 fad sol la si dod]\mbreak
    re[la si dod] re [mi fad sol] la8 re, mi4\tr
    re r r2

    %61
    R1*3

}

IIItestoI = \lyricmode {

    Vir -- gam virtu - tis tuae _ virtu - tis tuae _ e -- mittet _ Domi - nus ex Si -- on:

    do -- mi -- na - - - - - - re in me -- dio _ i -- ni -- mi -- co - - - - rum tu -- o - rum!

    Vir -- gam virtu - tis tuae _ vir -- tu -- tis tu -- ae e -- mittet _ Do - - - - mi -- nus ex Si -- on:

    do -- mi -- na - - - - - - - - - - - - re in me -- dio_i - ni -- mi -- co - - - - - - rum

    in me -- dio_i - ni -- mi -- co -- rum tu -- o -- rum!

    Vir -- gam virtu - tis tuae _ vir -- tu -- tis tu -- ae e -- mittet _ Do -- mi -- nus

    e -- mittet _ Do -- mi -- nus ex Si -- on:

    do -- mi -- na - - - - - - - - - - - - re in me -- dio _ i -- ni -- mi -- co - - - - - - rum

    tu -- o -- rum i -- ni -- mi -- co - - rum tu -- o -- rum!

}

IIIbcn = \relative do {

    r8 re16[mi fad8 mi] re la re dod
    re,[re'16\p mi fad8 mi] re re' sol, re
    mi[la,16\f si dod8 si] la la' dod, la

    %4
    re, [re'16\p mi fad8 mi] re re' sol, sold
    la[la,16\f si dod8 la] re la' fad re
    sol,[sol'16\p la si8 la] sold si sold mi\mbreak

    %7
    la[la,16\f si dod8 si] la mi' dod la
    re[re16\p mi fad8 re] la[re16 mi fad8 re]
    la[re16 mi fad8 re] re'\f re dod dod

    %10
    si\p si la la sol\f sol fad fad
    mi\p mi re re la4\f r8 re
    la'4 la, re, r\mbreak

    %13
    R1*4
    la'8\p la' mi\f dod la si dod la\mbreak
    R1*3

    %21
    mi'8 mi re re dod dod si si
    la la sold sold fad fad mi mi\mbreak
    la4 r la8\f re sold, mi

    %24
    la la' mi mi, la[la16 si dod8 si]
    la mi' la, sold la la' sold sold
    fad\p fad mi mi la,\f re sold, mi

    %27
    la la' mi mi, la4 r\mbreak
    R1
    r2 la8\f la' mi dod

    %30
    la4 r r2
    R1\mbreak
    si8 si' fad re si dod re si

    %33
    mi r mi, r r2
    fad'8 r fad, r r2
    si'8 r si, r r2

    %36
    R1*3
    si8\f dod re mi fad[re16 mi fad8 fad,]
    si[si16 dod re8 dod] si mi si lad\mbreak

    %41
    si si' fad mi red si mi si
    mi,[mi'16\p fad sol8 mi] dod la re la
    re,[re'16\f mi fad8 mi] re re' sol, sold

    %44
    la[la,16 si dod8 la] r2
    R1*4
    r2 re8 re' la fad

    %50
    re mi fad re r2
    R1*3
    r2 re'8 re dod dod

    %55
    si si la la\mbreak sol sol fad fad
    mi mi re re re mi fad sol
    la la, si[dod] re re, la'' la,

    %58
    re re' la fad re4 r\mbreak
    re\f r re'8[re,] la' la,
    re re' fad, re la [re16\p mi fad8 re]

    %61
    la[re16\f mi fad8 la,] re re' fad, re
    r sol dod, la re re, la''[la,]\mbreak
    re1\fermata

}

IIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown
    s1*33
    <_+>1
    s1*5
    s2 s4 s8 <7>

}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 50
    s1*63
    \bar "|."

}

IIIvlI = {
    \notypeset
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \clef alto
    <<\IIIvlan \forma>>

}

IIIsoprano = {
    \new Voice = "virgam1"
    <<\IIIsopranon \forma>>
}

IIIbc = {
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IVvlIn = \relative do'' {

    sol'8^\markup\italic"Sempre piano"
    si,[si si do]
    re[re re sol]
    do,[do do re]

    %4
    si[si si do]
    re[re re sol]
    do,[do do si]

    %7
    la4 r8 si'
    do16 si la4 do8
    si16 do re4 si8\mbreak

    %10
    do16 si la4 do8
    si16 do re8 r la,
    re,[re re mi]

    %13
    fad[fad fad sol]
    la[la la si]
    do[do do si16 la]

    %16
    si\f sol si do re si re sol
    si8[sol si, la]
    sol [sol,\p sol sol]

    %19
    sol[sol sol sol]\mbreak
    sol[sol sol sol]
    re'[re sol, sol]

    %22
    do[do re re]
    re'[re re mi]
    re[re re sol,]

    %25
    fad16 sol la4 si8
    la16 si do4 re8
    do16 re mi4 do8

    %28
    si [do16 re do8 si]\mbreak
    si4\tr la
    si8[si si do]

    %31
    re[re re mi]
    fa[fa mi re]
    do[la la si]

    %34
    do[do do re]
    mi[mi re do]
    si[si si si]

    %37
    sol[sol sol la]\mbreak %% fine p 30
    si[si si do]
    re[re re mi]

    %40
    fa4 mi16[re do si]
    do [si do re mi8] r
    mi8[(do) re(si)]

    %43
    do[(la) si(sold)]
    mi'[(do) re(si)]
    do16[si do re mi8] r

    %46
    mi\f re16 do si8 mi
    do[do do re]
    mi\p[mi mi la]

    %49
    re,[re re mi]
    do16\f la do re mi do mi sold
    la8[mi do si]

    %52
    la [la,\p la la]
    la[la la la]\mbreak
    la[la la la]

    %55
    mi'[mi la, la]
    re[re mi mi]
    la,[la' la si]

    %58
    do[do do re]
    mi[mi mi fad]
    sol[mi re dod]

    %61
    re[re re re]\mbreak
    si[si si si]
    si[si si dod]

    %64
    dod?[dod dod dod]
    si[si si dod]
    re[re re mi]

    %67
    fad mi16 re mi8 re16 dod?
    re [dod re mi fad8] r
    fad mi16 re mi8 dod\mbreak

    %70
    si[si si dod]
    re[re re mi]
    fa2~

    %73
    fa?8 [fa mi re]
    do?[la si do]
    do[do do re]

    %76
    mi2~
    mi4 re16 do si la\mbreak
    si8[si si si]

    %79
    sol[sol sol la]
    si[si si do]
    re[re re mi]

    %82
    do[do do re]
    si16 la si do re8 r
    re do16 si do8 la

    %85
    sol[si si do]\mbreak
    re[(si) do(la)]
    si[(sol) la(fad)]

    %88
    re'[(si) do(la)]
    si16 [la si do re8] r
    re\f[do16 si do8 la]

    %91
    si[si si do]
    re\p[re re sol]
    do,[do do re]

    %94
    si[si si re]\mbreak
    re,[re re mi]
    fad[fad fad sol]

    %97
    la[la la si]
    do16\f la do fad la do, si la
    si8[sol' si, la]

    %100
    sol2\fermata

}

IVvlIIn = \relative do'' {

    re8_\markup\italic"Sempre piano"
    sol,[sol sol la]
    si[si si si]
    la[la la la]

    %4
    sol[sol sol la]
    si[si si si]
    la[la la sol]

    %7
    fad4 r8 sol'
    la16 sol fad4 la8
    sol16 la si4 sol8\mbreak

    %10
    la16 sol fad4 la8
    sol16 la si8 r4
    r r8 la,

    %13
    re,[re re mi]
    fad[fad fad sol]
    la[la la sol16 fad]

    %16
    sol\f re sol la si sol si re
    sol8[si, sol fad]
    sol [sol,\p sol sol]

    %19
    sol[sol sol sol]\mbreak
    sol[sol sol sol]
    re'[re sol, sol]

    %22
    do[do re re]
    si'[si si do]
    si[si si si]

    %25
    r4 re8 sol,  %% con il 2.o
    fad16[sol] la4 si8
    la16[si] do4 la8

    %28
    sol [la16 si la8 sol]\mbreak
    sol4\tr fad
    R2

    %31
    si8[si si do]
    re[re do si]
    la4 r

    %34
    la8[la la si]
    do[do si la]
    sol[re re re]

    %37
    R2\mbreak
    sol8[sol sol la]
    si[si si do]

    %40
    re4 do16[si la sold]
    la[sold? la si do8] r
    R2

    %43
    mi8[(do) re(si)]
    do[(la) si(sold)]
    la16 [sold la si do8] r\mbreak

    %46
    do\f si16 la fa'8 sold,
    la[la la si]
    do\p[do do do]

    %49
    si[si si sold]
    la16\f mi la si do la do mi
    do8[do la sold]

    %52
    la [la,\p la la]
    la[la la la]\mbreak
    la[la la la]

    %55
    mi'[mi la, la]
    re[re mi mi]
    la,4 r

    %58
    la'8[la la si]
    dod[dod dod re]
    mi[do si lad]

    %61
    fad[fad fad fad]\mbreak
    sol[sol sol sol]
    sol[sol sol sold]

    %64
    lad[lad lad lad]
    si[si si dod]
    fad[fad fad mi]

    re[dod16 si] dod8[si16 lad]

    %68
    si[lad si dod re8] r
    re[dod16 si] dod8 lad\mbreak
    si4 r

    %71
    si8[si si do]
    re2~
    re8[re do si]

    %74
    la4 r
    la8[la la si]
    do2~

    %77
    do4 si16 la sol fad\mbreak
    sol8[sol sol sol]
    R2

    %80
    sol8[sol sol la]
    si[si si do]
    la[la la la]

    %83
    sol16[fad sol la si8] r
    si[la16 sol] la8 fad
    sol[sol sol la]\mbreak

    %86
    si4 r
    re8[(si) do(la)]
    si[\parentSlur(sol) la\parentSlur (fad)]

    %89
    sol16[fad sol la si8] r
    si\f[la16 sol la8 fad]\mbreak
    sol[sol sol la]

    %92
    si\p[si si si]
    la[la la la]
    sol[sol sol] r\mbreak

    %95
    r4 r8 la
    re,[re re mi]
    fad[fad fad sol]

    %98
    la16\f fad la do fad la, sol fad
    sol8[si sol fad]
    sol2\fermata

}

IVvlan = \relative do' {

    sol'8_\markup\italic"Sempre piano"
    sol[sol sol re]
    sol[sol sol sol]
    la[re, re re]

    %4
    sol,[sol sol re']
    sol[sol sol sol]
    la[re, re sol,]

    %7
    re'[re re re]
    re[re re re]
    re[re re re]\mbreak

    %10
    re[re re re]
    re[re re re]
    re[re re re]

    %13
    re[re re re]
    re[re re re]
    re[re re re]

    %16
    re\f[re re re]
    re[re re re]
    si8 [sol\p sol sol]

    %19
    sol[sol sol sol]\mbreak
    sol[sol sol sol]
    re'[re sol, sol]

    %22
    do[do re re]
    sol[sol sol sol]
    sol[sol sol sol]

    %25
    re[re re re]
    re[re re re]
    re[re re re]

    %28
    re[re re re]\mbreak
    re[re re re]
    sol[sol sol sol]

    %31
    sol[sol sol sol]
    sol[sol sol sol]
    la[la, la la]

    %34
    fad'[fad fad fad]
    fad[fad fad fad]
    sol[sol, sol sol]

    %37
    sol[sol sol re']\mbreak
    sol,[sol sol re']
    sol,[sol sol sol]

    %40
    sold[sold sold mi']
    la,[la la la]
    la[la re mi]

    %43
    la,[la re mi]
    la,[la re mi]
    la,[la la la]\mbreak

    %46
    la8\f[la re mi]
    la,[la la mi']
    la,\p[la la la]

    %49
    mi'[mi mi mi]
    la,\f[la la la]
    mi'[mi mi mi]

    %52
    do[la\p la la]
    la[la la la]\mbreak
    la[la la la]

    %55
    mi'[mi la, la]
    re[re mi mi]
    la,2

    %58
    la'8[la la sol]
    fad[fad fad fad]
    fad[fad fad fad]

    %61
    si,[si si si]\mbreak
    mi[mi mi mi]
    mi[mi mi mid]

    %64
    fad[fad, fad fad]
    si[si si fad']
    si,[si si si]

    %67
    si[si mi fad]
    si,[si si si]
    si[si mi fad]\mbreak

    %70
    si,[si si si]
    si[si si la]
    sold[sold sold sold]

    %73
    sold?[sold sold mi']
    la,[la la la]
    la[la la sol?]

    %76
    fad[fad fad fad]
    fad[fad fad re']\mbreak
    sol,[sol sol sol]

    %79
    sol[sol sol re']
    sol,[sol sol re']
    sol,[sol sol do]

    %82
    re[re re fad]
    sol,[sol sol sol]
    sol[sol do re]

    %85
    sol,[sol sol re']\mbreak
    sol,[sol do re]
    sol,[sol do re]

    %88
    sol,[sol do re]
    sol,[sol sol sol]
    sol\f[sol do re]

    %91
    sol,[sol sol re']
    sol,\p[sol sol sol]
    la[la fad' fad]

    %94
    sol[sol, sol sol]\mbreak
    re'[re re re]
    re[re re re]

    %97
    re[re re sol]
    fad\f[fad fad fad]
    re[re re re]

    %100
    si2\fermata

}

IVtenoren = \relative do' {

    \autoBeamOff

    r8
    R2*17
    sol4 si8 re
    mi8. mi16 re8 si\mbreak

    %20
    do4\tr si8 sol
    la4\tr sol8 re'
    mi re do4\tr

    %23
    si r
    r re8 sol,
    fad16[sol] la4 si8

    %26
    la16[si] do4 re8
    do16[re] mi4 do8
    si do16[re] do8 si\mbreak

    %29
    si4\tr la
    r r8 re
    re8. sold,16 sold4

    %32
    fa' mi16[re] do[si]
    do8. si16 la4
    R2*3

    %37
    sol8[sol sol la]\mbreak
    si[si si do] %38  fine p 30
    re[re re mi]

    %40
    fa4 mi16[re do si]
    do[si] do[re] mi8 r
    mi16[do si do] re[si la si]

    %43
    do[la sol la] si[sold fad sold]
    mi'[do si do] re[si la si]
    do[si] do[re] mi8 r\mbreak

    %46
    mi8[re16 do] re8 si
    la4 r
    R2*4

    %52
    la4 do8 mi
    fa8. fa16 mi8 do\mbreak
    re4\tr do8 la

    %55
    si4\tr la8 mi'
    fa mi re4
    do r

    %58
    mi mi
    mi2~
    mi8 mi re dod

    %61
    re16[dod] re8 r fad?\mbreak
    sol,8. sol16 sol4
    sol'16[fad mi re] dod8 si

    %64
    si8. lad16 lad4
    si8[si si dod]
    re[re re mi]

    %67
    fad[mi16 re] mi8[re16 dod?]
    re[dod] re[mi]  fad8 r
    fad[mi16 re] mi8 dod\mbreak

    %70
    si4 r
    r r8 re
    re8. sold,16 sold4

    %73
    fa' mi16[re] do?[si]
    do8. si16 do4
    r r8 do

    %76
    do8. fad,16 fad4
    mi' re16[do] si[la]\mbreak
    si8. la16 si4

    %79
    sol8[sol sol la]
    si[si si do]
    re[re re mi]

    %82
    do[do do re]
    si16[la] si[do] re8 r
    re[do16 si] do8 la

    %85
    sol4 r\mbreak
    re'16[si la si] do[la sol la]
    si[sol fad sol] la[fad mi fad]

    %88
    re'[si la si] do[la sol la]
    si[la] si[do] re8 r
    re[do16 si] do8 \parenthesize la

    %91
    sol4 r
    R2*9

}

IVtestoI = \lyricmode {

    Te -- cum prin -- cipi - um in di -- e in di -- e vir -- tutis _ tu -- æ in splen -- do  - - - - - - - - - ribus _

    San -- cto -- rum ex u -- tero _ an -- te Lu -- cife - rum ge - - - - - nui _

    ge - - - - - - nui _ ge -- nui _ te.

    Te -- cum prin -- cipi - um in di -- e in di -- e vir -- tutis _ tu -- æ in splen -- do  -- ribus _

    San -- cto -- rum ex u -- tero _ an -- te Lu -- cife - rum ge - - - - nui _

    ge -- nui _ te ex u -- tero _ an -- te Lu -- cife - rum ex u -- tero _ an -- te Lu -- cife - rum

    ge - - - - nui _ ge -- nui _ te ge - - - - - - nui _ ge -- nui _ te.

}

IVtenoreIn = \relative do' {

    \autoBeamOff
    r8
    R2*18
    sol4 si8 re
    mi8.\tr mi16 re8 si

    %21
    do4\tr si8 si
    do si la4\tr
    sol r

    %24
    R2
    r4 re'8 sol,
    fad16[sol] la4 si8

    %27
    la16[si] do4 la8
    sol la16[si] la8 sol\mbreak
    sol4\tr fad

    %30
    R2*3
    r4 r8 do'
    do8. fad,16 fad4

    %35
    mi'4 re16[do] si[la]
    si8. la16 sol4
    R2

    %38
    sol8[sol sol la]
    si[si si do]
    re4 do16[si la sold]

    %41
    la[sold?] la[si] do8 r
    R2
    mi16[do si do] re[si la si]

    %44
    do[la sol la] si[sold fad sold]
    la[sold] la[si] do8 r\mbreak
    do[si16 la] si8 sold?

    %47
    la4 r
    R2*5
    la4 do8 mi\mbreak

    %54
    fa8. fa16 mi8 do
    re4\tr do8 do
    re do si4\tr

    %57
    la r
    do do
    dod2~

    %60
    dod8 dod si lad
    si16[lad] si8 r4\mbreak
    R2*3

    %65
    re8[re re mi]
    fad[fad fad mi]
    re[dod16 si] dod8[si16 lad]

    %68
    si[lad] si[dod] re8 r
    re[dod16 si] dod8 lad\mbreak
    si4 r

    %71
    r r8 si
    si8. si16 si4
    re do16[si] la[sold]

    %74
    la8. sold16 la4
    r r8 la
    la8. la16 la4

    %77
    do si16[la] sol[fad]\mbreak
    sol8. fad16 sol4
    R2

    %80
    sol8[sol sol la]
    si[si si do]
    la[la la la]

    %83
    sol16[fad] sol[la] si8 r
    si[la16 sol] la8 fad
    sol4 r\mbreak

    %86
    R2
    re'16[si la si] do[la sol la]
    si[sol fad sol] la[fad mi fad]

    %89
    sol[fad] sol[la] si8 r
    si[la16 sol] la8 fad
    sol4 r

    %92
    R2*9

}

IVtestoII = \lyricmode {

    Te -- cum prin -- cipi - um in di -- e vir -- tutis _ tu -- æ in splen -- do  - - - - - - ribus _

    San -- cto -- rum ex u -- tero _ an -- te Lu -- cife - rum ge - - - - nui _

    ge - - - - nui _ ge -- nui _ te.

    Te -- cum prin -- cipi - um in di -- e vir -- tutis _ tu -- æ in splen -- do  -- ribus _

    San -- cto -- rum ge - - - - nui _

    ge -- nui _ te ex u -- tero _ an -- te Lu -- cife - rum ex u -- tero _ an -- te Lu -- cife - rum

    ge - - - nui _ ge -- nui _ te ge - - - - nui _ ge -- nui _ te.

}

IVbcn = \relative do {

    r8_\markup\italic"Sempre piano"
    sol4 r
    sol r
    re' r

    %4
    sol, r
    sol r
    re' r

    %7
    re r
    re r
    sol, r\mbreak

    %10
    re' r
    sol, r
    re' r

    %13
    re r
    re r
    re r

    %16
    sol8\f [sol, sol sol]
    sol[sol' re re,]
    sol4 r

    %19
    sol\p r\mbreak
    sol r
    re' r8 sol,

    %22
    do r re r
    sol,4 r
    sol r

    %25
    re' r
    re r
    re r

    %28
    sol, r\mbreak
    re' re,
    sol' r

    %31
    sol r
    sol r
    la, r

    %34
    fad! r
    fad r
    sol r

    %37
    sol r\mbreak
    sol r
    sol r

    %40
    sold r
    la r
    la r

    %43
    la r
    la r
    la r\mbreak

    %46
    la8\f[la re mi]
    la,4 r
    la\p r

    %49
    mi' r
    la,8\f[la la la]
    la[la mi' mi,]

    %52
    la4 r
    la\p r\mbreak
    la r

    %55
    mi' r
    re8 r mi r
    la,4 r

    %58
    la r
    fad' r
    fad r

    %61
    si, r\mbreak
    mi r
    mi r

    %64
    fad r
    si, r
    si r

    %67
    si r
    si r
    si8[si mi fad]\mbreak

    %70
    si,4 r
    si r
    sold r

    %73
    sold? r
    la r
    la r

    %76
    fad r
    fad r\mbreak
    sol r

    %79
    sol r
    sol r
    sol r

    %82
    re' r
    sol, r
    sol8[sol do re]

    %85
    sol,4 r\mbreak
    sol r
    sol r

    %88
    sol r
    sol r
    sol8\f[sol do re]

    %91
    sol,4 r
    sol\p r
    la r

    %94
    sol r\mbreak
    re' r
    re r

    %97
    re r
    re8\f[re re re]
    sol[sol re' re,]

    %100
    sol,2\fermata

}

IVbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    \key sol\major
    \tempo 2 = 60
    \partial 8 s8
    s2*100
    \bar "|."

}

IVvlI = {
    \notypeset
    <<\IVvlIn \forma>>

}

IVvlII = {
    <<\IVvlIIn \forma>>

}

IVvla = {
    \clef alto
    <<\IVvlan \forma>>

}

IVtenore = {
    \new Voice = "tecum1"
    <<\IVtenoren \forma>>
}

IVtenoreI = {
    \new Voice = "tecum2"
    <<\IVtenoreIn \forma>>
}

IVbc = {
    \clef bass
    <<\IVbcn \forma \IVbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



VvlIn = \relative do'' {

    R2.*3
    sol'2.
    sol

    %6
    sol
    mi4. re8 do4\mbreak
    do' si8 la sol fa

    %9
    mi[re mi do mi fad]
    sol4 sol, r
    sol si re

    %12
    sol sol, r
    do mi sol
    do do, r

    %15
    do'8 si la sol fa mi\mbreak
    re2.
    si'8[la sol fa mi re]

    %18
    do2.
    la'8[sol fad mi re do]
    si4 re sol

    %21
    si la2
    si4 la la
    sol8 la fad2\parenthesize \tr

    %24
    sol r4\mbreak
    R2.
    re'

    %27
    re
    re
    si4. la8 sol4

    %30
    fad8 mi fad sol la fad
    sol4 la fad
    sol r r

    %33
    R2.*8
    \parenthesize do,2.

    %42
    do
    do
    si4. la8 sol4

    %45
    r si8 do re do
    re[do re si do re]
    mi4 la, fad'

    %48
    sol sol, r
    sol'8 fa! mi re do si\mbreak
    la4 do mi

    %51
    fa8[mi re do si la]
    sol4 si re
    mi8[re do si la sol]

    %54
    fa4 la do
    re8[do re mi fa re]
    mi[re mi fa sol mi]

    %57
    re[do re mi fa re]
    mi4 re do\mbreak
    sib2.

    %60
    la4 si? do
    do si2
    do2. %% fine do maggiore

    %63
    do4\p do do
    re re re
    mi mi mi

    %66
    fa fa, fa
    fa' fa fa\mbreak
    fa mib8 re mib4

    %69
    fa mib re
    mib8 re mib do re la
    sib4 r r

    %72
    R2.*6
    re4 re re
    mib mib mib

    %80
    mib mib mib
    re re re
    re re re\mbreak

    %83
    do do do
    do do do
    re2.

    %86
    mib
    fa
    sol4 sol, mib'

    %89
    re re re\mbreak
    fa mib re
    mib mib mib

    %92
    sol2.\f
    sol
    sol
    sol4. fa8 mi4

    %96
    mi re4. re8
    mi2.\fermata

}

VvlIIn = \relative do'' {

    do2.
    do
    do

    %4
    si4. la8 sol4
    sol' fa8 mi re do
    si[la si sol la si]

    %7
    do4 do, r\mbreak
    do mi sol
    do do, r

    %10
    sol' si re
    si sol r
    R2.*2

    %14
    sol'8 fa mi re do si
    la2.\mbreak
    fa'8[mi re do si la]

    %17
    sol2.
    mi'8[re do si la sol]
    fad2.

    %20
    sol8[fad sol la si do]
    re[do re mi fad re]
    sol4 fad8[mi re do]

    %23
    si do la2\tr
    sol' 2.\mbreak
    sol

    %26
    sol
    fad4. mi8 re4
    fad8 mi fad re mi fad

    %29
    sol fad sol la si sol
    la sol la si do la
    si4 do la

    %32
    sol r r
    R2.*5
    sol2.

    %39
    sol
    sol
    mi4. re8 do4 \mbreak  %%% fine p 43

    %42
    R2.
    re4. re8 re re
    re do re mi fa re

    %45
    sol2.
    fa
    mi2 re4~

    %48
    re8 do re si do re
    mi fa! sol4 r\mbreak
    do8 si la sol fa mi

    %51
    re4 fa la
    si8 la sol fa mi re
    do4 mi sol

    %54
    la8 sol fa  mi re do
    si4 r r
    sol'2.

    %57
    sol
    sol\mbreak
    mi8 fa sol fa sol mi

    %60
    fa4 sol2
    la4 sol2
    sol2.

    %63
    do,4\p do do
    do do do
    sib sol sol

    %66
    lab lab lab
    do do do\mbreak
    re do8 si do4

    %69
    do do si
    do8 si do la la fad
    re4 r r

    %72
    R2.
    la'4 la la
    sol sol sol\mbreak

    %75
    sol sol sol
    fad fad sol
    sol sol fad

    %78
    sol r r
    sol sol sol
    lab lab lab

    %81
    fa fa fa
    sol sol sol\mbreak
    mib mib mib

    %84
    fa fa fa
    si2.
    do

    %87
    re
    mib4 mib, do'
    si si do\mbreak

    %90
    re do si
    do do do
    si8\f do re do re si

    %93
    do4. sol8 sol4
    si8 do re do re si
    do4. do8 do4

    %96
    do do si
    do2.\fermata

}

Vvlan = \relative do' {

    R2.*6
    do2.\mbreak
    do
    do

    %10
    si4. la8 sol4
    sol' fa8 mi re do
    si[la si sol la si]

    %13
    do4 do, r
    mi'8 re do si  la sol
    fa2.\mbreak

    %16
    re'8[do si la sol fa]
    mi2.
    do'8[si la sol fad mi]

    %19
    re2.
    si'8[la si do re do]
    si[la si do] re4

    %22
    re re re
    re8 mi re2
    si'8 la si do re si\mbreak

    %25
    mi, re mi fa sol mi
    si' la si do re si
    la si la sol la4

    %28
    la8 sol la fad sol la
    si4 re,2~
    re4 fad re~

    %31
    re mi re
    si r r
    R2.*2

    %35
    do2.
    do

    %37
    do
    si4. la8 sol4
    si8 la si do re do

    %40
    si[la si do re si]
    do[si do re] mi4\mbreak
    mi8[fa mi re do si]

    %43
    la[sol la fad sol la]
    si4 si2
    r4 re8 do si la

    %46
    si[la si sol la si]
    do[si do sol la si]
    si[la si sol la si]

    %49
    do4 do8 si la sol\mbreak
    fa4 la do
    re8[do si la sol fa]

    %52
    mi4 sol si
    do8[si la sol fa mi]
    re4 fa la

    %55
    si8[la si do re si]
    do[si do re mi do]
    si[la si do re si]

    %58
    do[si do re mi re]\mbreak
    do2.~
    do4 re mi

    %61
    re re2
    mi2.
    mib4\p mib mib

    %64
    fa fa fa
    sol do, do
    fa fa fa

    %67
    lab lab lab\mbreak
    sol sol do,
    fa sol sol,

    %70
    do fad fad,
    sol r r
    re' re re

    %73
    re re re
    re do do\mbreak
    do do do

    %76
    do do sib
    sib la la
    sib r r

    %79
    do do do
    do do do
    sib sib sib

    %82
    sib sib sib\mbreak
    lab lab lab
    lab? lab lab

    %85
    sol sol' sol
    sol sol sol
    sol sol sol

    %88
    sol do, sol
    sol sol sol\mbreak
    lab sol sol

    %91
    sol' sol sol
    re8\f mi re4 re

    %93
    mi8[re mi fa sol mi]
    re2.
    mi4. sol,8 sol4

    %96
    la re sol,
    sol2.\fermata

}

Vsopranon = \relative do'' {

    \autoBeamOff

    do2.
    do
    do

    %4
    si4. la8 sol4
    sol' fa8[mi] re do
    si[la si sol] la[si]

    %7
    do4 do, r\mbreak
    do mi sol
    do do, r

    %10
    sol' si re
    si sol r
    R2.*2

    %14
    sol'8 fa mi[re] do[si]
    la2.\mbreak
    fa'8[mi re do si la]

    %17
    sol2.
    mi'8[re do si la sol]
    fad2.

    %20
    sol8[fad sol la si do]
    re[do re mi fad re]
    sol4 fad8[mi re do]

    %23
    si do la2\tr
    sol r4\mbreak
    R2.*7

    %32
    r4 si8 do re si
    do[si do re mi do]\mbreak
    si[la si do] re[si]

    %35
    do4 sol r
    R2.
    sol'4 fa8[mi] re[do]

    %38
    re4 sol, r
    R2.*2
    do2.\mbreak

    %42
    do
    do
    si4. la8 sol4

    %45
    r si8 do re do
    re[do re si do re]
    mi4 la, fad'

    %48
    sol sol, r
    sol'8 fa! mi[re] do[si]\mbreak
    la4 do mi

    %51
    fa8[mi re do si la]
    sol4 si re
    mi8[re do si la sol]

    %54
    fa4 la do
    re8[do re mi fa re]
    mi[re mi fa sol mi]

    %57
    re[do re mi fa re]
    mi4 re do\mbreak
    sib2.

    %60
    la4 si? do
    do si2
    do2. %% fine do maggiore

    %63
    do4\solo do do
    re re2
    mi4 mi2

    %66
    fa4 fa,2
    fa'4 fa fa\mbreak
    fa4 mib8[re] mib4

    %69
    fa mib(re8\tr) do\noBeam
    do2 r4
    R2.*7

    %78
    re4 re re
    mib2.~
    mib

    %81
    re~
    re\mbreak
    do4. do8 do do

    %84
    do2 do4
    si8[do] re4 si
    do8[re] mib4 do

    %87
    re8[mib] fa4 re
    mib8[fa] sol4 mib
    re4. re8 mib4\mbreak

    %90
    fa mib (re8\tr) do
    do2 r4
    si8\f [do] re[do] re[si]

    %93
    do4. sol8 sol4
    si8[do] re[do] re[si]
    do4. do8 do4

    %96
    do do re
    do2.\fermata

}

VtestoI = \lyricmode {

    Ju -- ra -- vit Domi - nus et non pæni - te -- bit eum: _

    non pæni - te -- bit  non pæni - te -- bit et non pæni - te - - - - - - - - - bit e -- um

    et non pæni - te - bit e -- um non pæni - te -- bit.

    Ju -- ra -- vit Domi - nus et non pæni - te - - bit  eum _ et non pæni - te - - - - - - - - - - - - - - - - - - - -  bit e -- um.

    Tu es sa -- cer -- dos in æ -- ter -- num secun - dum or -- dinem _  Melchi - se -- dech.

    Tu es sa -- cer - - dos in æ -- ter -- num secun - dum or - - - - - - - - - di -- nem Mel -- chi  -- se -- dech

    secun - dum or -- dinem _  secun - dum or -- dinem _ Melchi - se -- dech.

}

VsopranoIn = \relative do'' {

    \autoBeamOff

    do2.
    do
    do

    %4
    si4. la8 sol4
    sol' fa8[mi] re do
    si[la si sol] la[si]

    %7
    do4 do, r\mbreak
    do mi sol
    do do, r

    %10
    sol' si re
    si sol r
    R2.*2

    %14
    sol'8 fa mi[re] do[si]
    la2.\mbreak
    fa'8[mi re do si la]

    %17
    sol2.
    mi'8[re do si la sol]
    fad2.

    %20
    sol8[fad sol la si do]
    re[do re mi fad re]
    sol4 fad8[mi re do]

    %23
    si do la2\tr
    sol r4\mbreak
    R2.*7

    %32
    r4 si8 do re si
    do[si do re mi do]\mbreak
    si[la si do] re[si]

    %35
    do4 sol r
    R2.
    sol'4 fa8[mi] re[do]

    %38
    re4 sol, r
    R2.*2
    do2.\mbreak

    %42
    do
    do
    si4. la8 sol4

    %45
    r si8 do re do
    re[do re si do re]
    mi4 la, fad'

    %48
    sol sol, r
    sol'8 fa! mi[re] do[si]\mbreak
    la4 do mi

    %51
    fa8[mi re do si la]
    sol4 si re
    mi8[re do si la sol]

    %54
    fa4 la do
    re8[do re mi fa re]
    mi[re mi fa sol mi]

    %57
    re[do re mi fa re]
    mi4 re do\mbreak
    sib2.

    %60
    la4 si? do
    do si2
    do2. %% fine do maggiore

    %63
    do4\solo do do
    do do2
    sib4 sib2

    %66
    lab4 lab2
    do4 do do\mbreak
    si4. si8 do4

    %69
    re do(si8\tr) do\noBeam
    do2 r4
    R2.*7

    %78
    re4 re re
    mib2.~
    mib

    %81
    re~
    re\mbreak
    do4. do8 do do

    %84
    do2 do4
    si8[do] re4 si
    do8[re] mib4 do

    %87
    re8[mib] fa4 re
    mib8[fa] sol4 mib
    re4. re8 mib4\mbreak

    %90
    fa mib (re8\tr) do
    do2 r4
    si8\f [do] re[do] re[si]

    %93
    do4. sol8 sol4
    si8[do] re[do] re[si]
    do4. do8 do4

    %96
    do do re
    do2.\fermata

}

Valton = \relative do' {

    \autoBeamOff
    R2.*3
    sol'2.
    sol

    %6
    sol
    mi4. re8 do4\mbreak
    do' si8[la] sol fa

    %9
    mi[re mi do] mi[fad]
    sol4 sol, r
    sol si re

    %12
    sol sol, r
    do mi sol
    do do, r

    %15
    do'8 si la[sol] fa[mi]\mbreak
    re2.
    si'8[la sol fa mi re]

    %18
    do2.
    la'8[sol fad mi re do]
    si4 re sol

    %21
    si la2
    si4 la la
    sol8 la fad2\parenthesize \tr

    %24
    sol r4\mbreak
    R2.*7
    r4 re8 mi fa re

    %33
    mi[re mi fa sol mi]\mbreak
    re[do re mi] fa[re]
    mi4 mi r

    %36
    do' si8[la] sol[fa]
    mi4 do r
    sol'2.

    %39
    sol
    sol
    mi4. re8 do4 \mbreak  %%% fine p 43

    %42
    R2.
    re4. re8 re re
    re [do re mi fa re]

    %45
    sol2.
    fa
    mi2 re4~

    %48
    re8 [do re si do re]
    mi [fa!] sol4 r\mbreak
    do8 si la [sol] fa [mi]

    %51
    re4 fa la
    si8 [la sol fa mi re]
    do4 mi sol

    %54
    la8 [sol fa  mi re do]
    si4 r r
    sol'2.

    %57
    sol
    sol\mbreak
    mi8 [fa sol fa sol mi]

    %60
    fa4 sol2
    la4 sol2
    sol2.

    %63
    R2.*10
    la4 la la
    sol sol sol8 sol\mbreak

    %75
    sol4 sol8 sol sol sol
    fad4. fad8 sol4
    sol sol fad

    %78
    sol2 r4
    sol sol sol
    lab8[sol] lab4 lab

    %81
    fa4. fa8 fa fa
    sol[fa] sol4 sol\mbreak
    mib4. mib8 mib mib

    %84
    fa[mib] fa2
    re8[mib] fa4 re
    mib8[fa] sol4 mib

    %87
    fa8[sol] lab4 fa
    sol2.~
    sol4. sol8 sol4\mbreak

    %90
    lab sol4. sol8
    sol2 r4
    sol2.\f

    %93
    sol
    sol
    sol4. fa8 mi4

    %96
    mi re4. re8
    mi2.\fermata

}

VtestoII = \lyricmode {

    Ju -- ra -- vit Domi - nus et non pæni - te -- bit eum: _

    non pæni - te -- bit  non pæni - te -- bit et non pæni - te  - - - - - - -  bit

    non pæni - te -- bit e -- um et non pæni - te - bit e -- um non pæni - te -- bit.

    Ju -- ra -- vit Domi - nus et non pæni - te - - - - - bit

    et non pæni - te - - - - - - - bit non pe -- ni -- te - bit e - um.

    Tu es sa -- cer -- dos in æ -- ter -- num secun - dum or -- dinem _  Melchi - se -- dech.

    Tu es sa -- cer -- dos sa -- cerdos _ in æ -- ter -- num

    sa -- cerdos _ in æ -- ter -- num

    se -- cun -- dum or - - - - - - dinem _  Melchi - se -- dech

    se -- cun -- dum or -- dinem _  Melchi - se -- dech.

}

Vtenoren = \relative do' {

    \autoBeamOff
    R2.*6
    do2.\mbreak
    do
    do

    %10
    si4. la8 sol4
    sol' fa8[mi] re do
    si[la si sol] la[si]

    %13
    do4 do, r
    mi'8 re do[si] la[sol]
    fa2.\mbreak

    %16
    re'8[do si la sol fa]
    mi2.
    do'8[si la sol fad mi]

    %19
    re2.
    si'8[la si do re do]
    si[la si do] re4

    %22
    re re re
    re8 mi re2
    si r4\mbreak

    %25
    R2.*10
    do2.
    do

    %37
    do
    si4. la8 sol4
    si8 la si[do] re[do]

    %40
    si[la si do re si]
    do[si do re] mi4\mbreak
    mi8[fa mi re do si]

    %43
    la[sol la fad sol la]
    si4 si2
    r4 re8 do si la

    %46
    si[la si sol la si]
    do[si do sol la si]
    si[la si sol la si]

    %49
    do4 do8 si la sol\mbreak
    fa4 la do
    re8[do si la sol fa]

    %52
    mi4 sol si
    do8[si la sol fa mi]
    re4 fa la

    %55
    si8[la si do re si]
    do[si do re mi do]
    si[la si do re si]

    %58
    do[si do re mi re]\mbreak
    do2.~
    do4 re mi

    %61
    re re2
    mi2.
    R2.*9

    %72
    re4 re re
    re re re8 re
    re4 do2\mbreak

    %75
    do4 do do
    do4. do8 sib4
    sib la4. la8

    %78
    sib2 r4
    do do do
    do2 do4

    %81
    sib2.
    sib\mbreak
    lab~

    %84
    lab
    sol
    do4 do, do

    %87
    si'4. si8 si4
    sol sol do
    si4. si8 do4\mbreak

    %90
    re do(si8\tr) do
    do2 r4
    re4\f re re

    %93
    mi8[re mi fa sol mi]
    re2.
    mi4. sol,8 sol4

    %96
    la re sol,
    sol2.\fermata

}

VtestoIII = \lyricmode {

    Ju -- ra -- vit Domi - nus et non pæni - te -- bit eum: _

    et non pæni - te - - - - - - bit  non pæni - te -- bit e -- um.

    Ju -- ra -- vit Domi - nus et non pæni - te - - - - - bit  %%% fin qui bar 44

    et non pæni - te - - bit et non pe -- ni -- te - - - - - - - - - - - - - - - - - bit e -- um.

    Tu es sa -- cer -- dos in æ -- ter -- num secun - dum or -- dinem _  Melchi - se -- dech.

    Tu es sa -- cer -- dos  in æ -- ter -- num

    se -- cun -- dum or -- dinem _ se -- cun -- dum or -- dinem _  Melchi - se -- dech

    se -- cun -- dum or - - dinem _  Melchi - se -- dech.

}

Vbasson = \relative do {

    \autoBeamOff
    R2.
    do'4 si8[la] sol fa
    mi[re mi do] mi[fad]

    %4
    sol4 sol, r
    sol si re
    sol sol, r

    %7
    do mi sol\mbreak
    mi do r
    R2.

    %10
    sol'2.
    sol
    sol

    %13
    mi4. re8 do4
    R2.
    la'8 sol fa[mi] re[do]\mbreak

    %16
    si2.
    sol'8[fa mi re do si]
    la2.

    %19
    fad'8[mi re do si la]
    sol4 sol'2~
    sol4 fad8[mi re do]

    %22
    si4 do re
    sol,8 do re2
    sol, r4\mbreak

    %25
    R2.*7
    sol'2.
    sol\mbreak

    %34
    sol
    mi4. re8 do4
    do mi sol

    %37
    do do, r
    sol si re
    sol sol, r

    %40
    sol'8 fa sol[la] si[sol]
    do4 do,2\mbreak
    do'8 re do[si] la[sol]

    %43
    fad[mi fad re mi fad]
    sol4 sol, r
    sol' sol, sol

    %46
    sol2.
    do2 r4
    sol' sol, sol

    %49
    sol2.\mbreak
    sol2 r4
    sol' sol, sol

    %52
    sol2.~
    sol2.~
    sol2.~

    %55
    sol2.~
    sol2.~
    sol2.

    %58
    do~\mbreak
    do8[re mi re mi do]
    fa2 mi4

    %61
    fa sol sol,
    do2.
    R2.*8

    %71
    sol'4 sol sol
    sol fad2
    fa!4 fa2

    %74
    mi4 mi2\mbreak
    mib!4 mib mib
    re4. re8 sol4

    %77
    do, re4. re8
    sol,2 r4
    do do do

    %80
    fa  fa fa
    sib, sib sib8 sib
    mib4 mib mib\mbreak

    %83
    lab, lab lab8 lab
    re2.
    sol,~

    %86
    sol~
    sol
    sol4. sol8 sol sol

    %89
    sol4. sol8 do4\mbreak
    fa sol sol,
    do2 r4

    %92
    sol'8\f [la] si[la] si [sol]
    do,[si do re mi do]
    sol'[fa sol la si sol]

    %95
    do4. do,8 do4
    fa sol sol,
    do,2.\fermata

}

VtestoIV = \lyricmode {

    Et non pæni - te -- bit eum: _

    non pæ -- ni -- te -- bit  non pæni - te -- bit.

    Ju -- ra -- vit Domi - nus et non pæni - te - - - - - - - - - - bit  e -- um.

    Ju -- ra -- vit Domi - nus non pæni - te -- bit non pæni - te -- bit

    et non pæni - te -- bit et non pe -- ni -- te - bit non pe -- ni -- te -- bit non pe -- ni -- te -- bit

    non pe -- ni -- te - - bit e - - um.



    Tu es sa -- cer -- dos in æ -- ter -- num secun - dum or -- dinem _  Melchi - se -- dech.

    Tu es sa -- cer -- dos sa -- cerdos _ in æ -- ter -- num

    sa -- cerdos _ in æ -- ter - num

    se -- cun -- dum or -- dinem _  Melchi - se -- dech

    se -- cun -- dum or - - dinem _  Melchi - se -- dech.

}

Vbcn = \relative do {

    do4\f do' do,
    do do' do,
    do do' do,

    %4
    sol sol' sol,
    sol sol' sol,
    sol sol' sol,

    %7
    do do' do,
    do do' do,
    do do' do,

    %10
    sol sol' sol,
    sol sol' sol,
    sol sol' sol,

    %13
    do do' do,
    do do' do,
    fa, fa' fa,

    %16
    si si' si,
    mi, mi' mi,
    la la' la,

    %19
    re, re' re,
    sol sol' sol,
    sol' fad8 mi re do

    %22
    si4 do re
    sol,8 do re4 re,
    sol'8 fad sol la si sol\mbreak

    %25
    do, si do re  mi do
    sol' fad sol la si sol
    re? do re mi fad mi

    %28
    re4 re' re,
    sol, sol' sol,
    re' re' re,

    %31
    sol do, re
    sol, sol' sol,
    sol sol' sol,\mbreak

    %34
    sol sol' sol,
    do, do' do,
    do do' do,

    %37
    do do' do,
    sol' sol' sol,
    sol sol' sol,

    %40
    sol sol' sol,
    do do' do,\mbreak
    do do' do,

    %43
    re re' re,
    sol, sol' sol,
    sol sol' sol,

    %46
    sol sol' sol,
    do, do' re
    sol,\tasto sol' sol,

    %49
    sol sol' sol,\mbreak
    sol sol' sol,
    sol sol' sol,

    %52
    sol sol' sol,
    sol sol' sol,
    sol sol' sol,

    %55
    sol sol' sol,
    sol sol' sol,
    sol sol' sol,

    %58
    do do' do,\mbreak
    do8 re mi re mi do
    fa,4 fa' mi

    %61
    fa sol sol,
    do2.
    R2.*8

    %71
    sol'4_\markup\italic"Senza Organi" sol sol
    sol fad fad
    fa! fa fa

    %74
    mi mi mi\mbreak
    mib! mib mib
    re re sol

    %77
    do, re re,
    sol sol sol
    do do do

    %80
    fa fa fa
    sib, sib sib
    mib mib mib\mbreak

    %83
    lab, lab lab
    re re re
    sol, sol sol

    %86
    sol sol sol
    sol sol sol
    sol sol sol

    %89
    sol sol do\mbreak
    fa sol sol,
    do do do

    %92
    sol'8\f la_\markup\italic"Organi tutti" si la si sol
    do, si do re mi do
    sol' fa sol la si sol

    %95
    do4 do, do
    fa sol sol,
    do,2.\fermata

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key do\major
    \tempo 2. = 55
    s2.*62\break
    \key sol \minor
    s2.*29\break
    \key do\major
    s2.*6
    \bar "|."

}

VvlI = {
    \notypeset
    <<\VvlIn \forma>>

}

VvlII = {
    <<\VvlIIn \forma>>

}

Vvla = {
    \clef alto
    <<\Vvlan \forma>>

}

Vsoprano = {
    \new Voice = "iuravit1"
    <<\Vsopranon \forma>>
}

VsopranoI = {
    \new Voice = "iuravit1"
    <<\VsopranoIn \forma>>
}

Valto = {
    \new Voice = "iuravit2"
    <<\Valton \forma>>
}

Vtenore = {
    \new Voice = "iuravit3"
    <<\Vtenoren \forma>>
}

Vbasso = {
    \clef bass
    \new Voice = "iuravit4"
    <<\Vbasson \forma>>
}

Vbc = {
    \clef bass
    <<\Vbcn \forma \Vbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



VIvlIn = \relative do'' {

    re,4 fa' mi la,
    dod, sol'' fa8 re la fa
    re16 re re re re mi fa sol la la la la la la sib do

    %4
    re re re re re mi fa sol la4 r
    fad2 sol\mbreak
    mi fa

    %7
    re mi
    dod re8 fa mi, mi'
    re4 r r2\fermata

    %10
    re,4 re'\mbreak dod8 la sib4~
    sib8 la4 sol mi' sol,8
    fa2 mi16 dod'\p dod dod mi sol la sol

    %13
    dod, dod dod dod mi sol la sol fa2~
    fa mi~\mbreak
    mi re~

    %16
    re dod
    re1
    si8 re si re do mi do mi

    %19
    si re si re\mbreak la do si re
    do16 mi la, do si re sold, si do mi do mi do mi do mi
    sold,8 mi re'4\f do8 si16 la si4\tr

    %22
    la re do8 si16 la si4\tr\mbreak
    la16 la la la la si do re mi mi mi mi mi mi fa sol
    la8 la, re4 do8[si16 la si8 sold]

    %25
    la4 r8 do si8 mi,4 si'8~
    si re4 do16 si do\p do do do do do re do\mbreak
    fad2 sol

    %28
    mi fa?
    re8\f la fa re sol'2~
    sol fa~\mbreak

    %31
    fa~fa
    mi mi8 r mi r
    fa r fa r sol r sol r

    %34
    fa r mi r fa r re r\mbreak
    re r dod r fa,16[re mi fa sol la sib do?]
    re8 do16 sib la sol fa mi fa8\f re fa la

    %37
    re re, mi4\tr fa'2\p~
    fa\mbreak mi~
    mi re~

    %40
    re mi
    fa8 re, sol4\f fa8 re' mi re16 dod\mbreak
    re4 sol, fa8 re' mi re16 dod

    %43
    fad2 sol
    mi fa
    re mi\mbreak

    %46
    dod16 dod dod dod dod dod re dod mi mi mi mi mi mi fa mi
    fa8 re mi dod re2\fermata

}

VIvlIIn = \relative do'' {

    re,4 fa' mi la,
    dod, sol'' fa8 re la fa
    re16 re re re re mi fa sol la la la la la la sib do

    %4
    re re re re re mi fa sol la4 r
    do,16 do do do do do re do sib sib sib sib sib sib do sib\mbreak
    sib sib sib sib sib sib do sib la la la la la la sib la

    %7
    la la la la la la sib la sol sol sol sol sol sol la sol
    sol sol sol sol sol sol la sol fa8 re' dod, dod'
    re4 r r2\fermata

    %10
    fa,4 la\mbreak la8 mi r sol
    sol mi4 mi dod' mi,8
    re2\tr dod16 la'\p la la dod mi fa mi

    %13
    la, la la la dod mi fa mi re4 r
    sib1\mbreak
    la

    %16
    sol
    fa
    sold8 si sold si la do la do

    %19
    sold si sold si\mbreak do mi re fa
    la,16 do mi, la sold si mi, sold la do la do la do la do
    si8 sold si4\f la8 la la sold

    %22
    la4 si la8 la la sold\mbreak
    la16 la la la la si do re mi mi mi mi mi mi fa sol
    la8 la, si4 la8 do, re si

    %25
    do4 r8 la' sold sold4 sold8~
    sold si4 la16 sold la\p la la la la la si la\mbreak
    do do do do do do re do sib sib sib sib sib sib do sib

    %28
    sib sib sib sib sib sib do sib la la la la la la sib la
    re8\f la fa re mi'2~
    mi re~\mbreak

    %31
    re~re
    si dod8 r dod r
    re r re r mi r mi r

    %34
    re r dod r re r sib r\mbreak
    la r sol r fa16[re mi fa sol la sib do?]
    re8 do16 sib la sol fa mi fa8\f re fa la

    %37
    re re, mi4\tr re\p r
    sib'2~\mbreak sib
    la1

    %40
    sol
    fa4 dod'\f re8 fa, sol[mi]\mbreak
    re4 dod' re8 fa, sol mi

    %43
    re16 do' do do do do re do si si si si si si do si
    sib! sib sib sib sib sib do sib la la la la la la sib la
    la la la la la la sib la sol sol sol sol sol sol la sol\mbreak

    %46
    la la la la la la si la dod dod dod dod dod dod re dod
    re8 fa sol mi re2\fermata

}

VIvlan = \relative do' {

    r8 la la la r dod mi dod
    r dod mi dod \once\stemUp la re' la fa
    fa fa fa fa mi mi mi mi

    %4
    re re re re dod4 r
    la'16 la la la la la sib la sol re re re re re mi re\mbreak
    do sol' sol sol sol sol la sol fa do do do do do re do

    %7
    sib fa' fa fa fa fa sol fa mi sib sib sib sib sib do sib
    la mi' mi mi mi mi dod dod la8 la la la
    la4 r r2\fermata

    %10
    la4 fa'\mbreak mi8 dod r re
    mi4 mi la, la
    la8 la si si dod mi mi mi

    %13
    mi mi mi dod la la la fa'
    re re re sib \parenthesize sol sol sol mi'\mbreak
    do do do la fa fa fa re'

    %16
    sib sib sib sol mi mi mi dod'
    la la la la la la la la
    mi' r mi r mi r mi r

    %19
    mi r mi r\mbreak mi r mi r
    mi mi mi mi mi mi mi mi
    mi4 sold\f mi8 mi mi mi

    %22
    mi4 sold mi8 mi mi mi\mbreak
    do do do do sib sib sib sib
    la fa' mi[mi] mi mi, fa mi

    %25
    mi4 r8 mi' mi4 mi
    mi mi mi8 mi mi do\mbreak
    la16 la' la la la la sib la sol re re re re re mib re

    %28
    do sol' sol sol sol sol la sol fa do do do re re re re
    re'8\f la fa re dod dod dod dod
    dod? dod dod dod la la la la\mbreak

    %31
    la la la la sib sib sib sib
    si si mi mi mi r sol r
    fa r re r dod r dod r

    %34
    re r la r re r sol r\mbreak
    fa r mi r fa re fa la
    re sol, dod,[la] re,\f re' fa[la]  %%%%%% FQ

    %37
    re re, la[la] re4\p r8 re
    re re re sib\mbreak sol sol sol mi'
    do do do la fa fa fa re'

    %40
    sib sib sib sol la la la la
    la4 la\f la8 la sib[la]\mbreak
    la4 la la8 la sib la

    %43
    la16 la' la la la la sib la sol re re re re re mi re
    do sol' sol sol sol sol la sol fa do do do do do re do
    sib fa' fa fa fa fa sol fa mi sib sib sib sib sib do sib\mbreak

    %46
    la8 mi' mi mi mi mi mi dod
    la la' sib la fa2\fermata

}

VItenoren = \relative do' {

    \autoBeamOff
    R1*8
    la8 re4 la8 fa8. mi16 re4\fermata
    r4 re'\mbreak dod8 [la] sib4~

    %11
    sib8 la4 sol mi' sol,8
    fa2 fa4 r8 la
    dod la r la fa'[mi re do]

    %14
    sib16 [sib do sib] sib [sib do sib] mi [re mi re] mi [re do sib]\mbreak
    la[la sib la] la[la sib la]re[do re do] re[do sib la]
    sol[sol la sol] sol[sol la sol]dod[re mi re] dod[si la sol]

    %17
    fa[re mi fa sol la si dod] re[mi fa mi re do? si la]
    sold[mi re mi] sol[si la sold] la[mi re mi] la[do si la]
    si[mi, re mi] si'[re do si]\mbreak do[la sold la] re[si la si]

    %20
    mi8 mi, r si'? do mi16[re] do8 si16[la]
    sold8 mi re'4 do8 si16 [la] si4\tr
    la re do8 si16 [la] si4\tr\mbreak

    %23
    la r r2
    R1
    la8. mi16 mi8 do' si8 mi,4 si'8~

    %26
    si re4 do16 [si] do[si] la8 r do\mbreak
    re, do'4 do8 sib16[la] sol8 r sib
    do, mi sol sib la16[sol] fa8 r re'

    %29
    re[la fa re]mi16[mi fa mi] sol[sol la sol]
    dod[re mi re dod si la sol] fa[fa sol fa] la[la sib la]\mbreak
    re16[mi fa mi re do sib la] sol[sol la sol] sib[sib do sib]

    %32
    mi[fa sol fa mi re dod si] dod[la sol la] dod[la sol la]
    re[la sol la] re[la sol la] mi'[la, sol la] mi'[la, sol la]
    fa'[re dod? re] mi[dod? sib dod] re[la sol la] sib[sol fa sol]\mbreak

    %35
    la[fa mi fa] sol[mi re mi] fa[re mi fa sol la sib do?]
    re8 [do16 sib] la [sol] fa [mi] fa8 re fa la
    re re, mi4\tr re r8 la'

    %38
    sib16[sib do sib] sib[sib do sib]\mbreak mi[fa sol fa mi re do sib]
    la[la sib la] la[la sib la] re[mi fa mi re do sib la]
    sol[sol la sol] sol[sol la sol] dod[re mi re dod sib la sol]

    %41
    fa8 re sol4 fa8 re' mi [re16 dod]\mbreak
    re4 sol, fa8 re' mi [re16 dod]
    re4 r r2

    %44
    R1*4

}

VItestoIII = \lyricmode {

    Do - - - minus _ a dex - - - - tris tu -- is con -- fregit _ con -- fre - - - - - - - - - - - - - - - - - - - - - - - git

    in die _ iræ _ suæ _ con -- fregit _ re -- ges con -- fregit _ re -- ges.

    Do -- minus _ a dex - - - tris tu -- is con -- fregit _ in die _ in die _ iræ _ suæ _

    con -- fre - - - - - - - - - - - - - - - - - - - - - - - git in die _  iræ _ suæ _

    re -- ges con -- fre - - - - - - - - - git con -- fregit _ re -- ges con -- fregit _ re -- ges.

}

VIbcn = \relative do {

    r8 re16[mi fa8 re] r la16[si dod8 la]
    r la16[si dod8 la] re re' la fa
    re re re re do do do do

    %4
    sib sib sib sib la4 r
    re8 re'fad, re sol, sol' sib, sol\mbreak
    do do' mi, do fa, fa' la, fa

    %7
    sib sib' re, sib mi, mi' sol, mi
    la la' dod, la re re, la''[la,]
    re4 r re2\fermata

    %10
    r8 re16[mi fa8 re]\mbreak la' la, r re
    dod4 dod dod dod
    re8 re sol,[sol] la la' la, la

    %13
    la la' la, la re re re re
    sol sol sol sol do, do do do\mbreak
    fa fa fa fa sib, sib sib sib

    %16
    mi mi mi mi la, la la la
    re re re re re re re re
    mi r mi r mi r mi r

    %19
    mi r mi r\mbreak mi r mi r
    mi mi mi mi la,la la la
    mi'16 mi fa mi mi\f mi fa mi la8 la, mi'[mi,]

    %22
    la16 la' si la sold mi fad sold la8 la, mi' mi,\mbreak
    la la' la la sol sol sol sol
    fa16 fa sol fa sold, sold la sold la8 la' mi [mi,]

    %25
    la si do la mi'4 mi
    mi mi la,8\p la la[la]\mbreak
    re re' fad, re sol, sol' sib, sol

    %28
    do do' mi, do fa, fa' fa,
    \once\stemUp re\f re'' la fa re mi mi mi mi
    la, la la la re re re re\mbreak

    %31
    re re re re sib sol sol sol
    sol sol sol sol la la la la
    la\f la la la la la la la

    %34
    la la la la la la la la\mbreak
    la la la la fa' re fa la
    re sol, dod,[la] re, re' fa[la]

    %37
    re re, la[la] re re re re
    sol sol sol sol\mbreak do, do do do
    fa fa fa fa sib, sib sib sib

    %40
    mi mi mi mi la, la la la
    re16 re mi re la\f la sib la re8 re sol,[la]\mbreak
    re16 re mi re la la sib la re8 re sol, la

    %43
    re re' fad, re sol, sol' si, sol
    do do' mi, do fa, fa' la, fa
    sib sib' re, sib mi, mi' sol, mi\mbreak

    %46
    la la' mi dod la la' dod, la
    re, re' sol, la re,2\fermata

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key re\minor
    \tempo 2 = 55
    s1*8%\break
    \once\override Score.RehearsalMark.extra-offset = #'(+6 . -1.5)
    \mark\markup\italic"Ad[agi]o"
    \tempo 4 = 50
    s1
    \once\override Score.RehearsalMark.extra-offset = #'(+8 . -1.0)
    \mark\markup\italic"All[egr]o"
    \tempo 2 = 55
    s1*38
    \bar "|."

}

VIvlI = {
    \notypeset
    <<\VIvlIn \forma>>

}

VIvlII = {
    <<\VIvlIIn \forma>>

}

VIvla = {
    \clef alto
    <<\VIvlan \forma>>

}

VItenore = {
    \new Voice = "dextris"
    <<\VItenoren \forma>>
}

VIbc = {
    \clef bass
    <<\VIbcn \forma \VIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}


VIItpn = \relative do'' {

    re4 re,8. re16 re4 re
    la'1~
    la

    %4
    la4\fermata r la' la,8. la16
    la4 la mi'2~
    mi~mi~\mbreak

    %7
    mi~mi\fermata
    R1*6
    r8 r16 re [re8 r16 la] la8[r16 fad fad8 r16 re]

    %15
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    re'2 la\fermata
    R1*11

    %28
    re4 re8. re16 re8 la fad re
    la''8. la16 la,4 r la
    R1*4

    %34 presto
    r8 r fad'
    fad16 fad fad fad fad fad
    fad16 fad fad fad fad fad

    %37
    fad16 fad fad fad fad fad
    fad16 fad fad fad fad fad
    fad16 fad fad fad fad fad

    %40
    fad16 fad fad fad fad fad
    fad16 fad fad fad fad fad
    fad16 fad fad fad fad fad

    %43
    R4.*3
    fad,16 fad fad fad fad fad
    fad fad fad fad fad fad

    %48
    fad fad fad fad fad fad\mbreak
    fad fad fad fad fad fad
    fad fad fad fad r8

    %51
    fad16 fad fad fad fad fad
    fad fad fad fad fad fad
    R4.*20

    %73
    fad16 fad fad fad fad fad
    fad fad fad fad fad fad\mbreak
    fad fad fad fad fad fad

    %76
    r8 fad16 fad fad fad
    \parenthesize si,4.\fermata

}

VIIobIn = \relative do'' {

    R1
    r8 r16 fad,[fad8 r16 fad] sol8[r16 sol sol8 r16 sol]
    fad8[r16 fad fad8 r16 fad] sol8[r16 sol sol8 r16 sol]

    %4
    fad4\fermata r r2
    R1*8
    r8 r16 fad[fad8 r16 fad] sol8[r16 sol sol8 r16 sol]

    %14
    sol8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    sold2 la\fermata

    %17
    R1*9
    re,8. [re16 re8. re16]  re8. [re16 re8. re16]
    re8. [re16 re8. re16]  re8. [re16 re8. re16]

    %28
    re'4 re8. re16 re8 la fad re
    la'8. la16 la4 r la
    R1*4

    %34 presto
    fad16 fad si si re re
    dod dod dod dod dod dod
    re re si si re re

    %37
    dod dod fad, fad dod' dod
    re re fad fad si si
    fad fad re re si si\mbreak

    %40
    sol sol mi mi sol' sol
    mi mi dod dod la la
    fad fad re re fad' fad

    %43
    re re si si sold sold
    mid? mid sold sold si si
    re re si si sold sold

    %46
    la la dod dod fad fad
    la, la dod dod fad fad
    la, la dod dod fad fad\mbreak

    %49
    la, la dod dod fad fad
    re, re dod dod dod dod
    fad16 fad la la dod dod

    %52
    fad fad la la dod, dod
    sid sid sold? sold sid sid
    red red fad fad red red

    %55
    mi mi sold, sold dod dod
    mi mi sold sold dod, dod
    lad lad fad fad lad lad\mbreak

    %58
    dod dod mi mi dod dod
    re re fad fad re re
    si si fad fad re re

    %61
    re re re re r8
    fad16 fad si si re re
    si si sol sol sol' sol

    %64
    sold, sold dod dod mid mid
    dod dod lad lad lad' lad\mbreak
    mi mi dod dod lad lad

    %67
    si si re re si si
    sol' sol mi mi dod dod
    lad lad dod dod fad fad

    %70
    lad, lad dod dod fad fad
    re re lad lad si si
    mid, mid fad fad fad fad

    %73
    si,16 si si' si re re
    si si re re fad fad\mbreak
    re re fad fad si si

    %76
    mid,,8 fad4
    si,4.\fermata

}

VIIobIIn = \relative do'' {

    R1
    r8 r16 re,[re8 r16 re] mi8[r16 mi mi8 r16 mi]
    re8[r16 re re8 r16 re] mi8[r16 mi mi8 r16 mi]

    %4
    re4\fermata r r2
    R1*8
    r8 r16 re[r8 r16 re] mi8[r16 mi mi8 r16 mi]

    %14
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    sold2 la\fermata

    %17
    R1*9
    re,8[r16 re re8 r16 re] re8[r16 re re8 r16 re]
    re8[r16 re re8 r16 re] re8[r16 re re8 r16 re]

    %28
    re'4 re8. re16 re8 la fad re
    la'8. la16 la4 r la
    R1*4

    %34 presto
    re,16 re fad fad si si
    lad lad fad fad lad lad
    si si fad fad si si

    %37
    lad lad dod dod lad lad
    si si mi mi fad fad
    re re si si fad fad\mbreak

    %40
    mi16 mi sol sol si si
    dod dod la la mi mi
    re re fad fad si si
    si si fad fad re re

    %44
    dod dod mid mid sold sold
    si si sold sold mid mid
    fad fad la la dod dod

    %47
    fad, fad la la dod dod
    fad, fad la la dod dod
    fad, fad la la dod dod

    %50
    re, re dod dod dod dod
    dod16 dod fad fad la la
    dod dod fad fad la la

    %53
    red, red sid sid red red
    sid sid red red sid sid
    dod dod mi, mi sold sold

    %56
    dod dod mi mi sold sold
    dod, dod lad lad dod dod\mbreak
    lad lad dod dod lad lad

    %59
    si si re re si si
    fad fad re re si si
    si si si si r8

    %62
    re16 re fad fad si si
    sol sol mi mi mi' mi
    mi, mi sold sold dod dod

    %65
    lad lad fad fad fad' fad\mbreak
    dod dod lad lad fad fad
    fad fad si si fad fad

    %68
    mi' mi si si sold sold
    fad fad lad lad dod dod
    fad, fad lad lad dod dod

    %71
    re re lad lad si si
    mid, mid fad fad fad fad
    si,16 si fad' fad si si

    %74
    fad fad si si re re\mbreak
    si si re re fad fad
    mid,8 fad4

    %77
    si,4.\fermata

}

VIIvlIn = \relative do'' {

    R1*4
    r2 r8 r16 dod[dod8 r16 dod]
    re8[r16 re re8 r16 re] dod8[r16 dod dod8 r16 dod]\mbreak

    %7
    re8[r16 re re8 r16 re] dod2\fermata
    R1*4
    fad,8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]

    %13
    re1~
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]

    %16
    sold2 la\fermata
    R1*7
    la8.[la16 la8. la16] la8.[la16 la8. la16]

    %25
    la8.[la16 la8. la16] la8.[la16 la8. la16]\mbreak
    R1*2
    re4 re8. re16 re8 la fad re

    %29
    la'8. la16 la4~la8.\p[mi'16 mi8. mi16]
    fad8.[fad16 fad8. fad16] mi8.[mi,16 mi8. mi16]
    fad8.[fad16 fad8. fad16] mi8.[mi16 mi8. mi16]\mbreak

    %32
    fad8.[fad16 fad8. fad16] mi2~
    mi1\fermata
    fad32 fad fad fad si[si si si] re[re re re]
    dod dod dod dod dod[dod dod dod] dod dod dod dod
    re re re re si [si si si ]re re re re

    %37
    dod dod dod dod fad, [fad fad fad] dod' dod dod dod
    re re re re fad [fad fad fad] si si si si
    fad fad fad fad re[re re re] si si si si\mbreak

    %40
    sol sol sol sol mi [mi mi mi] sol' sol sol sol
    mi mi mi mi dod [dod dod dod] la la la la
    fad fad fad fad re [re re re] fad' fad fad fad

    %43
    re re re re si [si si si] sold sold sold sold
    mid? mid mid mid sold [sold sold sold] si si si si
    re re re re si [si si si] sold sold sold sold

    %46
    la la la la dod [dod dod dod] fad fad fad fad
    la, la la la dod [dod dod dod] fad fad fad fad
    la, la la la dod [dod dod dod] fad fad fad fad\mbreak

    %49
    la, la la la dod [dod dod dod] fad fad fad fad
    re, re re re dod [dod dod dod] dod dod dod dod
    fad32 fad fad fad la [la la la] dod dod dod dod

    %52
    fad fad fad fad la [la la la] dod, dod dod dod
    sid sid sid sid sold? [sold sold sold] sid sid sid sid
    red red red red fad [fad  fad fad] red red red red

    %55
    mi mi mi mi sold, [sold sold sold] dod dod dod dod
    mi mi mi mi sold[sold sold sold] dod, dod dod dod
    lad lad lad lad fad [fad fad fad] lad lad lad lad\mbreak

    %58
    dod dod dod dod mi [mi mi mi] dod dod dod dod
    re re re re fad [fad fad fad] re re re re
    si si si si fad [fad fad fad] re re re re

    %61
    re re re re re[re re re] r8
    fad32 fad fad fad si [si si si] re re re re
    si si si si sol [sol sol sol] sol' sol sol sol

    %64
    sold, sold sold sold dod [dod dod dod] mid mid mid mid
    dod dod dod dod lad [lad lad lad] lad' lad lad lad\mbreak
    mi mi mi mi dod [dod dod dod] lad lad lad lad

    %67
    si si si si re [re re re] si si si si
    sol' sol sol sol mi [mi mi mi] dod dod dod dod
    lad lad lad lad dod [dod dod dod] fad fad fad fad

    %70
    lad, lad lad lad dod [dod dod dod] fad fad fad fad
    re re re re lad [lad lad lad] si si si si
    mid, mid mid mid fad [fad fad fad] fad fad fad fad

    %73
    si,32 si si si si' [si si si] re re re re
    si si si si re [re re re] fad fad fad fad\mbreak
    re re re re fad [fad fad fad] si si si si

    %76
    mid,,8 fad4
    si,4.\fermata

}

VIIvlIIn = \relative do'' {

    R1*4
    r2 r8 r16 la[la8 r16 la]
    si8[r16 si si8 r16 si] la8[r16 la la8 r16 la]\mbreak

    %7
    si8[r16 si si8 r16 si] la2\fermata
    R1*4
    fad8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]

    %13
    re1~
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]

    %16
    sold2 la\fermata
    R1*7
    la8.[la16 la8. la16] la8.[la16 la8. la16]

    %25
    la8.[la16 la8. la16] la8.[la16 la8. la16]\mbreak
    R1*2
    re4 re8. re16 re8 la fad re

    %29
    la'8. la16 la4~la8.\p[dod16 dod8. dod16]
    re8.[re16 re8. re16] dod8.[dod,16 dod8. dod16]
    re8.[re16 re8. re16] dod8.[dod16 dod8. dod16]\mbreak

    %32
    re8.[re16 re8. re16] dod2~
    dod1\fermata
    re32 re re re fad[fad fad fad] si si si si

    %35
    lad lad lad lad fad[fad fad fad] lad lad lad lad
    si si si si fad[fad fad fad] si si si si
    lad lad lad lad dod[dod dod dod] lad lad lad lad

    %38
    si si si si re[re re re] fad fad fad fad
    re re re re si[si si si] fad fad fad fad\mbreak
    mi mi mi mi sol[sol sol sol] si si si si

    %41
    dod dod dod dod la[la la la] mi mi mi mi
    re re re re fad[fad fad fad] si si si si
    si si si si fad[fad fad fad] re re re re

    %44
    dod dod dod dod mid[mid mid mid] sold sold sold sold
    si si si si sold[sold sold sold] mid mid mid mid
    fad fad fad fad la[la la la] dod dod dod dod

    %47
    fad, fad fad fad la[la la la] dod dod dod dod
    fad, fad fad fad la[la la la] dod dod dod dod
    fad, fad fad fad la[la la la] dod dod dod dod

    %50
    re, re re re dod [dod dod dod] dod dod dod dod
    dod32 dod dod dod fad[fad fad fad] la la la la
    dod dod dod dod fad[fad fad fad] la la la la

    %53
    red, red red red sid[sid sid sid] red red red red
    sid sid sid sid red[red red red] sid sid sid sid
    dod dod dod dod mi,[mi mi mi] sold sold sold sold

    %56
    dod dod dod dod mi[mi mi mi] sold sold sold sold
    dod, dod dod dod lad[lad lad lad] dod dod dod dod\mbreak
    lad lad lad lad dod[dod dod dod] lad lad lad lad

    %59
    si si si si re[re re re] si si si si
    fad fad fad fad re[re re re] si si si si
    si si si si si[si si si]  r8

    %62
    re32 re re re fad[fad fad fad] si si si si
    sol sol sol sol mi[mi mi mi] mi' mi mi mi
    mi, mi mi mi sold[sold sold sold] dod dod dod dod

    %65
    lad lad lad lad fad[fad fad fad] fad'[fad fad fad]\mbreak
    dod dod dod dod lad[lad lad lad] fad fad fad fad
    fad fad fad fad si[si si si] fad fad fad fad

    %68
    mi' mi mi mi si[si si si] sold sold sold sold
    fad fad fad fad lad[lad lad lad] dod dod dod dod
    fad, fad fad fad lad[lad lad lad] dod dod dod dod

    %71
    re re re re lad[lad lad lad] si si si si
    mid, mid mid mid fad [fad fad fad] fad fad fad fad
    si,32 si si si fad' [fad fad fad] si si si si

    %74
    fad fad fad fad si[si si si] re re re re\mbreak
    si si si si re[re re re] fad fad fad fad
    mid,8 fad4

    %77
    si,4.\fermata

}

VIIvlan = \relative do' {

    R1*7
    re'4 re8[r16 re] re4 dod
    si1
    mi4 mi8[r16 mi] mi4 re
    dod1
    fad,8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]

    %13
    re1~
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]

    %16
    sold2 la\fermata
    R1*9
    re,8.[re16 re8. re16] re8.[re16 re8. re16]

    %27
    re8.[re16 re8. re16] re8.[re16 re8. re16]
    re'4 re8. re16 re8 la fad re

    %29
    la'8. la16 la,4~la8.\p[la16 la8. la16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]
    la8.[la16 la8. la16] la8.[la16 la8. la16]

    %32
    la8.[la16 la8. la16] la2~
    la1\fermata
    si16 si re re fad fad

    %35
    fad fad fad fad fad fad
    fad fad fad fad fad fad
    fad fad fad fad fad fad

    %38
    fad fad fad fad fad fad
    si si fad fad re re\mbreak
    si si si si mi mi

    %41
    sol sol mi  mi dod dod
    la la la la re re
    fad fad re re si si

    %44
    lad lad lad lad mid' mid
    mid? mid mid mid mid mid
    dod dod fad fad la la

    %47
    dod, dod fad fad la la
    dod, dod fad fad la la\mbreak
    dod, dod fad fad la la

    %50
    re, re dod dod dod dod
    la la dod dod fad fad
    la la dod dod fad, fad

    %53
    fad fad fad fad fad fad
    fad fad fad fad fad fad
    sold sold dod, dod mi mi

    %56
    sold sold dod dod mi, mi
    mi mi mi mi mi mi\mbreak
    mi mi mi mi mi mi

    %59
    fad fad si si fad fad
    re re si si fad fad
    fad fad fad fad r8

    %62
    si16 si re re fad fad
    mi mi si si si si
    dod dod mid mid sold sold

    %65
    fad fad dod dod dod dod\mbreak
    lad lad dod dod dod dod
    re re fad fad re re

    %68
    si si sol' sol mid mid
    dod dod fad fad lad lad
    dod, dod fad fad lad lad

    %71
    re re lad lad si si
    mid, mid fad fad fad fad
    si, si re re fad fad

    %74
    re re fad fad si si\mbreak
    fad fad si si re re
    mid,8 fad4

    %77
    si,4.\fermata

}

VIIsopranon = \relative do'' {

    \autoBeamOff
    R1*20
    r2 mi4 la,
    la4. la8 la4 la8 la

    %23
    re4. re8 dod2\fermata
    \stemUp mi4.\solo mi8 fad4 fad
    fad fad8. fad16 fad8. mi16 mi4\stemNeutral

    %26
    R1*2
    re4 re8. re16 re8[la fad re]

    %29
    la'8. la16 la4~la r
    R1*4

    %34 presto
    r8 r re
    dod fad, dod'
    re si re

    %37
    dod fad, dod'
    re si r
    fad'8.[re16] si8\mbreak

    %40
    sol mi r
    mi'[dod] la
    fad re r

    %43
    re'[si] sold
    mid [sold si]
    re[si] sold

    %46
    la8. sold?16 fad8
    r r fad'
    fad la, dod\mbreak

    %49
    dod fad, r
    re dod4\tr
    fad4.

    %52
    r8 r fad'
    sid, sold fad'
    sid, sold fad'

    %55
    mi dod r
    r r mi
    lad, fad mi'\mbreak

    %58
    lad, fad mi'
    re si r
    R4.*2

    %62
    fad8[si] fad
    sol mi r
    sold[dod] sold

    %65
    lad fad r\mbreak
    mi'[dod] lad
    si[re si]

    %68
    sol'[mi] dod
    lad8. sold16 fad8
    r r fad

    %71
    re'[lad] si
    mid, fad4\tr
    si, si'8

    %74
    si fad re'\mbreak
    re si r
    mid, fad4

    %77
    si,4.\fermata

}

VIItestoI = \lyricmode {

    Judi - cabit _ in nati - oni - bus.

    Judi - cabit _ in nati - oni - bus

    in nati - o - ni -- bus.

    Im -- plebit _  ru -- inas _  im -- plebit _  ru -- inas _

    con -- quas -- sabit _ con -- quas -- sabit _ con -- quas -- sa - bit ca -- pita _

    in terra _ in terra _ mul -- to -- rum im -- plebit _  im -- plebit _  ru -- inas _

    im -- plebit _  im -- plebit _  ru -- inas _

    con -- quas -- sabit _ con -- quas -- sabit _ con -- quas -- sa - bit

    ca -- pita _  in ter -- ra mul -- to -- rum in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIalton = \relative do' {

    \autoBeamOff
    R1*19
    la'4 re, re4. re8
    re4 re8 re la'2~

    %22
    la1
    si4. si8 la2\fermata
    R1*2

    %26
    \stemUp la4.\solo la8 si4 si
    si si8. si16 si8. la16 la4\stemNeutral
    re re8. re16 re8[la fad re]

    %29
    la'8. la16 la4~la r
    R1*4
    r8 r fad

    %35
    fad fad fad
    fad fad fad
    fad fad fad

    %38
    fad fad r
    re'[si] fad\mbreak
    mi sol r

    %41
    dod[la] fad
    re fad r
    si[fad] re

    %44
    dod[mid sold]
    si[sold] mid
    fad8. sold16 la8

    %47
    r r la
    la fad la\mbreak
    la dod, r

    %50
    re dod4\tr
    fad4.
    r8 r sold

    %53
    sold sid sid
    sold sid sid
    sold sold r

    %56
    r r sold?
    fad sold  sold\mbreak
    fad sold sold

    %59
    fad fad r
    R4.*2
    re8[fad] re

    %63
    mi sol?  r
    mid[sold] mid
    fad lad r\mbreak

    %66
    dod[lad] fad
    fad[si fad]
    mi[si'] sold

    %69
    fad8. sold16 lad?8
    r r fad
    re'[lad] si

    %72
    mid, fad4\tr
    si, fad'8
    fad re si'\mbreak

    %75
    si fad r
    mid fad4
    si,4.\fermata

}

VIItestoII = \lyricmode {

    Judi - cabit _ in nati - o - ni -- bus.

    Judi - cabit _ in nati - o -- ni -- bus in nati - o - ni -- bus.

    Im -- plebit _  ru -- inas _  im -- plebit _  ru -- inas _

    con -- quas -- sabit _ con -- quas -- sabit _ con -- quas -- sa - bit ca -- pita _

    in terra _ in terra _ mul -- to -- rum im -- plebit _  im -- plebit _  ru -- inas _

    im -- plebit _  im -- plebit _  ru -- inas _

    con -- quas -- sabit _ con -- quas -- sabit _ con -- quas -- sa - bit

    ca -- pita _  in ter -- ra mul -- to -- rum in ter -- ra in ter -- ra mul -- to -- rum.

}

VIItenoren = \relative do' {

    \autoBeamOff

    R1*17
    r2 mi4 la,
    la4. la8 la4 la8 la

    %20
    re1~
    re2 mi~
    mi1~

    %23
    mi4. mi8 mi2\fermata
    R1*4
    re4 re8. re16 re8[la fad re]
    la'8. la16 la4~la r

    %30
    R1*4
    r8 r si %% presto
    lad dod lad

    %36
    si re si
    lad dod lad
    si re r

    %39
    si[fad'] si,\mbreak
    si si r
    la[mi'] la,

    %42
    la la r
    sol[re'] si
    si4.

    %45
    si
    dod8. dod16 dod8
    r r dod

    %48
    dod dod fad\mbreak
    fad la, r
    re dod4\tr

    %51
    fad,4.
    r8 r fad'
    red red red

    %54
    red? red red
    dod dod r
    r r mi

    %57
    dod dod dod\mbreak
    dod dod dod
    si si r

    %60
    R4.*2
    fad8 fad4
    si8 si r

    %64
    sol sol4
    dod8 dod r\mbreak
    dod4 dod8

    %67
    re[fad re]
    si4 dod8
    dod8. dod16 dod8

    %70
    r r fad,
    re'[lad] si
    mid, fad4\tr

    %73
    si4 re8
    re si fad'\mbreak
    fad re r

    %76
    mid, fad4
    si4.\fermata

}

VIItestoIII = \lyricmode {

    Judi - cabit _ in nati - o - ni -- bus.

    in nati - o - ni -- bus.

    Im -- plebit _  ru -- inas _  im -- plebit _  ru -- inas _

    con -- quas -- sabit _ con -- quas -- sabit _ con -- quas -- sa -- bit ca -- pita _

    in terra _ in terra _ mul -- to -- rum im -- plebit _  im -- plebit _  ru -- inas _

    im -- plebit _  im -- plebit _  ru -- inas _

    con -- quas -- sabit _ con -- quas -- sabit _ con -- quas -- sa - bit

    ca -- pita _  in ter -- ra mul -- to -- rum in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIbasson = \relative do {

    \autoBeamOff
    R1*16
    la'4 re, re4. re8
    re4 re8 re la'2~\mbreak

    %19
    la sol
    fad1~
    fad4 mi8[re] dod2~

    %22
    dod~dod4 si8[la]
    sold4. sold8 la2\fermata
    R1*4

    %28
    re'4 re8. re16 re8[la fad re]
    la'8. la16 la4~ la r
    R1*4

    %34 presto
    r8 r si,
    fad' fad fad
    si, si si

    %37
    fad' fad fad
    si, si r
    si'[si,] si'\mbreak

    %40
    mi, mi r
    la[la,] la'
    re, re r

    %43
    si'[si,] si'
    dod,4.
    dod

    %46
    fad8. fad16 fad8
    r r fad
    fad fad fad\mbreak

    %49
    fad fad r
    re dod4
    fad4.

    %52
    r8 r fad
    sold sold sold
    sold? sold sold

    %55
    dod dod, r
    r r dod
    fad fad fad\mbreak

    %58
    fad fad fad
    si si, r
    R4.*2

    %62
    si8 si4
    mi8 mi r
    dod dod4

    %65
    fad8 fad r\mbreak
    fad8 fad4
    si,4.

    %68
    mi4 mid8
    fad8. fad16 fad8
    r r fad

    %71
    re'[lad] si
    mid, fad4
    si, si'8

    %74
    si si, si'\mbreak
    si si, r
    mid fad4

    %77
    si,4.\fermata

}

VIItestoIV = \lyricmode {

    Judi - cabit _ in nati - o - - - - - - ni -- bus.

    In nati - o -  ni -- bus.

    Im -- plebit _  ru -- inas _  im -- plebit _  ru -- inas _

    con -- quas -- sabit _ con -- quas -- sabit _ con -- quas -- sa -- bit ca -- pita _

    in terra _ in terra _ mul -- to -- rum im -- plebit _  im -- plebit _  ru -- inas _

    im -- plebit _  im -- plebit _  ru -- inas _

    con -- quas -- sabit _ con -- quas -- sabit _ con -- quas -- sa - bit

    ca -- pita _  in ter -- ra mul -- to -- rum in ter -- ra in ter -- ra mul -- to -- rum.

}

VIIbcn = \relative do {

    R1*8
    sol'4\f sol8[r16 sol] sol4 fad
    mi1

    %11
    la4 la8[r16 la] la4 sol
    fad8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]\mbreak
    re1~

    %14
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    re8[r16 re' re8 r16 la] la8[r16 fad fad8 r16 re]
    sold,2 la\fermata

    %17
    R1
    r2 la'~\mbreak
    la sol

    %20
    fad1~
    fad4 mi8 re dod2~
    dod~dod4 si8 la

    %23
    sold2 la\fermata
    R1*4
    re'4 re8. re16 re8 la fad re

    %29
    la'8. la16 la,4\tasto~la2^\p~
    la1~
    la~

    %32
    la~
    la\fermata
    si16\f si si' si si, si %34 presto

    %35
    fad fad fad' fad fad, fad
    si si si' si si, si
    fad fad fad' fad fad, fad

    %38
    si si si' si si, si
    si si si' si si, si\mbreak
    mi, mi mi' mi mi, mi

    %41
    la' la la, la la' la
    re, re re, re re' re
    si' si si, si si' si

    %44
    dod, dod dod, dod dod' dod
    dod dod dod, dod dod' dod
    fad, fad fad' fad fad, fad

    %47
    fad fad fad' fad fad, fad
    fad fad fad' fad fad, fad\mbreak
    fad fad fad' fad fad, fad

    %50
    re' re dod dod dod, dod
    fad fad fad' fad fad, fad
    fad fad fad' fad fad, fad

    %53
    sold sold sold' sold sold, sold
    sold? sold sold'? sold sold, sold
    dod dod dod' dod dod, dod

    %56
    dod dod dod' dod dod, dod
    fad, fad fad' fad fad, fad\mbreak
    fad fad fad' fad fad, fad

    %59
    si si si' si si, si
    si si si' si si, si
    si4 r8

    %62
    si16 si si' si si, si
    mi, mi mi' mi mi, mi
    dod' dod dod' dod dod, dod

    %65
    fad, fad fad' fad fad, fad\mbreak
    fad fad fad' fad fad, fad
    si si si' si si, si

    %68
    mi, mi mi' mi mid mid
    fad, fad fad' fad fad, fad
    fad fad fad' fad fad, fad

    %71
    re'' re lad lad si si
    mid, mid fad fad fad, fad
    si' si si, si si' si

    %74
    si si si, si si' si\mbreak
    si si si, si si' si
    mid, mid fad fad fad, fad

    %77
    si4.\fermata

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 45
    s1*33
    \bar "||"\break
    \once \override Score.RehearsalMark.extra-offset = #'(+8 . -1.0)
    \mark\markup\huge "Presto"
    \key si\minor
    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \tempo 4. = 53
    s4.*44
    \bar "|."

}

VIItp = {
    \notypeset
    <<\VIItpn \forma>>

}

VIIobI = {
    <<\VIIobIn \forma>>

}

VIIobII = {
    <<\VIIobIIn \forma>>

}

VIIvlI = {
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    <<\VIIvlIIn \forma>>

}

VIIvla = {
    \clef alto
    <<\VIIvlan \forma>>

}

VIIsoprano = {
    \new Voice = "iudicabit1"
    <<\VIIsopranon \forma>>

}

VIIalto = {
    \new Voice = "iudicabit2"
    <<\VIIalton \forma>>
}

VIItenore = {
    \new Voice = "iudicabit3"
    <<\VIItenoren \forma>>
}

VIIbasso = {
    \clef bass
    \new Voice = "iudicabit4"
    <<\VIIbasson \forma>>
}

VIIbc = {
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



VIIIvlIn = \relative do'' {

    sol16_\markup\italic"piano sempre" (la) sol(la) sol(la) sol(la) si(do) si(do) si(do) si(la)
    sol la sol la sol la sol la si do si do si do si la
    \once\stemUp sol8 si' si si do16 si do si do si do si

    %4
    la si la si la si do la si la si la si la si la\mbreak
    sol la sol la sol la si sol la sol la sol la sol la sol
    fad[mi re do si la sol fad] sol[la sol la sol la sol  la]

    %7
    sol[la sol la sol la sol  la] sol8 sol' r sol
    r fad r fad r fad r fad
    r sol, r sol\mbreak r fad r fad

    %10
    r fad r fad sol4 r
    si8 si si si si si si si
    si8 si si si si si si si

    %13
    si16 do si do si do si do red,8 mi dod dod\mbreak
    fad8[la16 si la si la si] la[si la si la si la si]
    \once\stemUp sol8 si' si si do do do do

    %16
    la16 si la si la si do la si8 si si si
    sol16 la sol la sol la si sol la8 la la la\mbreak
    re,16 mi re mi re mi re mi do re do re do re do si

    %19
    la si la si la si la si do re do re do re do la
    si8 si si si la la la la
    si si si si la la la si

    %22
    la la la la\mbreak si si la la
    si16 do si do si do si do re mi re mi re mi re do
    si do si do si do si do re mi re mi re mi re do

    %25
    si8[do16(re mi fad sol la] si8) sol la fad
    sol4 r si,8 si si si\mbreak
    si si si si la la la la

    %28
    la la la la si16 do si do si do si do
    la8 si la la si16 do si do si do si do
    si8 si si si si si si si\mbreak

    %31
    si si si si do do do do
    la la la la si si si si
    sol sol sol sol la la la la

    %34
    fad fad sol la sol16 la sol la sol la sol  la\mbreak
    si do si do si do si la sol la sol la sol la sol la
    si do si do si do si do red,8 red red si'

    %37
    si si si mi red red red red
    mi mi mi mi\mbreak red fad r sol
    r la r sol r fad r la

    %40
    r fad r red mi sol fad fad
    sol,16 la sol la sol la sol la si8 si si si
    si si si si\mbreak si si si si

    %43
    sol sol fad fad sol sol' r sol
    r fad r fad r fad r fad
    r si, r si r fad r fad

    %46
    r fad r fad\mbreak sol2\fermata

}

VIIIvlIIn = \relative do'' {

    mi,16_\markup\italic "piano sempre" (fad) mi(fad) mi(fad) mi(fad) sol(la) sol(la) sol(la) sol(fad)
    mi fad  mi fad mi fad mi fad sol la sol la sol la sol fad
    \once\stemUp mi8 sol' sol sol la16 sol la sol la sol la sol

    %4
    fad sol fad sol fad sol la fad sol fad sol fad sol fad sol fad\mbreak
    mi fad mi fad mi fad sol fad fad mi fad mi fad mi fad mi
    re do si la sol fad mi re mi[fad mi fad mi fad mi fad]

    %7
    mi[fad mi fad mi fad mi fad] mi8 mi' r mi
    r mi r mi r red r red
    r mi, r mi\mbreak r mi r mi

    %10
    r red r red mi4 r
    sol8 sol fad fad sol sol sol sol
    sol sol sol sol fad fad fad fad

    %13
    sol16 la sol la sol la sol la fad8 sol fad mi\mbreak
    red[fad16 sol fad sol fad sol] fad[sol fad sol fad sol fad sol]
    \once\stemUp mi8 sol' sol sol mi mi mi mi

    %16
    fad16 sol fad sol fad sol la fad re8 re re re
    mi16 fad mi fad mi fad sol mi do8 do do do\mbreak
    si16 do si do si do si do mi,8 mi mi mi

    %19
    fad16 sol fad sol fad sol fad sol la si la si la si la fad
    re8 re re sol sol sol fad fad
    re re re sol sol fad fad re

    %22
    fad fad fad fad\mbreak sol sol fad fad
    sol16 la sol la sol la sol la si do si do si do si la
    sol16 la sol la sol la sol la si do si do si do si la

    %25
    sol8[la16(si do re mi fad] sol8) si, do la
    sol4 r re8 re re re\mbreak
    re re re re re re re re

    %28
    re re re re sol16 la sol la sol la sol la
    fad8 sol re re sol16 la sol la sol la sol la
    sol8 sol fad fad sol sol sol sol\mbreak

    %31
    sol sol sol sol mi mi mi mi
    fad fad fad fad re re re re
    mi mi mi mi mi mi mi mi

    %34
    red red mi fad mi16 fad mi fad mi fad mi fad\mbreak
    sol la sol la sol la sol fad mi fad mi fad mi fad mi fad
    sol la sol la sol la sol la fad8 fad fad fad

    %37
    sol sol sol si la la la la
    si si do do\mbreak si red r mi
    r fad r mi r red r fad

    %40
    r red r si si mi red red
    mi,16 fad mi fad mi fad mi fad sol8 sol fad fad
    sol sol fad fad\mbreak sol sol sol sol

    %43
    mi mi red red mi mi' r mi
    r mi r mi r red r red
    r mi, r mi r mi r mi

    %46
    r red r red \mbreak mi2\fermata

}

VIIIvlan = \relative do' {

    si8 si si si si si si si
    si si si si si si si si
    si[sol'16 la(sol) la(sol fad)] mi8 mi mi do'

    %4
    do do do fad, re re re si'\mbreak
    si si si mi, do do do la'
    la la la si, si si si si

    %7
    si si si si si si' r si
    r do r do r si r si
    r si, r si\mbreak r do r do

    %10
    r si r si si4 r
    mi8 mi red red mi mi mi mi
    mi mi mi mi red red red red

    %13
    mi mi mi mi si mi lad, lad\mbreak
    si si si si si si si si
    mi mi mi mi la la la la

    %16
    re, re re re sol sol sol sol
    do, do do do fad fad fad fad\mbreak
    sol sol sol sol do, do do do

    %19
    re re re re re re re re
    sol sol sol sol re re re re
    sol sol sol sol re re re sol,

    %22
    re' re re re\mbreak sol do, re re,
    re' re re re re re re re
    re re re re re re re re

    %25
    re re re re re re mi re
    si4 r sol'8 sol sol sol\mbreak
    sol sol sol sol fad fad fad fad

    %28
    fad fad fad fad sol sol sol sol
    re sol, fad fad sol sol' sol sol
    mi mi red red mi mi mi mi\mbreak

    %31
    mi mi mi mi la, la la la
    re re re re sol sol sol sol
    do, do do do do do do do

    %34
    si si si si mi mi mi mi\mbreak
    mi mi mi mi mi mi mi mi
    mi mi mi mi si si si si

    %37
    mi mi mi mi fad fad fad fad
    sol sol la la\mbreak si,16 do si do si do si do
    si do si do si do si do si do si do si do si do

    %40
    si do si do si do si8 mi mi si' si,
    mi mi mi mi mi mi red red
    mi mi red red\mbreak mi mi mi mi

    %43
    la, la si si\footnote #' (-1 . 3) \markup\column\smaller {" da qui fino alla fine: parte di viola ripresa da: ”Two more new Vivaldi finds in Dresden”, J. B. Stockigt, M. Talbot" "  "} si si' r si
    r do r do r si r si
    r si, r si r do r do
    r si r si si2\fermata

}

VIIIalton = \relative do' {

    \autoBeamOff
    R1*9
    r2 mi4 sol
    si~ si16[la sol fad] mi[fad mi fad] mi[fad mi fad]

    %12
    sol[la sol la] sol[la sol la] si[la sol fad] si[la sol fad]
    sol8 mi r sol fad sol fad[(mi\tr)]\mbreak
    red4 r8 si fad' fad16 sol la8 fad

    %15
    sol4~sol16[mi sol si] do[si do si] la[sol fad mi]
    fad4~fad16 [re fad la] si[la si la] sol[fad mi re]\mbreak
    mi4~mi16[do mi sol] la[sol la sol fad mi re do]\mbreak

    %18
    si8 re4 sol8 mi la4 do8
    fad,16[mi] re8 r4 do la'
    si16[la sol fad] sol4~sol16[fad mi re] la'[fad mi re]

    %21
    si'[la sol fad] sol4~sol16[fad mi re] do[si' la sol]
    fad[re fad la] la[fad la do]\mbreak si8 la16[sol] fad4\tr
    sol r r2

    %24
    R1*2
    sol4 re sol~sol16[fad mi re]\mbreak
    sol[fad mi re] sol[fad mi re] la'4~la16[fad mi re]

    %28
    la'[fad mi re] la'[fad mi re] si'8  sol r sol
    fad sol re[do\tr] si4 r8 sol'
    si8 si16 si si[la] sol[fad] mi4~mi16[mi fad mi]\mbreak

    %31
    sol[mi fad mi] si'[mi, fad mi] do'8.[si16 la sol fad mi ]
    fad[re mi re] la'[re, mi re] si'8.[la16 sol fad mi re]
    mi[do re do] sol'[do, re do] la'8.[si16 la sol fad mi]

    %34
    si'8 si, r4 mi sol\mbreak
    si8 si, r4 mi sol8 mi
    si' si, r sol' fad16[mi] red[mi] fad[sol] la fad

    %37
    sol[fad mi fad] sol[la si sol] la[sol fad sol] la[si do la]
    si8[do16 si la sol fad mi]\mbreak red4\tr mi\tr
    fad\tr sol\tr la2~

    %40
    la8 si, fad' la sol fad16[mi] fad4\tr
    mi r mi16[fad sol la si la] sol[fad]
    mi[fad sol la] si[la sol fad]\mbreak mi[fad sol la si8] mi,

    %43
    sol4(fad\tr) mi2
    R1*3

}

VIIItestoII = \lyricmode {

    De tor -- ren - - - - - - - te in via _ bi -- bet, prop -- te -- rea _ e -- xal -- ta - - - - - - - - - - - - - - bit

    e -- xal -- ta - - - - - - - - bit ca -- put.

    De tor -- ren - - - - - - te in via _ bi -- bet, prop -- te -- rea _ e -- xal -- ta - - - - - - - - - - bit

    de tor -- ren -- te in via _ bi -- bet, prop -- te -- rea _ e -- xal -- ta - - - - - - - - -  bit

    e -- xal -- tabit _ ca -- put e -- xal -- ta - - bit ca -- put.

}

VIIIbcn = \relative do {

    mi8 mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    mi16 fad mi fad mi fad mi fad la,8 la' la la

    %4
    re, re re re sol sol sol sol\mbreak
    do, do do do fad fad fad fad
    si, si si si mi mi mi mi

    %7
    mi mi mi mi mi16[(fad) mi(fad) mi(fad) mi(sol)]
    la[si la si la si la do] si[do si do si do si si,]
    mi[fad mi fad mi fad mi fad] \mbreak la[si la si la si la do]

    %10
    si do si do si do si si, mi4 r
    mi8_\markup\italic"Senza Organi" mi red red mi mi mi mi
    mi mi mi mi red red red red

    %13
    mi mi mi mi si mi lad, lad\mbreak
    si si si si si si si si
    mi mi mi mi la la la la

    %16
    re, re re re sol sol sol sol
    do, do do do fad fad fad fad\mbreak
    sol sol sol sol do, do do do

    %19
    re re re re re re re re
    sol sol sol sol re re re re
    sol sol sol sol re re re sol,

    %22
    re' re re re\mbreak sol do, re re,
    sol_\markup\italic"Organo" sol sol sol sol sol sol sol
    sol sol sol sol sol sol sol sol

    %25
    sol sol sol sol sol sol' do, re
    sol,4 r sol'8_\markup\italic"Senza Organi" sol sol sol\mbreak
    sol sol sol sol fad fad fad fad

    %28
    fad fad fad fad sol sol sol sol
    re sol, fad fad sol sol' sol sol
    mi mi red red mi mi mi mi\mbreak

    %31
    mi mi mi mi la, la la la
    re re re re sol sol sol sol
    do, do do do do do do do

    %34
    si si si si mi mi mi mi\mbreak
    mi mi mi mi mi mi mi mi
    mi mi mi mi si si si si

    %37
    mi mi mi mi fad fad fad fad
    sol sol la la\mbreak si,16 do si do si do si do
    si do si do si do si do si do si do si do si do

    %40
    si do si do si do si8 mi mi si' si,
    mi mi mi mi mi mi red red
    mi mi red red\mbreak mi mi mi mi

    %43
    la, la si si mi16 fad mi fad mi fad mi sol
    la si la si la si la do si do si do si do si si,
    mi fad mi fad mi fad mi sol la si la si la si la do

    %46
    si do si do si do si si, mi2\fermata

}

VIIIbfn = \figures {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*43
    s2 <_+>
    s1
    <_+>

}


forma = {

    \time 4/4
    \key mi\minor
    \tempo 4 = 55
    s1*46
    \bar "|."

}

VIIIvlI = {
    \notypeset
    <<\VIIIvlIn \forma>>

}

VIIIvlII = {
    <<\VIIIvlIIn \forma>>

}

VIIIvla = {
    \clef alto
    <<\VIIIvlan \forma>>

}

VIIIalto = {
    \new Voice = "torrente"
    <<\VIIIalton \forma>>
}

VIIIbc = {
    \clef bass
    <<\VIIIbcn \forma \VIIIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



IXvlIn = \relative do'' {

    r8 mi la~
    la sold16 fad sold8
    fad4.

    %4
    mi8 la la,
    re4.~
    re8 dod16 si dod8

    %7
    si4 r8
    fad fad'4
    sold8 la la,\mbreak

    %10
    sold16 la si8 la
    sold' la la,
    sold16 la si8 la

    %13
    sold sold' la
    red, mi si
    dod16 la' dod,8 si

    %16
    la4 r8
    R4.*11
    mi8 mi mi

    %29
    mi mi mi
    mi mi mi
    mi mi mi

    %32
    mi mi mi
    dod'16 si dod re mi8\mbreak
    R4.*4

    %38
    r8 si mi~
    mi red16 dod red8
    dod4.

    %41
    si8 mi mi,
    la'4.~
    la8 sold16 fad sold8

    %44
    fad16 mi fad sold la8
    sold la fad
    mi4 r8

    %47
    R4.*5
    si16 la si dod re8
    dod4 r8

    %54
    R4.*2
    re16 dod re mi fad8
    R4.*3

    %60
    mi,8 mi mi
    mi mi mi
    mi mi mi

    %63
    si'16 la si dod re8
    R4.*14
    dod16 si dod re mi re

    %79
    dod16 si dod re mi re
    dod4 r8
    R4.*6

    %87
    mi,16 re mi fad sold mi
    la sold la si dod la
    mi4 r8

    %90
    la16 re, mi8 \parenthesize mi
    r8 mi' la~
    la8 sold16 fad sold8

    %93
    fad4.
    sold8 la la,
    sold16 la si8 la\mbreak

    %96
    sold' la la,
    sold16 la si8 la
    sold sold' la

    %99
    red, mi si
    dod16 la' dod,8 la
    la4.\fermata

}

IXvlIIn = \relative do'' {

    R4.
    r8 mi, mi'~
    mi re16 dod re8~

    %4
    re dod16 si dod8~
    dod si16 la si8
    la la16 sold la8

    %7
    sold mi mi'~
    mi re16 dod re8~
    re dod16 si dod8\mbreak

    %10
    si16 dod re8 dod
    si mi16 re dod8
    si dod16 re dod8

    %13
    si4 la8~
    la sold16 fad sold8
    la4 sold8

    %16
    la4 r8
    R4.*11
    mi8 mi mi

    %29
    mi mi mi
    mi mi mi
    mi mi mi

    %32
    mi mi mi
    la16 sold la si dod8\mbreak
    R4.*5

    %39
    r8 si si'~
    si la16 sold la8~
    la sold16 fad sold8~

    %42
    sold fad16 mi fad8\mbreak
    mi mi16 red mi8
    red16 dod red mi fad8

    %45
    mi fad red
    mi4 r8
    R4.*5

    %52
    sold,16 fad sold la si8
    la4 r8
    R4.*2

    %56
    si16 lad si dod re8
    R4.*3

    %60
    mi,8 mi mi
    mi mi mi
    mi mi mi

    %63
    sold16 fad sold la si8
    R4.*14
    la16 sold la si dod si

    %79
    la sold la si dod si
    la4 r8
    R4.*6

    %87
    mi16 re mi fad sold mi
    la sold la si dod la
    mi4 r8

    %90
    la16 re, mi8 \parenthesize mi
    la,4 r8
    r mi' mi'~

    %93
    mi re16 dod re8~
    re dod16 si dod8
    si16 dod re8 dod\mbreak

    %96
    si mi16 re dod8
    si16 dod re8 dod
    si4 la8~

    %99
    la sold16 fad sold8
    la4 sold8
    la4.\fermata

}

IXvlan = \relative do' {

    dod8 mi dod
    si4 sold'8
    la4.~

    %4
    la8 mi dod
    re mi4~
    mi8 la mi~

    %7
    mi si sold
    la4 fad'8
    si dod fad,\mbreak

    %10
    sold mi fad
    sold mi4
    sold8 mi fad

    %13
    si, mi4
    fad16 red si8 sold
    mi mi' mi

    %16
    dod4 r8
    R4.*11
    mi8 mi mi

    %29
    mi mi mi
    mi mi mi
    mi mi mi

    %32
    mi mi mi
    mi mi mi\mbreak
    R4.*4

    %38
    sold8 si sold
    fad4 red8
    mi4.~

    %41
    mi8 si' sold
    la si4~\mbreak
    si8 mi si

    %44
    si4.
    si8 dod si
    sold4 r8

    %47
    R4.*5
    mi8 mi mi
    mi4 r8

    %54
    R4.*2
    fad8 fad fad
    R4.*3

    %60
    mi8 mi mi
    mi mi mi
    mi mi mi

    %63
    mi mi mi
    R4.*14
    mi8 mi mi

    %79
    mi mi mi
    mi4 r8
    R4.*6

    %87
    mi16 re mi fad sold mi
    la sold la si dod la
    mi4 r8

    %90
    la16 re, mi8 mi,
    dod' mi dod
    si4 sold'8

    %93
    la4 fad8
    si dod fad,
    sold mi fad\mbreak

    %96
    sold mi4
    sold8 mi fad
    si, mi4

    %99
    fad16 re si8 sold
    mi mi' mi
    dod4.\fermata

}

IXsopranon = \relative do'' {

    \autoBeamOff
    R4.*15
    la8 dod la
    si mi, mi'~

    %18
    mi re dod16[si]\mbreak
    dod16 si la4
    R4.*2

    %22
    la8[dod] la
    mi'4.~
    mi8 re16 dod re8~

    %25
    re[dod16 si dod8]~
    dod[si16 la si8]~
    si[la16 sold la8]

    %28
    \tuplet 3/2 { sold16 [la si] si [la sold] sold [la si]
    la[si dod] dod[si la] la[si dod]
    si[dod re] re[dod si] si[dod re]

    %31
    dod[re mi] mi[re dod] dod[re mi]}
    re8 [dod si]
    dod4 r8\mbreak

    %34
    dod fad[mi]
    red4.
    mi~

    %37
    mi16 fad red4\tr
    mi r8
    R4.*7

    %46
    mi,8 sold mi
    dod'8 si4
    mi8 red16[dod] si[la]

    %49
    sold fad mi4
    R4.*3
    mi'8 dod[si]

    %54
    lad4.~
    lad8 si dod
    re16[dod] re8 r

    %57
    re si[la]
    sold4.~
    sold8 la si\mbreak

    %60
    \tuplet 3/2 { dod16[re mi] mi[re dod] dod[re mi]
    si[dod re]re[dod si] si[dod re]
    dod[re mi] mi[re dod] dod[re mi]}

    %63
    si4 r8
    mi[re] dod
    si[dod re]

    %66
    mi[re] dod
    si mi4~
    mi8[re16 dod re8]\mbreak

    %69
    dod[mi la,]
    si dod4
    re8[fad si,]

    %72
    dod red4
    mi8[re!16 dod re8]
    dod4.

    %75
    re
    mi16 fad mi[re] dod[si]
    dod re si4\tr \mbreak

    %78
    la4 r8
    r mi' mi
    mi fad re

    %81
    \tuplet 3/2 { dod16[re mi] } mi4
    \tuplet 3/2 { dod16[re mi] mi[re dod] re[dod si]
                  dod[re mi]} mi4

    %84
    \tuplet 3/2 { dod16[re mi] mi[re dod] re[dod si]}
    dod8 dod16[si] dod(re)\mbreak
    mi8 re dod

    %87
    re4.
    dod
    \tuplet 3/2 { si16[dod re] re[dod si] si[dod re] }

    %90
    dod[re] si4
    la r8
    R4.*10

}

IXtestoI = \lyricmode {

    Glo -- ria _ Pa -- tri Pa -- tri, et Fili - o et Spi -- ri -- tui _ San - - - - - - - - - - - - - cto

    et Spi -- ri -- tu -- i  San -- cto.

    Glo -- ria _ Pa -- tri Pa -- tri, et Fili - o et Spi -- ri -- tu -- i  San -- cto et Spi -- ri -- tu -- i

    San - - - - - - - - cto et Spi -- ri -- tu -- i  San - - - - - - - - - - cto

    et Spi -- ri -- tui _  San -- cto et Spi -- ri -- tu -- i  San - - - - - - - - - cto

    et Spi -- ri -- tu -- i  San - - - - - - cto.

}

IXsopranoIn = \relative do'' {

    \autoBeamOff
    R4.*18
    la8 dod la
    si mi, mi'~

    %21
    mi re dod16[si]
    dod si la4
    la8[dod] la

    %24
    fad'4 mi16[re]
    mi4 re16[dod]
    re4 dod16[si]\mbreak

    %27
    dod4 si16[la]
    \tuplet 3/2 { si[dod re] re[dod si] si[dod re]
    dod[re mi] mi[re dod] dod[re mi]

    %30
    sold,[la si] si[la sold] sold[la si]
    la[si dod] dod[si la] la[si dod]}
    si8[la sold]

    %33
    la4 r8\mbreak
    R4.
    fad8 si[la]

    %36
    sold4 sold8~
    sold16 la fad4
    mi r8

    %39
    R4.*10
    mi8 sold mi
    dod' si4\mbreak

    %51
    mi8 red16[dod] si[la]
    sold fad mi4
    R4.

    %54
    mi'8 dod[lad?]
    fad sold lad
    si16[lad] si8 r

    %57
    R4.
    re8 si[sold]
    mi fad sold\mbreak

    %60
    \tuplet 3/2 { la16[si dod] dod[si la] la[si dod]
    sold[la si] si[la sold] sold[la si]
    la[si dod] dod[si la] la[si dod]}

    %63
    sold4 r8
    dod8[si] la
    sold[la si]

    %66
    dod[si] la
    sold4 mi8
    fad sold4\mbreak

    %69
    la4.~
    la8 sol16[fad sol8]
    fad si4~

    %72
    si8[la16 sold! la8]
    sold4.
    la

    %75
    si
    dod16 re dod[si] la[sold]
    la si sold4\tr \mbreak

    %78
    la4 r8
    r dod dod
    dod re si

    %81
    \tuplet 3/2 { la16[si dod] } dod4
    \tuplet 3/2 { la16[si dod] dod[si la] si[la sold]
    la[si dod]} dod4

    %84
    \tuplet 3/2 { la16[si dod] dod[si la] si[la sold]}
    la8 la16[sold] la(si)\mbreak
    dod8 si la

    %87
    si4.
    la
    \tuplet 3/2 { sold16[la si] si[la sold] sold[la si] }

    %90
    la[si] sold4
    la r8
    R4.*10

}

IXtestoII = \lyricmode {

    Glo -- ria _ Pa -- tri Pa -- tri, et Fili - o et Spi -- ri -- tui San - - - - - - - - - - - - - - - - - - cto

    et Spi -- ri -- tu -- i  San -- cto.

    Glo -- ria _ Pa -- tri Pa -- tri, et Fili - o et Spi -- ri -- tu -- i  San -- cto et Spi -- ri -- tu -- i

    San - - - - - - - - cto et Spi -- ri -- tu -- i  San - - - - - - - - - - cto

    et Spi -- ri -- tui _  San -- cto et Spi -- ri -- tu -- i  San - - - - - - - - - cto

    et Spi -- ri -- tu -- i  San - - - - - - cto.

}

IXbcn = \relative do {

    la8 dod la
    mi' sold mi
    re re' re,

    %4
    la' dod, la
    si sold' mi
    la dod, la

    %7
    mi' sold mi
    re re' re,
    mi la, red\mbreak

    %10
    mi mi, red'
    mi dod' la
    mi mi, red'

    %13
    mi re dod
    si mi mi,
    la mi' mi,

    %16
    la4 r8
    mi' sold mi
    fad si, sold\mbreak

    %19
    la4 r8
    mi' sold mi
    fad si, sold

    %22
    la4 r8
    la4 r8
    la' si4

    %25
    sold8 la4
    fad8 sold4\mbreak  %%% fine p. 78 bar 26
    mi8 fad red

    %28
    mi4 r8
    R4.*4
    la,8 la' la,\mbreak

    %34
    la4.
    si
    mi8 sold mi

    %37
    la si si,
    mi sold mi
    si' red si

    %40
    la la, la'
    mi' sold, mi
    fad red' si\mbreak

    %43
    mi sold, mi
    si'4.
    mi,8 la, si

    %46
    mi,4 r8
    mi' sold mi
    dod' la red,

    %49
    mi4 r8
    mi sold mi
    dod' la red,

    %52
    mi mi' mi,
    la,4 r8
    fad'4.~

    %55
    fad4 fad,8
    si si' si,
    si4 r8

    %58
    mi4.~
    mi4 mi,8\mbreak
    la4 r8

    %61
    R4.*2
    mi8 mi' mi,
    la16 si dod8 re?

    %65
    mi8. re16 dod si
    la si dod8 red
    mi4 dod'8

    %68
    re mi mi,\mbreak
    la la, dod
    re mi la,

    %71
    re4 red8
    mi fad si,
    mi sold mi

    %74
    la16 si dod si la8
    mi16 fad sold fad mi8
    la, mi' mi,

    %77
    la16[re] mi8 mi,\mbreak
    la la la
    la la la

    %80
    la re mi
    la, la' la,
    la la' mi

    %83
    la, la' la,
    la' la, mi'
    la dod, si\mbreak

    %86
    la4.
    mi'4 r8
    R4.*3

    %91
    la,8 dod la
    mi' sold mi
    re re' re,

    %94
    mi la, red
    mi mi, red'\mbreak
    mi dod' la

    %97
    mi mi, red'
    mi red? dod
    si mi mi,

    %100
    la mi' mi,
    la4.\fermata

}

IXbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 3/8
    \override Staff.TimeSignature.style = #'single-digit
    \key la\major
    \tempo 4. = 53
    s4.*101
    \bar "|."

}

IXvlI = {
    \notypeset
    <<\IXvlIn \forma>>

}

IXvlII = {
    <<\IXvlIIn \forma>>

}

IXvla = {
    \clef alto
    <<\IXvlan \forma>>

}

IXsoprano = {
    \new Voice = "gloria1"
    <<\IXsopranon \forma>>
}

IXsopranoI = {
    \new Voice = "gloria2"
    <<\IXsopranoIn \forma>>
}

IXbc = {
    \clef bass
    <<\IXbcn \forma \IXbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



XvlIn = \relative do'' {

    re8[r16 re la8 r16 la] fad8[r16 fad re8 r16 re]
    la''8.[la16 mi8. mi16] dod8.[dod16 la8. la16]
    re'8.[re16 si8. si16] sol8.[sol16 re8. re16]

    %4
    dod4 r dod r
    re8.[re16 la8. la16] fad8.[fad16 re8. re16]\mbreak
    la''8.[la16 mi8. mi16] dod8.[dod16 la8. la16]

    %7
    re'8.[re16 si8. si16] sol8.[sol16 re8. re16]
    dod4 r r16 la re fad la4
    r16 la, dod mi la4 r16 re, fad la re4

    %10
    r16 dod, mi la dod4 r16 la, re fad la4\mbreak
    r16 la, re mi la4 fad16 fad8. fad16 fad8.
    la16[sol fad mi re dod si la] fad'16 fad8. fad16 fad8.

    %13
    la16[sol fad mi re dod si la] fad'8 fad mi mi
    fad16[mi re dod si la sol fad] fad'8 fad mi mi
    fad1\fermata

}

XvlIIn = \relative do'' {

    la8[r16 la fad8 r16 fad] re8[r16 re la8 r16 la]
    mi''8.[mi16 dod8. dod16] la8.[la16 mi8. mi16]
    si''8.[si16 sol8. sol16] re8.[re16 si8. si16]

    %4
    mi4 r mi r
    la,8.[la16 fad8. fad16] re8.[re16 la8. la16]
    mi''8.[mi16 dod8. dod16] la8.[la16 mi8. mi16]

    %7
    si''8.[si16 sol8. sol16] re8.[re16 si8. si16]
    mi4 r r r16 la, re fad
    la4 r16 la, dod mi fad4 r16 re fad la

    %10
    dod4 r16 dod, mi la fad 4 r16 la, re fad\mbreak
    mi4 r16 la, dod mi re16 re8. re16 re8.
    fad16[mi re dod si la sol fad] re'16 re8. re16 re8.

    %13
    fad16[mi re dod si la sol fad] re'8 re dod dod
    re16[dod si la sol fad mi re] re'8 re dod dod
    re1\fermata

}

Xvlan = \relative do' {

    fad8[r16 fad re8 r16 re] la8[r16 la fad8 r16 fad]
    dod''8.[dod16 la8. la16] mi8. [mi16 dod8. dod16]
    sol'8.[sol16 re8. re16] si8.[si16 sol8. sol16]

    %4
    la4 r la r
    fad'8.[fad16 re8. re16] la8.[la16 fad8. fad16]
    dod''8.[dod16 la8. la16] mi8. [mi16 dod8. dod16]

    %7
    sol'8.[sol16 re8. re16] si8.[si16 sol8. sol16]
    la4 r  fad'8 la sol fad
    mi fad mi dod fad la sol fad

    %10
    mi fad mi dod fad la sol fad\mbreak
    dod re mi dod la' la la la
    la la la la la la la la

    %13
    la la la la la la la la
    la la la la la la la la
    la1\fermata

}

Xsopranon = \relative do'' {

    \autoBeamOff
    R1*4
    fad,4 fad la la\mbreak
    dod dod mi8. mi16 mi8 mi

    %7
    re4 re re2
    dod4 r r2
    la4 dod re re8 re

    %10
    mi4 mi fad2
    mi re4 re
    re1~

    %13
    re4 re re dod
    re r re dod
    re1\fermata

}

XtestoI = \lyricmode {

    Sicut _ erat _ in princi - pio _ et nunc et sem -- per

    et in sæ -- cula _ sæcu - lo -- rum sæcu - lo -- rum

    a - men a - men.

}

Xalton = \relative do' {

    \autoBeamOff
    R1*4
    re4 re fad fad\mbreak
    la  la dod8. dod16 dod8 dod

    %7
    sol4 sol sol2
    mi4 r re fad
    la la8 la la4 la

    %10
    dod2 la\mbreak
    la fad4 fad
    fad1~

    %13
    fad4 fad fad mi
    fad r fad mi
    fad1\fermata

}

XtestoII = \lyricmode {

    Sicut _ erat _ in princi - pio _ et nunc et sem -- per

    et in sæ -- cula _ sæcu - lo - rum sæcu - lo -- rum

    a - men a - men.

}

Xtenoren = \relative do' {

    \autoBeamOff
    R1*4
    la4 la re re\mbreak
    mi mi dod8. dod16 dod8 dod

    %7
    re4 re re sol,
    la r r2
    R1

    %10
    la4 dod re8 re16 re re8 re\mbreak
    re4 dod la la
    la1~

    %13
    la4 la la2
    la4 r la2
    la1\fermata

}

XtestoIII = \lyricmode {

    Sicut _ erat _ in princi - pio _ et nunc et sem - per

    et in sæ -- cula _ sæcu - lo -- rum sæcu - lo -- rum

    a -- men a -- men.

}

Xbasson = \relative do {

    \autoBeamOff
    R1*4
    re4 re re re
    dod dod dod8. dod16 dod8 dod

    %7
    si4 si si2
    la4 r r2
    r re4 fad

    %10
    la la8 la re, re re4\mbreak
    la2 re4 re
    re1~

    %13
    re4 re la' la,
    re r la' la,
    re1\fermata

}

XtestoIV = \lyricmode {

    Sicut _ erat _ in princi - pio _ et nunc et sem -- per

    et in sæ -- cula _ sæcu - lo -- rum sæcu - lo -- rum

    a - men a - men.



}

Xbcn = \relative do {

    re16\f[mi fad sol la si dod re] re,[mi fad sol la si dod re]
    dod,[re mi fad sol la si dod] dod,[re mi fad sol la si dod]
    si,[dod re mi fad sol la si] si,[dod re mi fad sol la si]

    %4
    la,[si dod re mi fad sol la] la,4 r
    re16[mi fad sol la si dod re] re,[mi fad sol la si dod re]\mbreak
    dod,[re mi fad sol la si dod] dod,[re mi fad sol la si dod]

    %7
    si,[dod re mi fad sol la si] si,[dod re mi fad sol la si]
    la,[si dod re mi fad sol la] re,8 fad mi re
    la' sol la la, re fad mi re

    %10
    la' sol la la, re fad mi re\mbreak
    la si dod la re16[mi fad sol la si dod re]
    re,8 re re re re16[mi fad sol la si dod re]

    %13
    re,8 re re re la' la la, la
    re re re re la' la  la, la
    re,1\fermata

}

Xbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 50
    s1*15
    \bar "|."

}

XvlI = {
    %\notypeset
    <<\XvlIn \forma>>

}

XvlII = {
    <<\XvlIIn \forma>>

}

Xvla = {
    \clef alto
    <<\Xvlan \forma>>

}

Xsoprano = {
    \new Voice = "sicut1"
    <<\Xsopranon \forma>>
}

Xalto = {
    \new Voice = "sicut2"
    <<\Xalton \forma>>
}

Xtenore = {
    \new Voice = "sicut3"
    <<\Xtenoren \forma>>
}

Xbasso = {
    \clef bass
    \new Voice = "sicut4"
    <<\Xbasson \forma>>
}

Xbc = {
    \clef bass
    <<\Xbcn \forma \Xbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}



XIvlIn = \relative do'' {

    re2 dod
    do si
    mi4 re dod8[si16 la si8 dod]

    %4
    re2~\mbreak re4 dod
    si2 la
    r4 mi'8 re dod si16 la si8 dod

    %7
    re re fad mi red dod16 si dod8 red\mbreak
    mi mi r mi16[re] dod[si la si] dod[si dod la]
    mi'4 re~re dod

    %10
    re r r2\mbreak
    re4~re16[do si la] sol2
    mi'4~mi16[re dod? si] la2

    %13
    r mi'8 mi mi mi16 mi\mbreak
    re8 re re re dod la r4
    r2 mi'4~mi16[re dod si]

    %16
    la2 fad'4~fad16[mi red dod]\mbreak
    si2 dod4 dod
    dod8 dod16 dod re8 re si si mi4

    %19
    la, re2 do4\mbreak
    si mi2 re4
    dod? fad2 mi4\mbreak

    %22
    re2~re4 dod8[si]\mbreak
    la4 la8 la sold sold sold4
    fad' r dod'2

    %25
    lad si\mbreak
    sold4 la2 sold4
    la la,16 si dod re mi8 mi, sold'[fad]

    %28  OOKK
    mi re16 dod re8 mi fad fad la sol\mbreak
    fad mi16 red mi8 fad sold sold r4
    r2 si8 si8 si8 si16 si
    la8 la la la sol! mi mi16[fad sol la]

    %32
    si8 si, r4 si'~si16[la sol fad]
    mi2 dod'!4~dod16[si lad sold]
    fad2 r\mbreak

    %35
    fad8 fad fad fad16 fad mi8 mi mi mi
    re si re16[mi fad sol] dod,4 lad'8 sol
    fad mi16 red mi8 fad si, si si' la\mbreak

    %38
    sol fad16 mi fad8 sol dod, dod r lad'16[sol]
    fad[mi re mi] fad[mi fad re] dod2~
    dod fad\mbreak

    %41
    mid mi
    red sold4 fad
    mid8[re16 dod re8 mid] fad4 mi\mbreak

    %44
    re sol!2 fad4~
    fad mi2 re4~
    re dod la'8 la sold4\mbreak

    %47
    dod,16 si dod re mi re mi dod re dod re mi fad mi fad re
    mi4 la2 sol!4~
    sol fad mi2\mbreak
    re4 r r la'

    %51
    sold sol fad si
    mi, la2 sold4
    la mi2 la4

    %54
    fad mi fad re\mbreak
    mi fad sol2
    fad4 r la4~la16[sol fad mi]

    %57
    re2 si'4~si16[la sold fad]
    mi4 la8 sol? fa mi16 re mi8 fad?\mbreak
    sol sol si la sold fad16 mi fad8 sold

    %60
    la la la4 sold sol
    fad re mi fad\mbreak
    sol si la la

    %63
    sold mi fad sold
    la~la16[sol! fad mi] re2\mbreak
    si'4~si16[la sol fad] mi2

    %66
    dod'4~dod16[si la sol] fad4 r
    r la si2\mbreak
    dod4 la sold la

    %69
    si mi, fad la
    sold2 la
    si4 mi, fad la

    %72
    sold2 la\mbreak
    fad8[mi fad sol?] la2~
    la la

    %75
    la4 la la la
    fad8[mi fad sol] la2~
    la la

    %78
    la4 la\mbreak la2
    la1\fermata

}

XIvlIIn = \relative do'' {

    R1*4
    r2 la'
    sold sol

    %7
    fad si4 la\mbreak
    sold8[fad16 mi] fad8[sold] la2
    sol?4 fad mi2

    %10
    re r4 la'8 sol\mbreak
    fad mi16 re mi8 fad sol sol si la
    sold fad16 mi fad8 sold la la r8 la16[sol?]

    %13
    fad[mi re mi] fad[mi fad re] sold4 \parenthesize la~\mbreak
    la sold la r
    r4 sold8 fad mi re16 dod re8 mi

    %16
    fad fad la sold fad mi16 red? mi8 fad\mbreak
    sold sold la8[si] mi,4 r
    la8 la la la16 la sol8 sol sol sol

    %19
    fad re r la' la la16 la la8 fad\mbreak %% fine p 96
    re re r si' si si16 si si8 sold
    mi mi r8 dod' \parenthesize dod dod16 dod dod8 lad

    %22
    fad fad sold la? si4 sold\mbreak
    dod,8 dod fad fad fad4(mid)
    fad2 mid

    %25
    mi! red\mbreak
    re!4 dod si2
    dod4 \parentSlur (dod16) re mi fad si,8 sold r4

    %28
    mi'~mi16[re dod si] la2\mbreak

    %29
    fad'4~fad16[mi red? dod] si8[la16 sold la8 si]
    dod[dod16 re mi re mi dod] fad4 mi
    r2 mi\mbreak

    %32
    red re
    do fad4 mi
    red?8[dod16 si dod8 red!] mi2~\mbreak

    %35
    mi4 re dod2
    si r4 fad'8 mi
    red dod16 si dod8 red mi mi sol! fad\mbreak

    %38
    mid red16 dod red8 mid fad fad r fad16[mi?]
    re[dod si dod] re[dod re si] mid4 fad~
    fad mid fad la,16[si] dod[re]\mbreak

    %41
    sold,4 sold8 dod dod si16 lad si8 dod
    fad, fad fad' mi red dod16 sid dod8 red
    sold, sold r dod16 dod dod[si dod re] dod[si] lad[sold?]\mbreak

    %44
    fad8 fad r4 mi' la,
    re sol,! dod fad,
    si8 si dod dod dod4 si\mbreak

    %47  OOKK
    la16 sold la si dod si dod la si la si dod re dod re si
    dod2 si
    dod4 re2 dod4\mbreak

    %50
    re re dod do
    si mi la, re~
    re dod? si2
    la4 la si dod

    %54
    re do2 si4	\mbreak
    dod? re2 dod4
    re r do2

    %57
    si re
    dod?4 dod8 si la sol16 fad sol8 la\mbreak
    si si re dod si la16 sold la8 si

    %60
    dod dod la4 si dod
    re re dod do\mbreak
    si si dod? red

    %63
    mi mi red re
    dod4~dod16[si la sol] fad2\mbreak
    re'4~re16[dod si la] sol2

    %66
    mi'4~mi16 [re dod si] la4 r
    mi'1~\mbreak
    mi4 re8[dod] si4 dod8[re]

    %69
    mi4 dod mi la,
    si2 dod8[si dod re]
    mi4 dod re la

    %72
    si2 dod4 mi\mbreak
    re la la8[sol la si]
    dod[si dod re] mi[re mi dod]

    %75
    fad4 fad mi2
    fad4 r la,8[sol la si]
    dod[si dod re] mi[re mi dod]

    %78
    fad4 fad\mbreak mi2
    fad1\fermata

}

XIvlan = \relative do' {

    R1*3
    r2 mi8 [mi mi mi16 mi]
    re8 re re re dod la r4

    %6
    mi'~mi16[re dod si] la4 r
    fad'~fad16[mi re dod] si4 r\mbreak
    mi4~mi16[re dod si] la8 [la16 la la8 si]

    %9
    dod la r4 r2
    re dod\mbreak
    do si

    %12
    mi4 re dod?8[si16 la si8 dod]
    re2~re4 dod\mbreak
    si2 la4 r

    %15
    r mi'8 re dod si16 la si8 dod
    re re mi mi red dod16 si dod8 red\mbreak
    mi mi r mi16[re] dod[si la si] dod[si dod la]

    %18
    mi'4 re2 dod4
    re r8 fad,16[sol] la[sol fad sol] la[sol la fad]\mbreak
    si4 r8 sol16[la] si[la sold la] si[la si sold]

    %21
    dod4 r8 la16[si] dod[si la si] dod[si dod la]
    re8[dod si la] sold2\mbreak
    la4 dod8 dod re re dod4

    %24
    dod8[la'16 si dod si dod la] sold8[mid16 fad sold fad sold mid]
    dod8[lad'16 si dod si dod lad] fad8[red16 mi fad mi fad red]
    si8 si'16 sold mi8 mi16 dod fad mi fad re sold8 mi
    mi4 r r mi8 re

    %28
    dod si16 la si8 dod re re fad mi\mbreak
    red dod16 si dod8 red mi mi r mi16 re?
    dod[si la si] dod[si dod la] red4 mi~

    %31
    mi red mi2\mbreak  %%fine p. 100
    r4 red8 dod si la16 sol la8 si
    do do mi re! dod?8 si16 la si8 dod

    %34
    red red r red16 [dod] si[la sol la] si[la si sol]\mbreak
    dod4 re r2
    si lad

    %37
    la!  sol!\mbreak
    dod4 si lad8[sold16 fad sold8 lad]
    si2~si4 la?

    %40
    sold2 fad4 fad16[sold la si]\mbreak
    dod8 dod, dod' si lad sol!16 fad sold8 lad?
    si si red dod sid lad16 sold lad8 sid

    %43
    dod dod \parenthesize r sold16 sold fad8 fad dod'4\mbreak
    re4 r8 re dod16[si dod re] dod[si dod la]
    si[la si dod] si[la si sol] la[sol! la si] la[sol la fad]

    %46
    sold4 mi8 mi'16 mi fad8 fad mi4\mbreak
    mi4. mi8 fad4 si8 sold
    mi8[dod16 re mi re mi dod] fad[mi fad re] sol![fad sol mi]

    %49
    mi[re mi dod] fad[sol la fad] si8 si la la\mbreak
    fad4 r r2
    R1*2

    %53
    r4 dod si mi
    la,2~la4 si\mbreak
    la2 sol4 mi'

    %56
    la, dod8 si la sol16 fad sol8 la
    si si re dod si la16 sold la8 si
    dod dod r4 la~la16[sol fad mi]\mbreak

    %59
    re2 si'4~si16[la sold fad]
    mi4 la8 la mi' mi16 mi la,8 la
    re8 re r4 r2\mbreak

    %62
    r4 si8 si fad' fad16 fad si,8 si
    mi mi r4 r2
    r4 la,8 la la la16 la la8 la\mbreak

    %65
    si8 si si si si si16 si si8 si
    dod dod dod dod re re re4
    dod do si fad'\mbreak

    %68
    la,4 re2 dod4
    si la2 re4~
    re mi2 dod4

    %71
    si la2 re4~
    re mi2 dod4\mbreak
    la re2 fad4

    %74
    mi2 mi
    re4 re re dod
    re2. fad4

    %77
    mi2 mi
    re4 re\mbreak re(dod)
    re1\fermata

}

XIsopranon = \relative do'' {

    \autoBeamOff
    re2 dod
    do si
    mi4 re dod8[si16 la si8 dod]

    %4
    re2~\mbreak re4 dod
    si2 la
    r4 mi'8 re dod si16 la si8 dod

    %7
    re re fad mi red dod16 si dod8 red\mbreak
    mi mi r mi16[re] dod[si la si] dod[si dod la]
    mi'4 re~re dod

    %10
    re r r2\mbreak
    re4~re16[do si la] sol2
    mi'4~mi16[re dod? si] la2

    %13
    r mi'8 mi mi mi16 mi\mbreak
    re8 re re re dod la r4
    r2 mi'4~mi16[re dod si]

    %16
    la2 fad'4~fad16[mi red dod]\mbreak
    si2 dod4 dod
    dod8 dod16 dod re8 re si si mi4

    %19
    la, re2 do4\mbreak
    si mi2 re4
    dod? fad2 mi4\mbreak

    %22
    re2~re4 dod8[si]\mbreak
    la4 la8 la sold sold sold4
    la2 r

    %25
    R1*2
    r4 la16[si dod re] mi8 mi, r4
    mi'~mi16[re dod si] la2\mbreak

    %29
    fad'4~fad16[mi red? dod] si8[la16 sold la8 si]
    dod[dod16 re mi re mi dod] fad4 mi
    r2 mi\mbreak

    %32
    red re
    do fad4 mi
    red?8[dod16 si dod8 red!] mi2~\mbreak

    %35
    mi4 re dod2
    si r4 fad'8 mi
    red dod16 si dod8 red mi mi sol! fad\mbreak

    %38
    mid red16 dod red8 mid fad fad r fad16[mi?]
    re[dod si dod] re[dod re si] mid4 fad~
    fad mid fad la,16[si] dod[re]\mbreak

    %41
    sold,4 sold8 dod dod si16 lad si8 dod
    fad, fad fad' mi red dod16 sid dod8 red
    sold, sold r dod16 dod dod[si dod re] dod[si] lad[sold?]\mbreak

    %44
    fad8 fad r4 mi' la,
    re sol,! dod fad,
    si8 si dod dod dod4 si\mbreak

    %47  OOKK
    dod2 r
    R1*2\mbreak
    r4 re dod do

    %51
    si mi la, re~
    re dod si2
    la4 la si dod

    %54
    re do2 si4	\mbreak
    dod? re2 dod4
    re r do2

    %57
    si re
    dod?4 dod8 si la sol16 fad sol8 la\mbreak
    si si re dod si la16 sold la8 si

    %60
    dod dod la4 si dod
    re re dod do\mbreak
    si si dod? red

    %63
    mi mi red re
    dod4~dod16[si la sol] fad2\mbreak
    re'4~re16[dod si la] sol2

    %66
    mi'4~mi16 [re dod si] la4 r
    mi'1~\mbreak
    mi4 re8[dod] si4 dod8[re]

    %69
    mi4 dod mi la,
    si2 dod8[si dod re]
    mi4 dod re la

    %72
    si2 dod4 mi\mbreak
    re la la8[sol la si]
    dod[si dod re] mi[re mi dod]

    %75
    fad4 fad mi2
    fad4 r la,8[sol la si]
    dod[si dod re] mi[re mi dod]

    %78
    fad4 fad\mbreak mi2
    fad1\fermata

}

XItestoI = \lyricmode {

    A - - - - - - - men a --  men et in sæ -- cula _ sæcu - lorum _

    et in sæ -- cula _ sæcu - lorum _

    a - - - - - men a -- men a -- men et in  sæ -- cula _  sæcu - lorum _  a -- men a -- men a --  men

    et in sæ -- cula _ sæcu - lorum _ a -- men a - - - - - - - - - men sæcu - lorum _ a -- men.

    A -  men a -- men a - - - men a - - - - - - - men a -- men

    et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a - - - - - men a - men et in sæ -- cula _ sæcu - lorum _  et in sæ -- cula _ sæcu - lorum _

    sæcu - lo - rum

    a -- men a -- men a -- men a -- men sæcu - lorum _  a  - men.

    A - - - - - - - - men a - - - - - - - - men a -- men a -- men et in sæ -- cula _ sæcu - lorum _

    et in sæ -- cula _ sæcu - lorum _ a - -  men a - -  men a - -  men a - - - men a -- men a -- men

    a - - - - - - - - - - - - - - - - - men a - - -  men a -- men a - - - men a -- men.

}

XIalton = \relative do' {

    \autoBeamOff
    R1*4
    r2 la'
    sold sol

    %7
    fad si4 la\mbreak
    sold8[fad16 mi] fad8[sold] la2
    sol?4 fad mi2

    %10
    re r4 la'8 sol\mbreak
    fad mi16 re mi8 fad sol sol si la
    sold fad16 mi fad8 sold la la r8 la16[sol?]

    %13
    fad[mi re mi] fad[mi fad re] sold4 \parenthesize la~\mbreak
    la sold la r
    r4 sold8 fad mi re16 dod re8 mi

    %16
    fad fad la sold fad mi16 red? mi8 fad\mbreak
    sold sold la8[si] mi,4 r
    la8 la la la16 la sol?8 sol sol sol

    %19
    fad re r la' la la16 la la8 fad\mbreak %% fine p 96
    re re r si' si si16 si si8 sold
    mi mi r8 dod' \parenthesize dod dod16 dod dod8 lad

    %22
    fad fad sold la? si4 sold\mbreak
    dod,8 dod fad fad fad4(mid)
    fad2 r

    %25
    R1*2
    r2 r4 sold8 fad
    mi re16 dod re8 mi fad fad la sol\mbreak

    %29
    fad mi16 red mi8 fad sold sold r4
    r2 si8 si8 si8 si16 si
    la8 la la la sol! mi mi16[fad sol la]

    %32
    si8 si, r4 si'~si16[la sol fad]
    mi2 dod'!4~dod16[si lad sold]
    fad2 r\mbreak

    %35
    fad8 fad fad fad16 fad mi8 mi mi mi
    re si re16[mi fad sol] dod,4 lad'8 sol
    fad mi16 red mi8 fad si, si si' la\mbreak

    %38
    sol fad16 mi fad8 sol dod, dod r lad'16[sol]
    fad[mi re mi] fad[mi fad re] dod2~
    dod fad\mbreak

    %41
    mid mi
    red sold4 fad
    mid8[re16 dod re8 mid] fad4 mi\mbreak

    %44
    re sol!2 fad4~
    fad mi2 re4~
    re dod la'8 la sold4\mbreak

    %47
    la2 r
    R1*2
    r2 r4 la

    %51
    sold sol fad si
    mi, la2 sold4
    la mi2 la4

    %54
    fad mi fad re\mbreak
    mi fad sol2
    fad4 r la4~la16[sol fad mi]

    %57
    re2 si'4~si16[la sold fad]
    mi4 la8 sol? fa mi16 re mi8 fad?\mbreak
    sol sol si la sold fad16 mi fad8 sold

    %60
    la la la4 sold sol
    fad re mi fad\mbreak
    sol si la la

    %63
    sold mi fad sold
    la~la16[sol! fad mi] re2\mbreak
    si'4~si16[la sol fad] mi2

    %66
    dod'4~dod16[si la sol] fad4 r
    r la si2\mbreak
    dod4 la sold la

    %69
    si mi, fad la
    sold2 la
    si4 mi, fad la

    %72
    sold2 la\mbreak
    fad8[mi fad sol?] la2~
    la la

    %75
    la4 la la la
    fad8[mi fad sol] la2~
    la la

    %78
    la4 la\mbreak la2
    la1\fermata

}

XItestoII = \lyricmode {

    A - - - - - - - - - men a -- men et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a - - - - - men et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _ a -- men

    et in sæ -- cula _ sæcu - lorum _ a -- men in sæ -- cula _ sæcu - lorum _

    in sæ -- cula _ sæcu - lorum _ in sæ -- cula _ sæcu - lorum _ sæcu - lorum _

    sæcu - lorum _ a -- men.

    Et in sæ -- cula _ sæcu - lorum _  et in sæ -- cula _ sæcu - lorum _

    et in sæ -- cula _ sæcu - lorum _ a -- men a  - men a -- men a  -- men

    et in sæ -- cula _ sæcu - lorum _ a -- men a  -- men

    et in sæ -- cula _ sæcu - lorum _  et in sæ -- cula _ sæcu - lorum _

    a - -  men __ a - - - - - - - - - - - - - men a -- men a -- men.

    A - - - - - - - men a - - - - - - - -  men a -- men a -- men et in sæ -- cula _ sæcu - lorum _

    et in sæ -- cula _ sæcu - lorum _  a - - men a - - men a - -  men a - - -  men

    a -- men a -- men a - - - - - - - - - - - - - - - - men a - men a -- men a -- men

    a - men a -- men a -- men.

}

XItenoren = \relative do' {

    \autoBeamOff
    R1*3
    r2 mi8 mi mi mi16 mi
    re8 re re re dod la r4

    %6
    mi'~mi16[re dod si] la4 r
    fad'~fad16[mi re dod] si4 r\mbreak
    mi4~mi16[re] dod[si] la8 la16 la la8 si

    %9
    dod la r4 r2
    re dod\mbreak
    do si

    %12
    mi4 re dod?8[si16 la si8 dod]
    re2~re4 dod\mbreak
    si2 la4 r

    %15
    r mi'8 re dod si16 la si8 dod
    re re mi mi red dod16 si dod8 red\mbreak
    mi mi r mi16[re] dod[si la si] dod[si dod la]

    %18
    mi'4 re2 dod4
    re r8 fad,16[sol] la[sol fad sol] la[sol la fad]\mbreak
    si4 r8 sol16[la] si[la sold la] si[la si sold]

    %21
    dod4 r8 la16[si] dod[si la si] dod[si dod la]
    re8[dod si la] sold2\mbreak
    la4 dod8 dod re re dod4

    %24
    dod2 r
    R1*2
    r2 r4 mi8 re

    %28
    dod si16 la si8 dod re re fad mi\mbreak
    red dod16 si dod8 red mi mi r mi16 [re?]
    dod[si la si] dod[si dod la] red4 mi~

    %31
    mi red mi2\mbreak  %%fine p. 100
    r4 red8 dod si la16 sol la8 si
    do do mi re! dod?8 si16 la si8 dod

    %34
    red red r red16 [dod] si[la sol la] si[la si sol]\mbreak
    dod4 re r2
    si lad

    %37
    la!  sol!\mbreak
    dod4 si lad8[sold16 fad sold8 lad]
    si2~si4 la?

    %40
    sold2 fad4 fad16[sold la si]\mbreak
    dod8 dod, dod' si lad sol!16 fad sold8 lad?
    si si red dod sid lad16 sold lad8 sid

    %43
    dod dod \parenthesize r sold16 sold fad8 fad dod'4\mbreak
    re4 r8 re dod16[si dod re] dod[si dod la]
    si[la si dod] si[la si sol] la[sol! la si] la[sol la fad]

    %46
    sold4 mi8 mi'16 mi fad8 fad mi4\mbreak
    mi2 r
    R1*5

    %53
    r4 dod si mi
    la,2~la4 si\mbreak
    la2 sol4 mi'

    %56
    la, dod8 si la sol16 fad sol8 la
    si si re dod si la16 sold la8 si
    dod dod r4 la~la16[sol fad mi]\mbreak

    %59
    re2 si'4~si16[la sold fad]
    mi4 la8 la mi' mi16 mi la,8 la
    re8 re r4 r2\mbreak

    %62
    r4 si8 si fad' fad16 fad si,8 si
    mi mi r4 r2
    r4 la,8 la la la16 la la8 la\mbreak

    %65
    si8 si si si si si16 si si8 si
    dod dod dod dod re re re4
    dod do si fad'\mbreak

    %68
    la,4 re2 dod4
    si la2 re4~
    re mi2 dod4

    %71
    si la2 re4~
    re mi2 dod4\mbreak
    la re2 fad4

    %74
    mi2 mi
    re4 re re dod
    re2. fad4

    %77
    mi2 mi
    re4 re\mbreak re(dod)
    re1\fermata

}

XItestoIII = \lyricmode {

    Et in sæ -- cula _ sæcu - lorum _ a -- men a -- men a -- men et in sæ -- cula _ sæcu - lorum _

    a -- men a - - - - -  men a -- men et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a - - - - - men a - - men a  - - men a - - - - men sæcu - lorum _ a -- men.

    Et in sæ -- cula _ sæcu - lorum _  et in sæ -- cula _ sæcu - lorum _  a - - - - - men

    et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a - - -  men a - - - - - - - men a -- men a  - men et in sæ -- cula _ sæcu - lorum _

    et in sæ -- cula _ sæcu - lorum _ sæcu - lorum _ a -- men a - - - - - - - men

    sæcu - lorum _ a -- men.

    A - - - - - - - men et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a  -- men a -- men et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    et in sæ -- cula _ sæcu - lorum _  et in sæ -- cula _ sæcu - lorum _ sæcu - lorum _

    a - - - - - - - - - - - - - - - - -  men a - -  men a -- men a -- men a -- men a -- men a -- men a -- men.

}

XIbasson = \relative do {

    \autoBeamOff
    r2 r4 la'8 sol
    fad mi16 re mi8 fad sol sol si la
    sold fad16 mi fad8 sold la la r la16  [sol?]

    %4
    fad [mi re  mi] fad [mi fad re]\mbreak sold8 sold la  la
    re, re mi4 la, r
    r2 la'4~la16 [sol fad mi]

    %7
    re4  r si'4~si16 [la sold fad]\mbreak
    mi4 r r2
    la8 la la la16 la sol8 sol sol sol

    %10
    fad re r4 la'~la16 [sol fad mi]\mbreak
    re4 r si'~si16[la sol fad]
    mi4 r la~la16 [sol fad mi]

    %13
    re4 r r2\mbreak
    r la'
    sold sol

    %16
    fad si4 la\mbreak
    sold8[fad16 mi fad8 sold] la2
    sol!4 fad mi2

    %19
    re4 r8 re16 [mi] fad[mi re mi] fad [mi fad re]\mbreak
    sol4 r8 mi16 [fad] sold [fad mi fad] sold [fad sold mi]
    la4 r8 fad16 [sold] lad [sold fad sold] lad [sold lad fad]

    %22
    si8 [la? sold fad] mid2\mbreak
    fad4 fad8 fad si, si dod4
    fad2 r

    %25
    R1*2
    la2 sold

    %28
    sol! fad\mbreak
    si4 la sold8[fad16 mi fad8 sold]
    la2~la4 sol!

    %31
    fad2 mi\mbreak
    r4 si'8 la sold fad16 mi fad8 sold
    la la do si lad sold16 fad sold8 lad

    %34
    si si r si16 [la] sol!16 [fad mi fad] sol [fad sol mi]\mbreak
    lad4 si2 lad4
    si si,16 [dod re mi] fad8 fad, r4

    %37
    si'~si16 [la sol! fad] mi2\mbreak
    dod'4~dod16 [si lad sol] fad2
    si,4 r dod8 dod dod dod16 dod

    %40
    si8 si si si la fad r4\mbreak
    r2 fad'4~fad16 [mi re dod]
    si2 sold'4~sold16 [fad mi red?]

    %43
    dod4 si lad2\mbreak
    si4 r8 si' la16 [sol! la si] la [sol la fad]
    sol [fad sol la] sol [fad sol mi] fad [mi fad sol] fad [mi fad re]

    %46
    mi4 la, re8 re mi4\mbreak
    la,2 r
    R1*5
    r4 la' sold sol
    fad la re, sol~\mbreak

    %55
    sol fad mi2
    re4 la'8 sol fad mi16 re mi8 fad
    sol sol si la sold fad16 mi fad8 sold

    %58
    la la r4 do,2\mbreak
    si2 re
    dod r

    %61
    r4 re8 re la' la16 la re,8 re\mbreak
    sol sol r4 r2
    r4 mi8 mi si' si16 si mi,8 mi

    %64
    la la r4 re,~re16[do si la]\mbreak
    sol2 mi'4~mi16[re dod? si]
    la2 re4 r

    %67
    r la' sold sol\mbreak
    fad si mi, la
    sold sol fad fa

    %70
    mi re dod la'
    sold sol fad fa
    mi re dod la'\mbreak

    %73
    re,8 [dod re mi] fad [mi fad sol]
    la [sol la si] dod [si dod la]
    re4 re, la' \parenthesize la,

    %76
    re8 [dod re mi] fad [mi fad sol]
    la [sol la si] dod [si dod la]
    re4 re, la' la,

    %79
    re1\fermata

}

XItestoIV = \lyricmode {

    Et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a - - - men sæcu - lorum _  a -- men a -- men a --  men

    et in sæ -- cula _ sæcu - lorum _ a -- men a -- men a -- men a -- men

    a - - - - - - - - men a -- men a  - - men a  - - men a - - - - men sæcu - lorum _ a -- men.

    A - - - - - - - men a -- men et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a - - - - - men a - men a -- men a - men et in sæ -- cula _ sæcu - lorum _

    a -- men a -- men a -- men a - men a - - - - - - - men a -- men a -- men.

    A - - - - - - - - men et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a  -- men a -- men et in sæ -- cula _ sæcu - lorum _ et in sæ -- cula _ sæcu - lorum _

    a -- men a - men a - - - - - - - - - - - - men a - - - - - -  men a - - - - - men a -- men a - - - - men

    a - men.

}

XIbcn = \relative do {

    re''2 dod4 \clef bass la,8 sol
    fad[mi16 re mi8 fad] sol sol, si '[la]
    sold[fad16 mi fad8 sold] la la, r la'16  sol?

    %4
    fad mi re  mi fad mi fad re\mbreak sold8 sold la [la]
    re, re mi mi la,4 r
    \clef tenor mi''4~mi16 re dod si \clef bass la4~la16 sol fad mi

    %7
    \clef tenor <<{fad'4~\stemDown fad16 mi re dod}\\{\stemUp\shiftOn re,4}>> \clef bass si'4~si16 la sold fad\mbreak
    mi4 r r2
    la8[la la la16 la]sol8 sol sol[sol]

    %10
    fad re r4 la'~la16 sol fad mi\mbreak
    re4 r si'~si16 la sol fad
    mi4 r la~la16 sol fad mi

    %13
    re4 \clef tenor si'4 (re) dod\mbreak
    si2\clef bass la
    sold sol

    %16
    fad si4 la\mbreak
    sold8[fad16 mi fad8 sold] la2
    sol!4 fad mi2

    %19
    re4 r8 re16 mi fad mi re mi fad mi fad re\mbreak
    sol4 r8 mi16 fad sold fad mi fad sold fad sold mi
    la4 r8 fad16 sold lad sold fad sold lad sold lad fad

    %22
    si8 la? sold fad mid2\mbreak
    fad8 fad, fad' fad si, si dod dod,
    fad8[fad'16 sold la sold la fad] dod'8[dod,16 red mid red mid dod]

    %25
    fad,8[fad'16 sold lad sold lad sold] si8[si,16 dod red dod red si]\mbreak
    mi fad sold mi la si dod la re, dod re si mi re mi mi,
    la'2 sold

    %28
    sol! fad\mbreak
    si4 la sold8[fad16 mi fad8 sold]
    la2~la4 sol!

    %31
    fad2 mi\mbreak
    r4 si'8 la sold[fad16 mi fad8 sold]
    la la, do' si lad[sold16 fad sold8 lad]

    %34
    si si, r si'16 la sol!16 fad mi fad sol fad sol mi\mbreak
    lad4 si2 lad4
    si si,16 dod re mi fad8 fad, r4

    %37
    si'\parentSlur (si16) la sol! fad mi2\mbreak
    dod'4~dod16 si lad sol fad2
    si,4 r dod8 [dod dod dod16 dod]

    %40
    si8 si si si la fad \clef tenor fad'16 sold la si\mbreak
    dod8 dod, r4 \clef bass fad~fad16 mi re dod
    si2 sold'4~sold16 fad mi red

    %43
    dod4 si lad2\mbreak
    si4 r8 si' la16 sol! la si la sol la fad
    sol fad sol la sol fad sol mi fad mi fad sol fad mi fad re

    %46
    mi8 mi, la la re re mi mi,\mbreak
    la4 la'2 sold8 mi
    la16 sold la si dod si dod la re dod re si mi re mi mi,

    %49
    la si dod la re, mi fad re sol fad sol sol, la' sol la la,\mbreak
    re4\clef violin re''4 dod <<
        {
            do
            si mi la, re~

            %52
            re dod? si2
            dod4
        }\\{
            la
            sold sol fad si
            mi, la2 sold?4
            la
        }
    >> \clef bass la, sold sol
    fad la re, sol~\mbreak

    %55
    sol fad mi2
    re4 la'8 sol fad mi16 re mi8 fad
    sol sol, si'[la] sold fad16 mi fad8 sold

    %58
    la la, r4 do2\mbreak
    si2 re
    la\tasto~la~

    %61
    la1~\mbreak
    la~
    la~

    %64
    la~\mbreak
    la~
    la~

    %67
    la~\mbreak
    la~
    la~

    %70
    la~
    la~
    la2. la'4\mbreak

    %73
    re,8 dod re mi fad mi fad sol
    la sol la si dod si dod la
    re4 re, la' la,

    %76
    re8 dod re mi fad mi fad sol
    la sol la si dod si dod la
    re4 re, la' la,

    %79
    re,1\fermata

}

XIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 4/4
    \key re\major
    \tempo 2 = 47
    s1*49\break
    \mark\markup "Più All[egr]o"
    \tempo 2 = 55
    s1*9\break
    \mark\markup "Presto"
    \tempo 2 = 65
    s1*21
    \bar "|."

}

XIvlI = {
    %\notypeset
    <<\XIvlIn \forma>>

}

XIvlII = {
    <<\XIvlIIn \forma>>

}

XIvla = {
    \clef alto
    <<\XIvlan \forma>>

}

XIsoprano = {
    \new Voice = "et1"
    <<\XIsopranon \forma>>
}

XIalto = {
    \new Voice = "et2"
    <<\XIalton \forma>>
}

XItenore = {
    \new Voice = "et3"
    <<\XItenoren \forma>>
}

XIbasso = {
    \clef bass
    \new Voice = "et4"
    <<\XIbasson \forma>>
}

XIbc = {
    <<\XIbcn \forma \XIbfn>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.18.2  convert-ly: Processing `'...
Applying conversion:     l documento non è stato modificato.
%}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17.5)


\pointAndClickOff

global = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletNumber.transparent = ##t
    \override TupletBracket.bracket-visibility = ##f
    \senza\terzine

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
        subtitle = \markup "Dixit a 4 con Strumenti [RV 807] "
        composer = \markup {"A. Vivaldi (1678-1741)"}
    }

    \markup \huge {[1.] Allegro}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violetta"}
                    \set Staff.midiInstrument = #"viola"
                    \Ivla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "Canto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Isoprano \global
                    \new Lyrics \lyricsto "dixit1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "Alto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ialto \global
                    \new Lyrics \lyricsto "dixit2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"Tenor"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Itenore \global
                    \new Lyrics \lyricsto "dixit3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ibasso \global
                    \new Lyrics \lyricsto "dixit4" \ItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                \set Staff.midiInstrument = #"contrabass"
                \Ibc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[2.] Largo}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violetta"}
                    \set Staff.midiInstrument = #"viola"
                    \IIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 4/4 r1^\markup\center-align "Canto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIsoprano \global
                    \new Lyrics \lyricsto "donec1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 4/4 r1^\markup\center-align "Alto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIalto \global
                    \new Lyrics \lyricsto "donec2" \IItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 4/4 r1^\markup\center-align"Tenor"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IItenore \global
                    \new Lyrics \lyricsto "donec3" \IItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIbasso \global
                    \new Lyrics \lyricsto "donec4" \IItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[3.] And[ant]e molto}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IIIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violetta"}
                    \set Staff.midiInstrument = #"viola"
                    \IIIvla\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "Canto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIIsoprano \global
                    \new Lyrics \lyricsto "virgam1" \IIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \IIIbc\global
                >>
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[4.] Allegro - A due}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IVvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violetta"}
                    \set Staff.midiInstrument = #"viola"
                    \IVvla\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key sol\major \numericTimeSignature \time 2/4 r2^\markup\center-align "Tenore [I]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVtenore \global
                    \new Lyrics \lyricsto "tecum1" \IVtestoI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key sol\major \numericTimeSignature \time 2/4 r2^\markup\center-align "Tenore [II]"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IVtenoreI \global
                    \new Lyrics \lyricsto "tecum2" \IVtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Un Organo""solo"}
                    \set Staff.midiInstrument = #"church organ"
                    \IVbc\global
                >>
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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
        systems-per-page = #2
    }

    \markup \huge {[5.] All[egr]o molto}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violetta"}
                    \set Staff.midiInstrument = #"viola"
                    \Vvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 3/4 \override Staff.TimeSignature.style = #'single-digit do''2.^\markup\center-align "Canto [I]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vsoprano \global
                    \new Lyrics \lyricsto "iuravit1" \VtestoI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 3/4 \override Staff.TimeSignature.style = #'single-digit do''2.^\markup\center-align "Canto [II]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VsopranoI \global
                    \new Lyrics \lyricsto "iuravit1" \VtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 3/4 \override Staff.TimeSignature.style = #'single-digit r2.^\markup\center-align "Alto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Valto \global
                    \new Lyrics \lyricsto "iuravit2" \VtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 3/4 \override Staff.TimeSignature.style = #'single-digit r2.^\markup\center-align"Tenor"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vtenore \global
                    \new Lyrics \lyricsto "iuravit3" \VtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Vbasso \global
                    \new Lyrics \lyricsto "iuravit4" \VtestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                \set Staff.midiInstrument = #"contrabass"
                \Vbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #0.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[6.] All[egr]o}

    \score {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""primo"}
                    \set Staff.midiInstrument = #"violin"
                    \VIvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""2.do"}
                    \set Staff.midiInstrument = #"violin"
                    \VIvlII\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \VIvla\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\minor \time 4/4 r1^\markup\center-align "Tenore"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \VItenore \global
                    \new Lyrics \lyricsto "dextris" \VItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \VIbc\global
                >>
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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
        systems-per-page = #2
        system-system-spacing = #'((basic-distance . 20) (padding . 8))
    }

    \markup \huge {[7.] Adagio}

    \score {
        <<

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{"Tromba"}
                    \set Staff.midiInstrument = #"trumpet"
                    \VIItp\global
                >>

                \new PianoStaff <<

                    \set PianoStaff.instrumentName = \markup \center-column{"[Oboi]"}
                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \VIIobI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"oboe"
                        \VIIobII\global
                    >>
                >>

                \new PianoStaff <<

                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}
                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \VIIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \VIIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "Canto [I & II]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIIsoprano \global
                    \new Voice = "two" \relative do'' {
                        \stemDown \autoBeamOff
                        s1*23 dod4. dod8 re4 re
                        re re8. re16 re8. dod16 dod4
                    }
                    \new Lyrics \lyricsto "iudicabit1" \VIItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "Alto [I & II]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIIalto \global
                    \new Voice = "due" \relative do'' {
                        \stemDown \autoBeamOff
                        s1*25 fad,4. fad8 sol4 sol
                        sol4 sol8. sol16 sol8. fad16 fad4
                    }
                    \new Lyrics \lyricsto "iudicabit2" \VIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"Tenor"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIItenore \global
                    \new Lyrics \lyricsto "iudicabit3" \VIItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIIbasso \global
                    \new Lyrics \lyricsto "iudicabit4" \VIItestoIV
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \VIIbc\global
                >>
            >>
        >>

        \layout {

            #(layout-set-staff-size 14.5)

            indent = 2.5\cm
            incipit-width =2.5\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[8.] And[ant]e}

    \score {
        <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""primo"}
                    \set Staff.midiInstrument = #"violin"
                    \VIIIvlI\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violino""2.do"}
                    \set Staff.midiInstrument = #"violin"
                    \VIIIvlII\global
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Viola"}
                    \set Staff.midiInstrument = #"viola"
                    \VIIIvla\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key mi\minor \time 4/4 r1^\markup\center-align "Alto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \VIIIalto \global
                    \new Lyrics \lyricsto "torrente" \VIIItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \VIIIbc\global
                >>
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override RehearsalMark.break-align-symbols = #'(left-edge)
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #2
                \override StaffGrouper.staff-staff-spacing.basic-distance = #8
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[9.] Allegro}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IXvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \IXvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violetta"}
                    \set Staff.midiInstrument = #"viola"
                    \IXvla\global
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key la\major \numericTimeSignature \override Staff.TimeSignature.style = #'single-digit \time 3/4 r4.^\markup\center-align "Canto [I]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IXsoprano \global
                    \new Lyrics \lyricsto "gloria1" \IXtestoI
                >>

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key la\major \numericTimeSignature \override Staff.TimeSignature.style = #'single-digit \time 3/4 r4.^\markup\center-align "Canto [II]"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IXsopranoI \global
                    \new Lyrics \lyricsto "gloria2" \IXtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                    \set Staff.midiInstrument = #"contrabass"
                    \IXbc\global
                >>
            >>
        >>

        \layout {

            indent = 2.5\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1
                \override StaffGrouper.staff-staff-spacing.basic-distance = #4
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {
        systems-per-page = #2
    }

    \markup \huge {[10.] Allegro}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \XvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \XvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violetta"}
                    \set Staff.midiInstrument = #"viola"
                    \Xvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 r1^\markup\center-align "Canto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Xsoprano \global
                    \new Lyrics \lyricsto "sicut1" \XtestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "Alto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Xalto \global
                    \new Lyrics \lyricsto "sicut2" \XtestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"Tenor"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Xtenore \global
                    \new Lyrics \lyricsto "sicut3" \XtestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Xbasso \global
                    \new Lyrics \lyricsto "sicut4" \XtestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"[Organo""e Violone]"}
                \set Staff.midiInstrument = #"contrabass"
                \Xbc\global
            >>
        >>

        \layout {

            indent = 2\cm
            incipit-width =2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                %\override SpacingSpanner.uniform-stretching = ##t
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

    \markup \huge {[11.] All[egr]o}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<
                    \set PianoStaff.instrumentName = \markup \center-column{"Violini"}

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \XIvlI\global
                    >>

                    \new Staff <<
                        \set Staff.midiInstrument = #"violin"
                        \XIvlII\global
                    >>
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Violetta"}
                    \set Staff.midiInstrument = #"viola"
                    \XIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key re\major \time 4/4 re''2^\markup\center-align "Canto" dod''}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \XIsoprano \global
                    \new Lyrics \lyricsto "et1" \XItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key re\major \time 4/4 r1^\markup\center-align "Alto"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \XIalto \global
                    \new Lyrics \lyricsto "et2" \XItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key re\major \time 4/4 r1^\markup\center-align"Tenor"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \XItenore \global
                    \new Lyrics \lyricsto "et3" \XItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Basso"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \XIbasso \global
                    \new Lyrics \lyricsto "et4" \XItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{""}
                \incipit {
                    \clef soprano \key re\major \time 4/4 re''2^\markup\center-align\center-column{"[Organo"\vspace #-0.2"e Violone]"} dod''4}
                    \clef violin
                    \set Staff.midiInstrument = #"contrabass"
                    \XIbc\global
                >>
            >>

            \layout {

                indent = 2.5\cm
                incipit-width =2\cm

                \context	{
                    \Score
                    \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                    \override StaffGrouper.staff-staff-spacing.padding = #1.5
                    \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                    \override SpacingSpanner.base-shortdixit-duration = #(ly:make-moment 1/4)
                    %\override SpacingSpanner.uniform-stretching = ##t
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
