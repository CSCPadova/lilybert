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

    do8
    mi16 sol mi do re sol re si
    do8 [sol do re]
    mi16 sol mi do re sol re si

    %4
    do8 [sol do re]
    mi16 do' do8(si16) la sol fa
    mi la la8(sol16) fa mi re

    %7
    do8 sol \tuplet 3/2 { do16(re mi) re[(mi fa)] }
    mi8 do \tuplet 3/2 { mi16(fa sol) fa[(sol la)] }
    sol8 mi r sol\mbreak

    %10
    \tuplet 3/2 { fad16(mi re) } fa4.
    \tuplet 3/2 { mi16(re do) } mib4.
    \tuplet 3/2 { re16(do si) do[(si la)] } sol8 sol'\p

    %13
    \tuplet 3/2 { fad16(mi re) } fa4.
    \tuplet 3/2 { mi16(re do) } mib4.
    \tuplet 3/2 { re16(do si) do[(si la)] } sol8 sol'\f

    %16
    mi16 sol mi do re sol re si
    do8[sol mi do]
    mi'16 sol mi do re sol re si

    %19
    do4 r8 do
    mi16 sol mi do re sol re si\mbreak
    do8[sol do re]

    %22
    mi16 sol mi do re sol re si
    do8[sol do sol']
    si,16 do re mi fa8 re

    %25
    mi16 sol mi do mi sol mi do
    do8 si16 do re4~
    re8 [do16 re mi8 mi]

    %28
    mi re si16 fa' re si
    la la' fad re do la' fad do\mbreak
    si4 r8 la'

    %31
    si16 re si sol la re la fad
    sol8[re si sol]
    sol16 re' sol, re' fad, re' fad, re'

    %34
    mi, re' mi, re' re, re' re, re'
    mi, re' mi, re' fad, re' fad, re'
    sold, re' sold, re' sold, re' sold, re'

    %37
    do la do mi la mi do la
    fa! re fa la re fa re la
    sold mi sold si do la la' fa\mbreak

    %40
    mi fa mi re do re do si
    la8 mi' \tuplet 3/2 { la,16(si do) si[(do re)] }
    do8 la' \tuplet 3/2 { do,16(re mi) re[(mi fa)] }

    %43
    mi8 mi \tuplet 3/2 { la,16(si do) si[(do re)] }
    do8 la' \tuplet 3/2 { do,16(re mi) re[(mi fa)] }
    mi la mi do mi la mi do

    %46
    mi la mi do mi la mi do
    fad la fad red fad la fad red\mbreak
    sol si sol mi sol si sol mi

    %49
    sol si sol mi fad si fad red
    sol si sol mi sol si sol mi
    mi,8 fad sol la

    %52
    si do re si
    do la sol fad
    si sol fad mi

    %55
    si'8. si16 si4
    sol8 la si si16 dod\mbreak
    re8. re,16 re4

    %58
    la'8 si do do16 re
    mi8. mi,16 mi4
    r r8 mi'

    %61
    do8 si la sol
    fad re sol si
    do la re re,

    %64
    sol'16 si sol re sol si sol re\mbreak
    sol si sol re sol si sol re
    sol si sol re sol si sol re

    %67
    sol si sol re sol si sol re
    sol si sol re sol si sol re
    mi sol mi do mi sol mi do

    %70
    mi sol mi do mi sol mi do
    mi sol mi do mi sol mi do
    mi sol mi do mi sol mi do

    %73
    fa sib fa do fa sib fa do\mbreak
    do la' fa do do la' fa do
    do la' fa do do la' fa do

    %76
    re la' fa re re la' fa re
    re si' sol re mi do' sol mi
    re do' la re, re si' sol re

    %79
    mi sol mi do do mi do sol
    sol do sol mi mi sol mi do
    do4 r\fermata

    %82
    dod'2
    re(\mbreak
    red)

    %85
    mi
    fa~
    fa4 mi8 re

    %88
    dod2
    re
    mib~

    %91
    mib4 re8 do
    si!2
    do4 do

    %94
    do do8 do
    mib4 do
    si!4 r8 do

    %97
    mi16 sol mi do re sol re si
    do8[sol do re]
    mi16 sol mi do re sol re si

    %100
    do8[sol do mi]
    sol[si, re sol]
    sol16 la sol mi fa sol fa re

    %103
    mi sol fa mi fa la sol fa
    sol la sol mi fa sol fa re
    mi8[do' sol mi]

    %106
    re16 si' fa re fa si fa re\mbreak
    mi sol mi do re sol re si
    mi sol mi do mi sol mi do

    %109
    re si' fa re re si' fa re
    mi sol mi do re sol re si
    do2

}

IvlIIn = \relative do'' {

    sol8
    do16 mi do sol si re si sol
    mi8[mi sol si]
    do16 mi do sol si re si sol

    %4
    mi8[mi sol si]
    do4 r
    r16 do' do8(si16) la sol fa

    %7
    mi8 do r4
    r8 sol \tuplet 3/2 { do16(re mi) re[(mi fa)] }
    mi8 do r mi\mbreak

    %10
    re2
    do
    \tuplet 3/2 { si16(la sol) la[(sol fad)] } sol8 mi'\p

    %13
    re2
    do
    \tuplet 3/2 { si16(la sol) la[(sol fad)] } sol8 mi'\f

    %16
    do16 mi do sol si re si sol
    mi8[sol mi do]
    do'16 mi do sol si re si sol

    %19
    mi4 r8 sol
    do16 mi do sol si re si sol\mbreak
    mi8[mi sol si]

    %22
    do16 mi do sol si re si sol
    mi8[mi sol mi']
    sol,16 la si do re8 si

    %25
    do16 mi do sol do mi do mi,
    re'4. do16 re
    mi4. do8

    %28
    do si sol16 re' si sol
    fad fad' re la la fad' re la\mbreak
    sol4 r8 fad'

    %31
    sol16 si sol re sol lad fad re
    re8[si sol re]
    si'16 re si re la re la re

    %34
    sol, re' sol, re' fad, re' fad, re'
    sol, re' sol, re' la re la re
    si re si re si re si re

    %37
    do la do mi la mi do la
    fa! re fa la re fa re la
    sold mi sold si do la mi' re\mbreak

    %40
    do re do si la si la sold
    la4 r
    r8 re \tuplet 3/2 { la16[(si do)] si(do re)}

    %43
    do4 r
    r8 mi \tuplet 3/2 { la,16[(si do)] si(do re)}
    do mi do la do mi do la

    %46
    do mi do la do mi do la
    la fad' red la red fad red si\mbreak
    si sol' mi si mi sol mi si

    %49
    mi sol mi si red fad red si
    si sol' mi si si sol' mi si
    mi,8 fad sol la

    %52
    si do re si
    do la sol fad
    si sol fad mi

    %55
    si'8. si16 si4
    sol8 la si si16 dod\mbreak
    re,8 mi fad fad16 sold

    %58
    la8. la,16 la4
    mi'8 fad sol sol16 la
    si8. si,16 si8 mi'

    %61
    do si la sol
    fad re sol si
    do la re re,

    %64
    re'16 sol re si re sol re si\mbreak
    re sol re si re sol re si
    re sol re si re sol re si

    %67
    re sol re si re sol re si
    re sol re si re sol re si
    do mi do sol do mi do sol

    %70
    do mi do sol do mi do sol
    do mi do sol do mi do sol
    do mi do sol do mi do sol

    %73
    fa fa' si,[fa!] fa fa' si,[fa]\mbreak
    la fa' do la la fa' do la
    la fa' do la la fa' do la

    %76
    la fa' re la la fa' re la
    si sol' re si do sol' mi do
    do la' fa do si sol' re si

    %79
    do mi do sol sol do sol mi
    mi sol mi do do mi do sol
    sol4 r\fermata

    %82
    sol'2
    la~\mbreak
    la

    %85
    si~
    si
    sib

    %88
    la
    la~
    la

    %91
    lab
    sol~
    sol4 sol

    %94
    fa fa8 fa
    fad4 fad
    sol r8 sol\mbreak

    %97
    do16 mi do sol si re si sol
    sol8[mi sol si]
    do16 mi do sol si re si sol

    %100
    sol8[mi sol do]
    re[sol, si re]
    mi16 fa mi do re[mi re si]

    %103
    do [mi re do] re[fa mi re]
    mi[fa mi do] re[mi re si]
    do8[sol' mi do]

    %106
    si16 fa' re si re fa re si\mbreak
    do mi do sol si re si sol
    sol mi' do sol do mi do sol

    %109
    si fa' re si si fa' re si
    do mi do sol si re si sol
    mi2

}

Ivlan = \relative do' {

    mi8
    sol4 sol
    sol8 mi r sol
    sol4 sol

    %4
    sol8 mi r sol
    sol[mi re si']
    sol[mi re sol]

    %7
    sol mi r si'
    sol mi r si'
    sol[sol mi mi]\mbreak

    %10
    la[si si si]
    sol[la la la]
    re, re4 mi8\p

    %13
    la[si si si]
    sol[la la la]
    re, re4 mi8

    %16
    sol4 sol
    sol8[sol mi do]
    sol'4 sol

    %19
    sol r8 mi
    sol4 sol\mbreak
    sol8 mi r sol

    %22
    sol4 sol
    sol8 mi r mi
    re4 si

    %25
    sol8[sol' sol sol]
    sol4 sol
    sol sol8 sol

    %28
    sol sol r re
    re4 fad\mbreak
    re r8 re

    %31
    re4 re
    si8 sol' re si
    sol'[sol fad fad]

    %34
    mi[mi re re]
    mi[mi fad fad]
    mi[mi mi mi]

    %37
    mi[mi mi la,]
    la[la la fa']
    si, mi mi16 do la8\mbreak

    %40
    la8[la la si]
    do4 mi8 sold
    mi mi mi sold

    %43
    mi[mi mi sold]
    mi[mi mi sold]
    la4 la

    %46
    la la
    la la8 fad\mbreak
    mi4 si'

    %49
    si si
    si8 si si si
    mi,[fad sol la]

    %52
    si[do re si]
    do la sol fad
    si sol fad mi

    %55
    si'8.[si16 si8 si,]
    <<{sol'8[la si si16 dod]}\\mi,4>>
    re8[mi fad fad16 sold]

    %58
    la8. la,16 la4
    mi'8[fad sol sol16 la]
    si8.[si,16 si8 mi']

    %61
    do[si la sol]
    fad[re sol si]
    do[la re re,]

    %64
    si'4 si\mbreak
    si si
    si si

    %67
    si si
    si si
    sol sol

    %70
    sol sol
    sol sol
    sol mi

    %73
    do do\mbreak
    do fa
    fa fa

    %76
    fa fa
    sol sol
    la sol

    %79
    sol8[sol mi mi]
    do[do sol sol]
    mi4 r\fermata

    %82
    mi'2
    fa\mbreak
    fad

    %85
    mi
    re~
    re

    %88
    mi
    re
    do~

    %91
    do
    re
    mib4 mib

    %94
    fa fa8 fa
    do4 do
    re r8 mi\mbreak

    %97
    sol4 sol
    mi8 do r sol'8
    sol4 sol

    %100
    mi8 do r sol'
    si4 si
    sol si

    %103
    sol si
    sol si
    sol sol

    %106
    sol sol\mbreak
    sol sol
    sol sol

    %109
    sol sol
    sol sol
    sol2

}

Isopranon = \relative do'' {

    \autoBeamOff

    r8
    R2*18
    r4 r8 do
    mi[re16 do] re8[do16 si]\mbreak

    %21
    do4 r8 re
    mi8[re16 do] re8[do16 si]\mbreak
    do4 r8 do

    %24
    si16[do] re[mi] fa8 re
    mi sol, do4~
    do8 si16[do] re4~

    %27
    re8[do16 re] mi8 mi
    mi re r re
    fad,4 do'\mbreak

    %30
    si16 [la sol fad] sol[la si do]
    re8 si la8. sol16
    sol4 r

    %33
    re' re
    re re
    re re

    %36
    re2
    do4 r8 mi
    fa,!4 fa8 re'

    %39
    sold,4 la8 fa'\mbreak
    mi[re] do[si]
    la4 r8 mi'

    %42
    mi8. mi16 mi8 r
    mi mi mi mi
    mi4 mi8 mi

    %45
    mi8. mi16 mi4
    do do8 do
    do do do si16 la\mbreak

    %48
    sol4 sol
    mi'8 mi red4\tr
    mi r

    %51
    mi,8 fad sol la
    si do re si
    do [la] sol [fad]
    si [sol] fad [mi]

    %55
    si'8. si16 si4
    sol8 la si si16 dod\mbreak
    re8. re,16 re4

    %58
    la'8 si do do16 re
    mi8. mi,16 mi4
    r r8 mi'

    %61
    do8 [si] la [sol]
    fad[re] sol si
    do la re re,

    %64
    sol4 r\mbreak
    si2
    si

    %67
    si
    si4 si
    do2

    %70
    do
    do4 do
    sib sib

    %73
    sib?4. sib8\mbreak
    la2
    la4 la

    %76
    re re
    si do
    do(si)

    %79
    do2
    R2*2

    %82
    dod2
    re(\mbreak
    red)

    %85
    mi
    fa~
    fa4 mi8 [re]

    %88
    dod2
    re
    mib~

    %91
    mib4 re8 [do]
    si!2
    do4 do

    %94
    do do8 do
    mib4 do
    si!4 r8 do

    %97
    mi8[re16 do] re8[do16 si]
    do8 sol do re
    mi8[re16 do] re8[do16 si]

    %100
    do8 sol do4
    re re
    mi16[fa mi do] re[mi re si]

    %103
    do [mi re do] re[fa mi re]
    mi[fa mi do] re[mi re si]
    do8. re16 mi4

    %106
    re fa\mbreak
    mi8[re16 do] re8 do16[si]
    do4 r

    %109
    re fa
    mi8[re16 do] re8 do16[si]
    do2

}

ItestoI = \lyricmode {

    Læ -- ta -- tus sum læ -- ta -- tus sum læ -- tatus _ sum in his in his quæ di -- cta  sunt mihi: _

    in domum _ Do - mini _ i -- bi -- mus. Stantes _ erant _ pedes _ no -- stri in a -- tri -- js tuis, _

    Je -- ru -- sa -- lem Je -- rusa - lem, quæ edi - fi -- catur _ ut civi - tas: cujus _

    par -- tici - pa -- tio _ eius _ in i -- dip -- sum.

    Illuc _ enim _ ascen - derunt _ tri -- bus, tri -- bus Domi - ni: testi - mo -- nium _

    Isra - el, testi - mo -- nium _  Isra - el, ad con -- fi -- tendum _ no -- mini _ Domi - ni.

    Qui -- a il -- lic se -- de -- runt sedes _ in ju -- di -- ci -- o, sedes _ super _ domum _ Da -- vid.

    Ro -- ga -- te quae ad pa - - - - - cem sunt Je - ru -- sa -- lem: et a -- bun -- danti - a,

    et a -- bun -- danti - a di -- li -- gen - - - - - - tibus, _ di -- li -- gen -- tibus _ te

    di -- li -- gen -- tibus _ te.

}

Ialton = \relative do' {

    \autoBeamOff

    r8
    R2*18
    r4 r8 mi
    sol[fa16 mi] sol4\mbreak

    %21
    sol r8 sol
    sol[fa16 mi] sol4
    sol r8 sol

    %24
    sol16[la] si[do] re8 si
    sol4 r8 sol
    sol4 sol

    %27
    sol sol8 sol
    sol sol r si
    la4 la\mbreak

    %30
    sol4~sol16 [fad sol la]
    si8 sol sol fad
    sol4 r

    %33
    si la
    sol fad
    sol la

    %36
    si2
    la4 r8 la
    la4 la8 fa

    %39
    mi4 mi8 re'\mbreak
    do[si] la[sold]
    la4 r8 sold

    %42
    la8. la16 la8 r
    la la la sold
    la4 la8 sold

    %45
    la8. la16 la4
    la la8 la
    la la la fad16 fad\mbreak

    %48
    mi4 mi
    sol8 sol fad4\tr
    sol r

    %51
    mi8 fad sol la
    si do re si
    do[la] sol[fad]

    %54
    si[sol] fad[mi]
    si'8. si16 si4
    R2

    %57
    re,8 mi fad fad16 sold
    la8. la,16 la4
    mi'8 fad sol sol16 la

    %60
    si8. si,16 si8 mi'
    do [si] la [sol]
    fad [re] sol si

    %63
    do la re re,
    sol4 r\mbreak
    sol2

    %66
    sol
    sol
    sol4 sol

    %69
    sol2
    sol
    sol4 sol

    %72
    sol4 sol
    fa4. fa8\mbreak
    fa2

    %75
    fa4 fa
    la la
    sol sol

    %78
    la(sol)
    sol2
    R2*2

    %82
    sol2
    la~
    la

    %85
    si~
    si
    sib

    %88
    la
    la~
    la

    %91
    lab
    sol~
    sol4 sol

    %94
    fa fa8 fa
    fad4 fad
    sol r8 sol\mbreak

    %97
    sol[fa16 mi] sol4
    sol8 mi sol sol
    sol[fa16 mi] sol4

    %100
    sol8 mi sol4
    sol sol
    sol16 [la sol mi] fa [sol fa re]

    %103
    mi [sol fa mi] fa [la sol fa]
    sol [la sol mi] fa [sol fa re]
    mi8. fa16 sol4

    %106
    sol sol\mbreak
    sol4 sol8 sol
    sol4 r

    %109
    sol sol
    sol sol8 sol
    sol2

}

ItestoII = \lyricmode {

    Læ -- ta -- tus sum læ -- ta -- tus sum læ -- tatus _ sum in his in his quæ di -- cta  sunt mihi: _

    in domum _ Do -- mini _ i -- bi -- mus. Stantes _ erant _ pedes _ no -- stri in a -- tri -- js tuis, _

    Je -- ru -- sa -- lem Je -- rusa - lem, quæ edi - fi -- catur _ ut civi - tas: cujus _

    par -- tici - pa -- tio _ eius _ in i -- dip -- sum.

    Illuc _ enim _ ascen - derunt _ tri -- bus, tri -- bus Domi - ni: testi - mo -- nium _

    Isra - el, testi - mo -- nium _  Isra - el, ad con -- fi -- tendum _ no -- mini _ Domi - ni.

    Qui -- a il -- lic se -- de -- runt sedes _ in ju -- di -- ci -- o, sedes _ super _ domum _ Da -- vid.

    Ro -- ga -- te quae ad pa - - cem sunt Je - ru -- sa -- lem: et a -- bun -- danti - a,

    et a -- bun -- danti - a di -- li -- gen - - - - - - tibus, _ di -- li -- gen -- tibus _ te

    di -- li -- gen -- tibus _ te.

}

Itenoren = \relative do' {

    \autoBeamOff

    r8
    R2*18
    r4 r8 do
    do4(si8) re\mbreak

    %21
    mi4 r8 re
    do4(si8) re
    mi4 r8 mi

    %24
    re re si si
    do4 r8 mi
    re4. do16[re]

    %27
    mi4 do8 do
    do si r re
    re4 fad\mbreak

    %30
    re4 re8 re
    re4 re
    re r

    %33
    sol, la
    si re
    re la

    %36
    mi'2
    mi4 r8 do
    re4 re8 re

    %39
    si4 do8 la\mbreak
    mi'4 mi
    do r8 si

    %42
    do8. do16 do8 r
    do do do si
    do4 do8 si

    %45
    do8. do16 do4
    mi mi8 mi
    fad fad fad red16 red\mbreak

    %48
    si4 si
    si8 si si4
    si r

    %51
    mi,8 fad sol la
    si do re si
    do[la] sol[fad]

    %54
    si[sol] fad[mi]
    si'8. si16 si4
    sol8 la si si16 dod\mbreak

    %57
    re8. re,16 re4
    la'8 si do do16 re
    mi8. mi,16 mi4

    %60
    r r8 mi'
    do[si] la[sol]
    fad[re] sol si

    %63
    do la re re,
    sol4 r\mbreak
    re'2

    %66
    re
    re
    re4 re

    %69
    mi2
    mi
    do4 do

    %72
    do do
    do4. do8\mbreak
    do2

    %75
    do4 do
    re re
    re mi

    %78
    re2
    mi
    R2*2

    %82
    mi2
    fa\mbreak
    fad

    %85
    mi
    re~
    re

    %88
    mi
    re
    do~

    %91
    do
    re
    mib4 mib

    %94
    fa fa8 fa
    do4 do
    re r8 do\mbreak

    %97
    do4 si8[re]
    mi do do si
    do4 si8[re]

    %100
    mi do mi4
    sol, sol
    do sol

    %103
    do sol
    do sol
    sol8. sol16 do4

    %106
    si re\mbreak
    do8[mi] si re
    mi4 r

    %109
    si re
    do8[mi] si re
    mi2

}

ItestoIII = \lyricmode {

    Læ -- ta -- tus sum læ -- ta -- tus sum læ -- tatus _ sum in his in his quæ di -- cta  sunt mihi: _

    in domum _ Do -- mini _ i -- bi -- mus. Stantes _ erant _ pedes _ no -- stri in a -- tri -- js tuis, _

    Je -- ru -- sa -- lem Je -- rusa - lem, quæ edi - fi -- catur _ ut civi - tas: cujus _

    par -- tici - pa -- tio _ eius _ in i -- dip -- sum.

    Illuc _ enim _ ascen - derunt _ tri -- bus, tri -- bus Domi - ni: testi - mo -- nium _

    Isra - el, testi - mo -- nium _  Isra - el, ad con -- fi -- tendum _ no -- mini _ Domi - ni.

    Qui -- a il -- lic se -- de -- runt sedes _ in ju -- di -- ci -- o, sedes _ super _ domum _ Da -- vid.

    Ro -- ga - - te quae ad pa - - cem sunt Je - ru -- sa -- lem: et a -- bun -- danti - a,

    et a -- bun -- danti - a di -- li -- gen - - - - - - tibus, _ di -- li -- gen -- tibus _ te

    di -- li -- gen -- tibus _ te.

}

Ibasson = \relative do {

    \autoBeamOff
    r8
    R2*18

    %19
    r4 r8 do'
    do [do,] sol' [sol,]\mbreak
    do4 r8 sol'

    %22
    do [do,] sol' [sol,]
    do4 r8 do
    sol' sol  sol sol

    %25
    do,4 r8 do'
    sol4 sol
    do4 do,8 do

    %28
    sol' sol r sol
    re4 re\mbreak
    sol8 [sol16 la] si8 la

    %31
    sol4 re
    sol r
    sol fa

    %34
    mi re
    mi fad
    sold2

    %37
    la4 r8 la
    re,4 re8 re
    mi4 la8 re,\mbreak

    %40
    mi4 mi
    la r8 mi
    la8. la16 la8 r

    %43
    la la la mi
    la4 la8 mi
    la8. la16 la4

    %46
    la la8 la
    red, red red red16 red\mbreak
    mi4 mi

    %49
    mi8 mi si' [si,]
    mi4 r
    mi8 fad sol la

    %52
    si do re si
    do [la] sol [fad]
    si [sol] fad [mi]

    %55
    si'8. si16 si4
    R2
    re,8 mi fad fad16 sold

    %58
    la8. la,16 la4
    mi'8 fad sol sol16 la
    si8. si,16 si8 mi'

    %61
    do[si] la [sol]
    fad[re] sol si
    do la re re,

    %64
    sol4 r\mbreak
    sol2
    sol

    %67
    fa?
    fa4 fa
    mi2

    %70
    mi
    mi4 mi
    mi4 mi

    %73
    fa4. fa8\mbreak
    fa2
    fa4 fa

    %76
    fa fa
    fa mi
    fa(sol)

    %79
    do,2
    R2*2

    %82
    la'2
    fa\mbreak
    si

    %85
    sold~
    sold
    sol!~

    %88
    sol
    fad~
    fad

    %91
    fa!
    fa
    mib4 mib

    %94
    lab lab8 lab
    lab?4 lab
    sol4 r8 do\mbreak

    %97
    do4 sol
    do8 do, do sol'
    do4 sol

    %100
    do8 do, do4
    sol' sol
    sol2~

    %103
    sol~
    sol
    do8. do,16 do4

    %106
    sol' sol\mbreak
    do8[do,] sol' sol,
    do4 r

    %109
    sol' sol
    do8 [do,] sol' sol,
    do,2

}

ItestoIV = \lyricmode {

    Læ -- ta -- tus sum læ -- ta -- tus sum læ -- tatus _ sum in his in his quæ di -- cta  sunt mihi: _

    in domum _ Do -- mini _ i -- bi -- mus. Stantes _ erant _ pedes _ no -- stri in a -- tri -- js tuis, _

    Je -- ru -- sa -- lem Je -- rusa - lem, quæ edi - fi -- catur _ ut civi - tas: cujus _

    par -- tici - pa -- tio _ eius _ in i -- dip -- sum.

    Illuc _ enim _ ascen - derunt _ tri -- bus, tri -- bus Domi - ni: testi - mo -- nium _

    Isra - el, testi - mo -- nium _  Isra - el, ad con -- fi -- tendum _ no -- mini _ Domi - ni.

    Qui -- a il -- lic se -- de -- runt sedes _ in ju -- di -- ci -- o, sedes _ super _ domum _ Da -- vid.

    Ro -- ga -- te quae ad pa - - - cem sunt Je - ru -- sa -- lem: et a -- bun -- danti - a,

    et a -- bun -- danti - a di -- li -- gen - tibus, _ di -- li -- gen -- tibus _ te

    di -- li -- gen -- tibus _ te.

}

Ibcn = \relative do {

    r8
    do' do, sol' sol,
    do do, r sol''
    do do, sol' sol,

    %4
    do do, r sol''
    do do, sol' sol,
    do do, sol'' sol,

    %7
    do[do' do, sol]
    do[do' do, sol]
    do[do' do do]\mbreak

    %10
    re[sol, sol sol]
    do[fad, fad fad]
    sol[re sol, do'\p]

    %13
    re[sol, sol sol]
    do[fad, fad fad]
    sol[re sol, do'\f]

    %16
    do do, sol' sol,
    do[sol' mi do]
    do' do, sol' sol,

    %19
    do4 r8 do'
    do do, sol' sol,\mbreak  %%OOKK
    do do, do' sol'

    %22
    do do, sol' sol,
    do do, do'' do,
    sol'[sol, sol sol']

    %25
    do[do, do do']
    sol[sol, sol sol']
    do[do, do do]

    %28
    sol'[sol, sol sol']
    re[re, re re']\mbreak
    sol[la si la]

    %31
    sol sol, re' re,
    sol'[sol, sol sol]
    sol'[sol fad fad]

    %34
    mi[mi re re]
    mi[mi fad fad]
    sold[sold mi mi]

    %37
    la[mi do la]
    re[re, re re']
    mi mi, la' re,\mbreak

    %40
    mi[mi, mi mi']
    la la, la mi'
    la[la, la mi']

    %43
    la[la, la mi']
    la[la, la mi']
    la[la, la la']

    %46
    la[la, la la']
    red,[red, red red']\mbreak
    mi[mi, mi mi']

    %49
    mi[mi, si'' si,]
    mi[mi, mi mi]
    mi'[fad sol la]

    %52
    si[do re si]
    do la sol fad
    si sol fad mi

    %55
    si'8.[si16 si8 si,]
    \clef violin <<{sol''8[la si si16 dod]}\\mi,4>>
    \clef bass re,8[mi fad fad16 sold]

    %58
    la8. la,16 la4
    mi'8[fad sol sol16 la]
    si8.[si,16 si8 mi']

    %61
    do[si la sol]
    fad[re sol si]
    do[la re re,]

    %64
    sol[sol, sol sol']\mbreak
    sol[sol, sol sol']
    sol[sol, sol sol']

    %67
    fa?[fa, fa fa']
    fa[fa, fa fa']
    mi[mi, mi mi']

    %70
    mi[mi, mi mi']
    mi[mi, mi mi']
    mi[mi, mi mi']

    %73
    fa[fa, fa fa']\mbreak
    fa[fa, fa fa']
    fa[fa, fa fa']

    %76
    fa[fa, fa fa']
    fa[fa, mi' mi,]
    fa'[fa, sol' sol,]

    %79
    do,[do' do do,]
    do[do' do do,]
    do4 r\fermata

    %82
    la''2
    fa\mbreak %% OOKK
    si

    %85
    sold~
    sold
    sol!~

    %88
    sol
    fad~
    fad

    %91
    fa!~
    fa
    mib4 mib

    %94
    lab lab8 lab
    lab?4 lab
    sol4 r8 do\mbreak

    %97
    do do, sol' sol,
    do'[do, do sol']
    do do, sol' sol,

    %100
    do'[do, do do,]
    sol''4 sol
    sol2\tasto~

    %103
    sol\parentSlur (
    sol)
    do8.[do,16 do8 do,]

    %106
    sol''[la si sol]\mbreak
    do do, sol' sol,
    do[do, do do']

    %109
    sol'[la si sol]
    do do, sol' sol,
    do,2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    \key do\major
    \tempo 2 = 53
    \partial 8 s8
    s2*81\break
    \once \override Score.RehearsalMark.extra-offset = #'(+7 . -2.0)
    \mark \markup\huge {[2.] Ad[agi]o}
    \tempo 4 = 55
    s2*14\break
    s4\fermata s8 s
    \once \override Score.RehearsalMark.extra-offset = #'(+4 . -2.0)
    \mark \markup\huge {[3.] All[egr]o}
    \tempo 2 = 53
    s2*14
    s2\fermata
    \bar "||"

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
    \new Voice = "lætatus1"
    <<\Isopranon \forma>>
}

Ialto = {
    \new Voice = "lætatus2"
    <<\Ialton \forma>>
}

Itenore = {
    \new Voice = "lætatus3"
    <<\Itenoren \forma>>
}

Ibasso = {
    \clef bass
    \new Voice = "lætatus4"
    <<\Ibasson \forma>>
}

Ibc = {
    \clef bass
    <<\Ibcn \forma \Ibfn>>
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



IIvlIn = \relative do'' {

    fa,8\p[do' fa, fa]
    fa[do' fa,fa]
    sol[sol' sib, sib]

    %4
    sib[sol' sib, sib]
    la [fa do do]
    do[fa do do]\mbreak

    %7
    do[do' fa, fa]
    fa[do' fa, fa]
    sol[sol' sib, sib]

    %10
    sib[sol' sib, sib]
    la[la' mib? mib!]
    mib?  [la mib mib]

    %13
    re[fa re re]
    sib[sol' sib, sib]
    la[fa' la, la]

    %16
    la[fa' la, la]
    sol4 r8 do\f
    mi16 sol mi do re sol re si

    %19
    do8 [sol do re]
    mi16 sol mi do re sol re si
    do8 sol do sol'

    %22
    sol16 la sol mi fa sol fa re
    mi sol fa mi fa la sol fa
    sol la sol mi fa sol fa re

    %25
    mi8. fa16 sol8 mi
    re16 si' fa re fa si fa re
    mi sol mi do re sol re si

    %28
    do sol' mi do mi sol mi do\mbreak
    re4 fa
    mi16 sol mi do re sol re si

    %31
    do2\fermata
    la'8 mi \tuplet 3/2 { la,16(si do) si[(do re)] }
    do8 la' \tuplet 3/2 { do,16(re mi) re[(mi fa)] }

    %34
    mi8 la \tuplet 3/2 { la,16(si do) si[(do re)] }
    do8 la' \tuplet 3/2 { do,16(re mi) re[(mi fa)] }
    mi8 la \tuplet 3/2 { do,16(re mi) re[(mi fa)] }

    %37
    mi8 la \tuplet 3/2 { do,16(re mi) do[(re mi)] }\mbreak
    do8 la' \tuplet 3/2 { do,16(re mi)do[(re mi)]}
    do8 la' \tuplet 3/2 { do,16(re mi) mi[(re do)] }(

    %40
    si8)[si' si si]
    la mi \tuplet 3/2 { do16(re mi) do[(re mi)] }
    la8[mi do la]

    %43
    la' mi \tuplet 3/2 { do16(re mi) do[(re mi)] }
    re8 si re'4
    \tuplet 3/2 { dod16(si la) } la8\noBeam do4

    %46
    \tuplet 3/2 { si16(la sol) } sol8\noBeam sib4
    \tuplet 3/2 { la16(sol fad)} fad8\noBeam  sol4\mbreak
    \tuplet 3/2 { fad16(mi re) } re8\noBeam fa4

    %49
    \tuplet 3/2 { mi16(re do) } do8\noBeam mib4
    \tuplet 3/2 { re16(do si) } si8\noBeam sol' sol
    sol[sol fad fad]

    %52
    sol2\fermata
    mi16 sol mi do re sol re si
    do8 [sol do re]

    %55
    mi16 sol mi do re sol re si
    do8 [sol do sol']
    si,16 do re mi fa8 re\mbreak

    %58
    mi16 sol mi do mi sol mi do
    do8 si16 do re4~
    re8 do16 re mi8 mi

    %61
    mi re si16 fa' re si
    la la' fad re do la' fad do
    si4 r8 la'

    %64
    sol16 si sol re re la' fad re
    si8[sol si re]\mbreak
    mi16 sol mi do re sol re si

    %67
    do8[sol do re]
    mi16 sol mi do re sol re si
    do8[do mi sol]

    %70
    la,[do fa la]
    si,[re sol si]
    do,[mi fa la]

    %73
    re,[mi re re]\mbreak
    mi[do mi sol]
    la,[do fa la]

    %76
    si,[re sol si]
    do,[mi fa la]
    re,[mi re re]

    %79
    mi16 sol mi do re sol re si
    mi16 sol mi do re sol re si
    do2

}

IIvlIIn = \relative do'' {

    do,8\p [la' do, do]
    do[la' do, do]
    mi[mi' sol, sol]

    %4
    sol[mi' sol, sol]
    fa[do la la]
    la[do la la]\mbreak

    %7
    la[la' do, do]
    do[la' do, do]
    mi[mi' sol, sol]

    %10
    sol[mi' sol, sol]
    fa[fa' do do]
    do[fa do do]

    %13
    sib[re sib sib]
    sol[sib sol sol]
    fa[do' fa, fa]

    %16
    fa[re' fa, fa]
    mi4 r8 sol\f
    do16 mi do sol si re si sol\mbreak

    %19
    mi8[mi sol si]
    do16 mi do sol si re si sol
    sol8[mi sol re']

    %22
    mi16 [fa mi do] re [mi re si]
    do [mi re do] re [fa mi re]
    mi [fa mi do] re [mi re si]

    %25
    do8. re16 mi8  do
    si16 sol' re si re fa re si
    do mi do sol si re si sol

    %28
    mi mi' do sol do mi do sol\mbreak
    si4 re
    do16 mi do sol si re si sol

    %31
    mi2\fermata
    R
    la'8 mi \tuplet 3/2 { la,16(si do) si[(do re)] }

    %34
    do4 r
    la'8 mi \tuplet 3/2 { la,16(si do) si[(do re)] }
    do8 mi \tuplet 3/2 { la,16(si do) si[(do re)] }

    %37
    do8 mi \tuplet 3/2 { la,16(si do) la[(si do)]} \mbreak
    la8 mi' \tuplet 3/2 { la,16(si do) la[(si do)]}
    la8 mi' \tuplet 3/2 { la,16(si do) do[(si la)] }

    %40
    la8[la' sold sold]
    mi do \tuplet 3/2 { la16(si do) la[(si do)]}
    mi8[do la mi]

    %43
    mi' do \tuplet 3/2 { la16(si do) la[(si do)]}
    si8 sol r la'
    la2

    %46
    sol
    \tuplet 3/2 { fad16(mi re) } re8\noBeam r re\mbreak
    re2

    %49
    do
    \tuplet 3/2 { si16(la sol) } sol8\noBeam si si
    la[la la la]

    %52
    si2\fermata
    do16 mi do sol si re si sol
    sol8[mi sol si]

    %55
    do16 mi do sol si re si sol
    sol8[mi sol mi']
    sol,16 la si do re8 si\mbreak

    %58
    do16 mi do sol do mi do mi,
    re'4. do16 re
    mi4. do8

    %61
    do si sol16 re' si sol
    fad fad' re la la fad' re la
    sol4 r8 fad'

    %64
    re16 sol re si la fad' re la
    sol8[re sol si]\mbreak
    do16 mi do sol si re si sol

    %67
    sol8[mi sol si]
    do16 mi do sol si re si sol
    mi8 sol do mi

    %70
    do[la re fa]
    re[si mi sol]
    mi[do do fa]

    %73
    si,[do do si]\mbreak
    do[sol do mi]
    do[la do fa]

    %76
    re[si mi sol]
    mi[do do fa]
    si,[do do si]

    %79
    do16 mi do sol si re si sol
    sol mi' do sol si re si sol
    sol2

}

IIvlan = \relative do' {

    la2\p
    la
    mi'

    %4
    mi
    do8[la fa fa]
    fa[la fa fa]\mbreak

    %7
    fa[fa' la, la]
    la[fa' la, la]
    do[mi mi mi]

    %10
    mi2
    do
    la'

    %13
    fa
    do
    do

    %16
    re
    sol,4 r8 mi'\f
    sol4 sol\mbreak

    %19
    sol8 mi r sol
    sol4 sol
    mi8 do r sol'

    %22
    sol4 si
    sol si
    sol si

    %25
    sol sol
    sol sol
    sol sol

    %28
    sol sol\mbreak
    si si
    sol sol

    %31
    sol2\fermata
    mi8[mi mi sold]
    mi[mi mi sold]

    %34
    mi[mi mi sold]
    mi[mi mi sold]
    mi[mi mi sold]

    %37
    mi[mi mi mi]\mbreak
    mi[mi mi mi]
    mi[mi mi mi]

    %40
    mi4 mi
    do8 la mi' mi
    do8 la mi' mi

    %43
    do la re re
    re re r fad
    mi4 fad

    %46
    re mi
    la,8 re r si'\mbreak
    la4 si

    %49
    sol la
    si8[re, re re]
    re4 re

    %52
    re2\fermata
    sol4 sol
    mi8 do r sol'

    %55
    sol4 sol
    mi8 do r do
    re4 si\mbreak

    %58
    sol sol'
    sol sol
    sol sol

    %61
    sol8 sol re4
    re fad
    re r8 re

    %64
    si4 fad'
    re8[si re sol]\mbreak
    sol4 sol

    %67
    mi8 do r sol'
    sol4 sol
    sol8[mi sol do]

    %70
    la[fa la re]
    si[sol si mi]
    do[la la la]

    %73
    sol8 [sol sol sol]\mbreak
    sol[mi sol do]
    la[fa la re]

    %76
    si[sol si mi]
    do[la la la]
    sol[sol sol sol]

    %79
    sol4 sol
    sol sol
    mi2

}

IIsopranon = \relative do'' {

    \autoBeamOff

    R2*6
    fa,2^\p
    la

    %9
    sol
    sib
    la

    %12
    mib'
    re4 fa8 fa
    sib,2

    %15
    la
    la
    sol4 r8 do

    %18
    mi[re16 do] re8 [do16 si]\mbreak
    do8 sol do re
    mi[re16 do] re8 [do16 si]

    %21
    do8 [sol do re]
    mi16 [fa mi do] re [mi re si]
    do [mi re do] re [fa mi re]

    %24
    mi [fa mi do] re [mi re si]
    do8. re16 mi8 mi
    re4 fa8 fa

    %27
    mi4 re
    do r8 mi\mbreak
    re4 fa8 fa

    %30
    mi4 re
    do2\fermata
    la8 la la si

    %33
    do4 do8 re
    mi[la,] la si
    do4 do8 re

    %36
    mi[do] do re
    mi do r mi\mbreak
    do la r mi'

    %39
    do4 do
    si4 si8 si
    do4 r

    %42
    do8 do do do
    do do16 do do8 do
    si sol re'4

    %45
    dod do
    si sib
    la8 la r si?\mbreak

    %48
    re2
    do
    si8 si si si

    %51
    si4(la)
    si2\fermata
    mi8[re16 do] re8 do16[si]

    %54
    do8 sol r4
    mi'8 [re16 do] re8 do16(si)
    do sol sol8 r4

    %57
    si16[do] re[mi] fa8 re16 re\mbreak
    mi8 do do do
    do si16[do] re8 re

    %60
    re do16 re mi8 mi
    mi re re re
    fad, fad16 fad do'8 do

    %63
    si16[la sol fad] sol[la si do]
    re8 si la4
    sol re'8 re\mbreak

    %66
    mi re16 do re8 do16[si]
    do8 sol do re
    mi re16 do re8 si

    %69
    do sol do16[re mi do]
    la[si do la] re[mi fa re]
    si[do re si] mi[fa sol mi]

    %72
    do[re mi do] fa[mi re do]
    si8 do do[si]\mbreak
    do4 do16[re mi do]

    %75
    la[si do la] re[mi fa re]
    si[do re si] mi[fa sol mi]
    do[re mi do] fa[mi re do]

    %78
    si8 do do[si]
    do4 re
    mi re

    %81
    mi2

}

IItestoI = \lyricmode {

    Fi -- at pax - - - - in vir -- tu -- te tu -- a; et a -- bun -- danti - a et a -- bun -- dan - - - - - - - tia _

    in tur -- ribus _ tu - is in tur -- ribus _  tu - is.

    Propter _ fratres _ meos _ et pro -- ximos _ meos, _  et pro -- ximos _ meos _ lo -- quebar _

    lo -- quebar _ pacem _ de te.

    Propter _ domum _ Do -- mini _ Dei _ nostri _ quae -- si -- vi bo -- na tibi, _

    quae -- si -- vi bo -- na bo -- na ti -- bi.

    Glo -- ria _ Patri _ Patri _ et Fili - o et Spiri - tui _ Sancto _ sicut _ erat _ in

    prin -- ci -- pio_et _ nunc et semper _ et in sae -- cula _ saecu - lo - - rum, a -- men,

    et in sae -- cula _ saecu - lo -- rum, et in sae -- cula _ saecu - lo -- rum, a - - - - - - - men

    a -- men a - - - - - - - men a -- men a -- men a -- men.

}

IIalton = \relative do' {

    \autoBeamOff

    R2*6
    do2^\p
    fa

    %9
    mi
    sol
    fa

    %12
    do'
    sib4 sib8 sib
    sol2

    %15
    fa
    fa
    mi4  r8 sol

    %18
    sol[fa16 mi] sol4\mbreak
    sol8 mi sol sol
    sol[fa16 mi] sol4

    %21
    sol8[mi sol si]
    sol16 [la sol mi] fa [sol fa re]
    mi [sol fa mi] fa [la sol fa]

    %24
    sol [la sol mi] fa [sol fa re]
    mi8. fa16 sol8 sol
    sol4 sol8 sol

    %27
    sol2
    sol4 r8 sol\mbreak
    sol4 sol8 sol

    %30
    sol2
    sol\fermata
    R

    %33
    la8 la la si
    do4 la8 sold
    la4 la8 si

    %36
    do[la] la si
    do la r do\mbreak
    la mi r do'

    %39
    la4 la
    la sold8 sold
    la4 r

    %42
    la8 la la la
    la la16 la la8 la
    sol sol r la

    %45
    la2
    sol
    fad8 fad sol4\mbreak

    %48
    fad fa
    mi mib
    re8 re sol sol

    %51
    sol4 fad
    sol2\fermata
    sol4 sol8 sol

    %54
    sol mi r4
    sol4 sol8 sol
    sol16 mi mi8 r4

    %57
    sol16[la] si[do] re8 si16 si\mbreak
    sol8 sol sol sol
    sol sol sol sol

    %60
    sol16 sol sol sol sol8 sol
    sol sol si si
    la la16 la la8 la

    %63
    sol4~sol16[fad sol la]
    si8 sol sol8[(fad)]
    sol4 sol8 sol\mbreak

    %66
    sol fa?16 mi sol8 sol
    sol sol sol sol
    sol fa16 mi sol8 sol

    %69
    sol mi mi16[fa sol mi]
    do[re mi do] fa[sol la fa]
    re[mi fa re] sol[la si sol]

    %72
    mi[fa sol mi] la[sol fa mi]
    re8 mi re4\mbreak
    mi mi16[fa sol mi]

    %75
    do[re mi do] fa[sol la fa]
    re[mi fa re] sol[la si sol]
    mi[fa sol mi] la[sol fa mi]

    %78
    re8 mi re4
    mi sol
    sol sol

    %81
    sol2

}

IItestoII = \lyricmode {

    Fi -- at pax - - - - in vir -- tu -- te tu -- a; et a -- bun -- danti - a et a -- bun -- dan - - - - - - - tia _

    in tur -- ribus _ tu -- is in tur -- ribus _  tu -- is.

    Propter _ fratres _ meos _ et pro -- ximos _ pro -- ximos _ meos _ lo -- quebar _ lo -- quebar _

    pacem _ de te.

    Propter _ domum _ Do -- mini _ Dei _ nostri _ quae -- si -- vi bo -- na

    quae -- si -- vi bo -- na ti -- bi bo -- na ti - bi.

    Glo -- ria _ Patri _ Patri _ et Fili - o et Spiri - tui _ Sancto _ sicut _ erat _ in

    prin -- ci -- pio _ et nunc et semper _ et in sae -- cula _ saecu - lo - rum, a -- men,

    et in sae -- cula _ saecu - lo -- rum, et in sae -- cula _ saecu - lo -- rum, a - - - - - - - men

    a -- men a - - - - - - - men a -- men a -- men a -- men.

}

IItenoren = \relative do' {

    \autoBeamOff

    R2*6
    la2^\p
    do

    %9
    do~
    do4 mi
    do2

    %12
    la
    fa'4 re8 re
    do2

    %15
    do
    re
    sol,4 r8 do

    %18
    do4 si8[re]\mbreak
    mi do do si
    do4 si8[re]

    %21
    mi do mi sol,
    do4 sol
    do sol

    %24
    do sol
    sol8. sol16 do8 do
    si4 re8 re

    %27
    do4 si
    do r8 do\mbreak
    si4 re8 re

    %30
    do4 si
    do2\fermata
    do8 do do sold

    %33
    la[do] mi mi
    mi4 mi8 mi
    mi4 mi8 mi

    %36
    mi4 mi8 mi
    mi mi r mi\mbreak
    mi do r mi

    %39
    mi4 mi
    mi mi8 mi
    mi4 r

    %42
    mi8 mi mi mi
    re re16 re re8 re
    re re r fad

    %45
    mi4 fad
    re mi
    la,8 re r si\mbreak

    %48
    la4 si
    sol la
    si8 si re re

    %51
    re2
    re\fermata
    do4 si8 re

    %54
    mi do r4
    do si8 re
    mi16 do do8 r4

    %57
    re8 re si si16 si\mbreak
    do8 sol mi' mi
    re re re do16[re]

    %60
    mi mi mi mi do8 do
    do si re re
    re re16 re fad8 fad

    %63
    re2~
    re8 re re4
    si si8 si\mbreak

    %66
    do do16 do si8 re
    mi mi mi si
    do do16 do si8 re

    %69
    mi mi sol,4
    la2
    si

    %72
    do
    sol8 sol sol4\mbreak
    sol sol

    %75
    la2
    si
    do

    %78
    sol8 sol sol4
    sol si
    do si

    %81
    do2

}

IItestoIII = \lyricmode {

    Fi -- at pax - - - - in vir -- tu -- te tu -- a; et a -- bun -- danti - a et a -- bun -- dan -- tia, _

    et a -- bun -- dan - - - - tia _ in tur -- ribus _ tu - is in tur -- ribus _  tu - is.

    Propter _ fratres _ meos _ et pro -- ximos _ meos. _ et pro -- ximos _ meos _

    lo -- quebar _ lo -- quebar _ pacem _ de te.

    Propter _ domum _ Do -- mini _ Dei _ nostri _ quae -- si -- vi bo -- na

    tibi, _ quae -- si -- vi bo -- na ti -- bi bo -- na ti -- bi.

    Glo -- ria _ Patri _ Patri _ et Fili - o et Spiri - tui _ Sancto _ sicut _ erat _ in

    prin -- ci -- pio _ et nunc et semper _ et in sae -- cula _ saecu - lo -- rum, a -- men,

    et in sae -- cula _ saecu - lo -- rum, et in sae -- cula _ saecu - lo -- rum, a - - - - men

    a -- men a - - - - men a -- men a -- men a -- men.

}

IIbasson = \relative do {

    \autoBeamOff

    R2*6
    fa2^\p
    fa

    %9
    do~
    do
    fa~

    %12
    fa
    sib,4 re8 re
    mi2

    %15
    fa
    si,
    do4 r8 do'

    %18
    do4 sol\mbreak
    do8 do, do sol'
    do4 sol

    %21
    sol2~
    sol~
    sol~

    %24
    sol
    do,8. do16 do8 do
    sol'4 sol8 sol

    %27
    do4 sol
    do, r8 do\mbreak
    sol'4 sol8 sol

    %30
    do4 sol
    do,2\fermata
    la'8 la la mi

    %33
    la4 la8 mi
    la4 la8 mi
    la4 la8 mi

    %36
    la4 la8 mi
    la la r la\mbreak
    la la r la

    %39
    la4 la
    mi mi8 mi
    la4 r

    %42
    la8 la la la
    fad fad16 fad fad8 fad
    sol sol r re

    %45
    la'4 re,
    sol dod,
    re8 re r sol\mbreak

    %48
    re4 sol
    do, fad
    sol8 sol sol sol

    %51
    re'4 re,
    sol2\fermata
    do4 sol8 sol

    %54
    do, do r4
    do' sol8 sol
    do,16 do do8 r4

    %57
    sol'8 sol sol sol16 sol\mbreak
    do8 do, do' do
    sol sol sol sol

    %60
    do16 do, do do do8 do
    sol' sol sol sol
    re re16 re re8 re

    %63
    sol[la si la]
    sol8 sol re4
    sol sol8 sol\mbreak

    %66
    do do,16 do sol'8 sol
    do do, do sol'
    do do,16 do sol'8 sol

    %69
    do do, do do
    fa fa16 fa re8 re
    sol sol mi mi

    %72
    la la16 la fa8 fa
    sol do, sol'4\mbreak
    do, do8 do

    %75
    fa fa16 fa re8 re
    sol sol mi mi
    la la16 la fa8 fa

    %78
    sol do, sol'4
    do, sol'
    do, sol'

    %81
    do,2

}

IItestoIV = \lyricmode {

    Fi -- at pax - - in vir -- tu -- te tu -- a; et a -- bun -- danti - a et a -- bun -- dan - tia _

    in tur -- ribus _ tu - is in tur -- ribus _  tu - is.

    Propter _ fratres _ meos _ et pro -- ximos _ meos. _ et pro -- ximos _ meos _

    lo -- quebar _ lo -- quebar _ pacem _ de te.

    Propter _ domum _ Do -- mini _ Dei _ nostri _ quae -- si -- vi bo -- na

    tibi, _ quae -- si -- vi bo -- na ti -- bi bo -- na ti - bi.

    Glo -- ria _ Patri _ Patri _ et Fili - o et Spiri - tui _ Sancto _ sicut _ erat _ in

    prin -- ci -- pio _ et nunc et semper _ et in sae -- cula _ saecu - lo - rum, a -- men,

    et in sae -- cula _ saecu - lo -- rum, et in sae -- cula _ saecu - lo -- rum,

    et in sae -- cula _ saecu - lo -- rum,  et in sae -- cula _ saecu - lo -- rum, a -- men

    et in sae -- cula _ saecu - lo -- rum,   et in sae -- cula _ saecu - lo -- rum,

    a -- men a -- men a -- men.

}

IIbcn = \relative do {

    fa8\p[fa fa fa]
    fa[fa fa fa]
    do[do do do]

    %4
    do[do do do]
    fa[fa fa fa]
    fa[fa fa fa]\mbreak

    %7
    fa[fa fa fa]
    fa[fa fa fa]
    do[do do do]

    %10
    do[do do do]
    fa[fa fa fa]
    fa[fa fa fa]

    %13
    sib,[sib re re]
    mi[mi mi mi]
    fa[fa fa fa]

    %16
    si,![si si si]
    do4 r8 do'\f
    do do, sol' sol,\mbreak

    %19
    do'[do, do sol']
    do[do, sol' sol,]
    sol'2\tasto~

    %22
    sol~
    sol~
    sol

    %25
    do,8[do, do do']
    sol'[sol, sol sol']
    do do, sol' sol,

    %28
    do[do, do do']\mbreak
    sol'[sol, sol sol']
    do do, sol' sol,

    %31
    do,2\fermata
    la''8[la, la mi']
    la[la, la mi']

    %34
    la[la, la mi']
    la[la, la mi']
    la[la, la mi']

    %37
    la[la, la la']\mbreak
    la[la, la la']
    la[la, la la']

    %40
    mi[mi, mi mi']
    la[la, la la']
    la[la, la la']

    %43
    fad[fad, fad fad']
    sol[sol, fad' re]
    la'[la re, re]

    %46
    sol[sol dod, dod]
    re re, si'' sol\mbreak
    re[re sol sol]

    %49
    do,[do fad fad]
    sol sol, sol' sol
    re'4 re,

    %52
    sol,2\fermata
    do'8[do, sol' sol,]
    do[do, do sol'']

    %55
    do do, sol' sol,
    do do, do'' do,
    sol'[sol, sol sol']\mbreak

    %58
    do[do, do' do]
    sol[sol, sol sol']
    do[do, do do]

    %61
    sol'[sol, sol sol']
    re[re, re re']
    sol[la si la]

    %64
    sol sol, re' re,
    sol'[sol, sol sol']\mbreak
    do do, sol' sol,

    %67
    do' do, do sol'
    do do, sol' sol,
    do'[do, do do]

    %70
    fa[fa re re]
    sol[sol mi mi]
    la[la16 la fa8 fa]

    %73
    sol[do, sol' sol,]\mbreak
    do do, do' do
    fa [fa re re]

    %76
    sol[sol mi mi]
    la[la fa fa]
    sol [do, sol' sol,]

    %79
    do do, sol'' sol,
    do do, sol'' sol,
    do2

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




}


forma = {

    \time 2/4
    \key fa\major
    \tempo 2 = 40
    s2*16
    \key do\major
    s4\fermata s8 s
    \once \override Score.RehearsalMark.extra-offset = #'(+4 . -2.0)
    \mark \markup\huge {[5.] All[egr]o}
    \tempo 2 = 53
    s2*14
    \bar "||"\break
    s2*20
    s2
    \bar "||"\break
    s2*28
    s2\fermata
    \bar "|."

}

IIvlI = {
    %\notypeset
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
    \new Voice = "fiat1"
    <<\IIsopranon \forma>>
}

IIalto = {
    \new Voice = "fiat2"
    <<\IIalton \forma>>
}

IItenore = {
    \new Voice = "fiat3"
    <<\IItenoren \forma>>
}

IIbasso = {
    \clef bass
    \new Voice = "fiat4"
    <<\IIbasson \forma>>
}

IIbc = {
    \clef bass
    <<\IIbcn \forma \IIbfn>>
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

    systems-per-page = #2
    print-first-page-number = ##t
    first-page-number = #2

}

    \header {
        subtitle = \markup "Lætatus sum a 4 voci con Strumenti [RV 827] "
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
                    \set Staff.instrumentName = \markup \center-column{"Viole"}
                    \set Staff.midiInstrument = #"viola"
                    \Ivla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key do\major \time 2/4\numericTimeSignature r2^\markup\center-align "Canti"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Isoprano \global
                    \new Lyrics \lyricsto "lætatus1" \ItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key do\major \time 2/4\numericTimeSignature r2^\markup\center-align "Alti"}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ialto \global
                    \new Lyrics \lyricsto "lætatus2" \ItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key do\major \time 2/4\numericTimeSignature r2^\markup\center-align"Tenori"}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \Itenore \global
                    \new Lyrics \lyricsto "lætatus3" \ItestoIII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{"Bassi"}
                    \set Staff.midiInstrument = #"voice oohs"
                    \Ibasso \global
                    \new Lyrics \lyricsto "lætatus4" \ItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Coro"\vspace #-0.2"pieno"}
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
                \override SpacingSpanner.base-shortlætatus-duration = #(ly:make-moment 1/4)
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

    \markup \huge {[4.] And[ant]e}

    \score {
        <<

            \new ChoirStaff <<

                \new PianoStaff <<

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
                    \set Staff.midiInstrument = #"viola"
                    \IIvla\global
                >>
            >>

            \new ChoirStaff  <<

                \new Staff  <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef soprano \key fa\major \time 2/4\numericTimeSignature r2}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIsoprano \global
                    \new Lyrics \lyricsto "fiat1" \IItestoI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef alto \key fa\major \time 2/4\numericTimeSignature r2}
                    \clef violin
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIalto \global
                    \new Lyrics \lyricsto "fiat2" \IItestoII
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column{""}
                    \incipit { \clef tenor \key fa\major \time 2/4\numericTimeSignature r2}
                    \clef "treble_8"
                    \set Staff.midiInstrument = #"voice oohs"
                    \IItenore \global
                    \new Lyrics \lyricsto "fiat3" \IItestoIII
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"voice oohs"
                    \IIbasso \global
                    \new Lyrics \lyricsto "fiat4" \IItestoIV
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"contrabass"
                \IIbc\global
            >>
        >>

        \layout {

            indent = 1.5\cm
            incipit-width =1.5\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #1.5
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #6
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
                \override StaffGrouper.staff-staff-spacing.basic-distance = #6
                \override SpacingSpanner.base-shortlætatus-duration = #(ly:make-moment 1/4)
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
