\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

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

Iglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

Ivln = \relative do'' {

    re16 la fad re re' la fad re re'8 la fad re
    re'16 la fad re re' la fad re re'8 la fad re
    re'8[dod16 si la8 sol] fad mi re4

    %4
    fad'16[re fad re fad re fad re] <<{re[re re re re re re re]}\\{si[si si si si si si si]}>>
    mi [dod mi dod mi dod mi dod] <<{dod[dod dod dod dod dod dod dod]}\\{la[la la la la la la la]}>>
    re[si re si re si re si]\mbreak <<{si[si si si si si si si]}\\{sol[sol sol sol sol sol sol sol]}>>

    %7
    dod[re mi re dod si la sol] fad8 re la mi'
    la, fad' la, sol' la, la' la, sol'
    la, fad' la, mi' la,4 do'

    %10
    si8 la16 sol re'4 dod8 si 16 la mi'4
    re8 dod16 si fad'4 mi8 re16 dod sol'4
    fad8[mi16 re dod si la sol] fad8 re' la, dod'

    %13
    re4 r8 <<
        {
            la la la la la
            la la la la la la la la
            la la la la la
        }\\{
            fad16 mi fad8[fad16 mi fad8 fad]
            fad[re re fad16 mi] fad8[fad16 mi fad8 fad]
            fad[re re fad16 mi] fad8[re'16 dod re8 la]
        }
    >>

    %16
    <<{la la la fad'\p}\\{fad, [re re]}>> fad'16(mi fad) sol fad(mi fad) sol
    mi(re mi) fad mi(re mi) fad sol(fad sol) la sol(fad sol) la
    fad(mi fad) sol fad(mi fad) sol\mbreak la(sol la) si la(sol la) si

    %19
    sol(fad sol) la sol(fad sol) la fad(mi fad) sol fad(mi fad) sol
    mi2\tr~mi
    re16\f la re la fad re fad re la8 la la la
    re'16 la re la fad re fad re la8 la la la

    %23
    dod'16 la mi dod' re si mi, re' dod la mi dod' re si mi, re'\mbreak
    dod la mi dod'  re si mi, re' dod4 \appoggiatura {dod16[re]} mi4
    \appoggiatura re8 dod si16 la  <<si4\tr\\mi,>> la4 \appoggiatura {dod16[re]} mi4

    %26
    \appoggiatura re8 dod si16 la <<si4\tr\\mi,>> la16\tu mi dod la la' mi dod la
    la' 8mi dod la la'16 mi dod la la' mi dod la
    la'8[sold16 fad mi8 re] dod si la4

    %29
    mi''16[dod mi dod mi dod mi dod]\mbreak <<{lad[lad lad lad lad lad lad lad]}\\{fad[fad fad fad fad fad fad fad]}>>
    re'[si re si re si re si] <<{si[si si si si si si si]}\\{sol?[sol sol sol sol sol sol sol]}>>
    mi' si mi si sol mi sol mi fad si si si re, si' si si

    %32
    mi, si' si si fad si si si sol si si si re, si' si si
    mi, si' si si fad lad lad lad si\solo\f fad si, fad' si fad si, fad'\mbreak
    si fad si, fad' si fad si, fad' dod' fad, lad, fad' dod' fad, lad, fad'

    %35
    dod' fad, lad, ?fad' dod' fad, lad, fad' re' fad, si, fad'  re' fad, si, fad'
    re' fad, si, fad'  re' fad, si, fad'  mi' sol, si, sol' mi' sol, si, sol'
    mi' sol, si, sol' mi' sol, si, sol' mi' fad, lad, fad' mi' fad, lad, fad'

    %38
    mi' fad, lad,? fad' mi' fad, lad, fad' <<{re'8 [si]}\\\stemUp\once \override Stem #'transparent = ##t  fad4\\\stemDown si,>> r8 re'16\p mi
    fad8[fad fad\tr mi16 fad] sol fad mi8 r dod16 re\mbreak
    mi8[mi mi\tr re16 mi] fad mi re8 r si16 dod

    %41
    re8[re re\tr dod16 si] dod si la8 r dod\f
    si16[dod re dod si la sold fad] mid dod mid dod fad dod fad dod
    sold' dod, sold' dod, la' dod, la' dod, sold' dod, sold' dod, fad dod fad dod

    %44
    mid dod mid dod \appoggiatura {si'16[dod]} re4\p \appoggiatura  re8 dod si16(la) \appoggiatura dod8 si la16(sold)
    \appoggiatura si8 la sold16(fad) 	\appoggiatura {si16[dod]} re4\mbreak  \appoggiatura  re8 dod si16(la) \appoggiatura dod8 si la16(sold)
    \appoggiatura si8 la\f sold16(fad) <<sold4\tr\\dod,>> <<<la' fad>\\dod,>> r8 la'\tu

    %47
    re16 la fad re re' la fad re re'8 la fad re
    re'16 la fad re re' la fad re re'8 la fad re
    re'8[dod16 si la8 sol] fad mi <<{re[la']}\\{s8 fad}>>

    %50
    <<
        {
            la\solo la la la la re, la la'
            la la la la la re, la la'
            la s la s la s la s
            la s la s la [la]
        }\\{
            fad[mi16 fad sol8 sol] fad4 s8 fad
            fad[mi16 fad sol8 sol] fad4 s
            fad16(mi re) fad mi fad sol mi fad(mi re) fad mi fad sol mi
            fad(mi re) fad mi fad sol mi fad8 [re]
        }
    >> r8 re'\p

    %54
    fad32(mi re8.) fad32(mi re8.) dod32(si la8.) dod32(si la8.)
    sol'32 (fad mi8.) sol32(fad mi8.) fad32(mi re8.) fad32(mi re8.)
    la'32(sol fad8.) la32(sol fad8.)\mbreak fad4 mi8 la,

    %57
    <<{la16 la la la}\\{fad re fad re}>> la la la la <<{la'16 la la la}\\{fad re fad re}>> la la la la
    re fad la re re, fad la re re,[re' dod si la sol fad mi]
    fad8 mi16 re <<mi4\tr\\la,>> re16 fad la re re, fad la re

    %60
    re,[re' dod si la sol fad mi] fad8 mi16 re <<mi4\tr\\la,>>
    re16 [re' fad re fad re fad re] <<{re[re re re re re re re]}\\{si[si si si si si si si]}>>
    mi [dod mi dod mi dod mi dod] <<{dod[dod dod dod dod dod dod dod]}\\{la[la la la la la la la]}>>

    %63
    re[si re si re si re si]\mbreak <<{si[si si si si si si si]}\\{sol[sol sol sol sol sol sol sol]}>>
    dod[re mi re dod si la sol] fad8 re la mi'
    la, fad' la, sol' la, la' la, sol'

    %66
    la, fad' la, mi' la,4 do'
    si8 la16 sol re'4 dod8 si16 la mi'4
    re8 dod16 si fad'4 mi8 re16 dod sol'4

    %69
    fad8[mi16 re dod si la sol] fad8 re' la, dod'
    re4\fermata r r2

}

IvlIn =  \relative do'' {

    re16 la fad re re' la fad re re'8 la fad re
    re'16 la fad re re' la fad re re'8 la fad re
    re'8[dod16 si la8 sol] fad mi re4

    %4
    fad'16[re fad re fad re fad re] re[re re re re re re re]
    mi [dod mi dod mi dod mi dod]  dod[dod dod dod dod dod dod dod]
    re[si re si re si re si]\mbreak si[si si si si si si si]

    %7
    dod[re mi re dod si la sol] fad8 re la mi'
    la, fad' la, sol' la, la' la, sol'
    la, fad' la, mi' la,4 do'

    %10
    si8 la16 sol re'4 dod8 si 16 la mi'4
    re8 dod16 si fad'4 mi8 re16 dod sol'4
    fad8[mi16 re dod si la sol] fad8 re' la, dod'

    %13
    re4 r r2
    R1*6
    mi16[dod mi dod mi dod mi dod] la[mi la mi la mi la mi]

    %21
    R1*5
    r2 la16\f mi dod la la' mi dod la
    la' 8mi dod la la'16 mi dod la la' mi dod la

    %28
    la'8[sold16 fad mi8 re] dod si la4
    mi''16[dod mi dod mi dod mi dod]\mbreak lad[lad lad lad lad lad lad lad]
    re[si re si re si re si] si[si si si si si si si]

    %31
    mi si mi si sol mi sol mi fad si si si re, si' si si
    mi, si' si si fad si si si sol si si si re, si' si si
    mi, si' si si fad lad lad lad si4 r

    %34
    R1*12
    r2 r4 r8 la\f
    re16 la fad re re' la fad re re'8 la fad re

    %48
    re'16 la fad re re' la fad re re'8 la fad re
    re'8[dod16 si la8 sol] fad mi re4
    R1*11

    %61
    fad'16[re fad re fad re fad re] re[re re re re re re re]
    mi [dod mi dod mi dod mi dod]  dod[dod dod dod dod dod dod dod]
    re[si re si re si re si]\mbreak si[si si si si si si si]

    %64
    dod[re mi re dod si la sol] fad8 re la mi'
    la, fad' la, sol' la, la' la, sol'
    la, fad' la, mi' la,4 do'

    %67
    si8 la16 sol re'4 dod8 si 16 la mi'4
    re8 dod16 si fad'4 mi8 re16 dod sol'4
    fad8[mi16 re dod si la sol] fad8 re' la, dod'

    %70
    re4\fermata r r2

}

IvlIIn = \relative do'' {

    re16 la fad re re' la fad re re'8 la fad re
    re'16 la fad re re' la fad re re'8 la fad re
    re'8[dod16 si la8 sol] fad mi re4

    %4
    fad'16[re fad re fad re fad re] si[si si si si si si si]
    mi [dod mi dod mi dod mi dod]  la[la la la la la la la]
    re[si re si re si re si]\mbreak sol[sol sol sol sol sol sol sol]

    %7
    dod[re mi re dod si la sol] fad8 re la mi'
    la, fad' la, sol' la, la' la, sol'
    la, fad' la, mi' la,4 la'

    %10
    sol8 fad16 sol si4 la8 sold16 la dod4
    si8 la16 si re4 dod8 si16 dod mi4
    re8[dod16 si la sol fad mi] re8 re' la, dod'\mbreak

    %13
    re4 r r2
    R1*6
    dod16[la dod la dod la dod la] mi[dod mi dod mi dod mi dod]

    %21
    R1*5
    r2 la'16\f mi dod la la' mi dod la
    la' 8mi dod la la'16 mi dod la la' mi dod la

    %28
    la'8[sold16 fad mi8 re] dod si la4
    mi''16[dod mi dod mi dod mi dod]\mbreak lad[lad lad lad lad lad lad lad]
    re[si re si re si re si] si[si si si si si si si]

    %31
    mi si mi si sol mi sol mi fad si si si re, si' si si
    mi, si' si si fad si si si sol si si si re, si' si si
    mi, si' si si fad lad lad lad si4 r

    %34
    R1*12
    r2 r4 r8 la\f
    re16 la fad re re' la fad re re'8 la fad re

    %48
    re'16 la fad re re' la fad re re'8 la fad re
    re'8[dod16 si la8 sol] fad mi re4
    R1*11

    %61
    fad'16[re fad re fad re fad re] si[si si si si si si si]
    mi [dod mi dod mi dod mi dod]  la[la la la la la la la]
    re[si re si re si re si]\mbreak sol[sol sol sol sol sol sol sol]

    %64
    dod[re mi re dod si la sol] fad8 re la mi'
    la, fad' la, sol' la, la' la, sol'
    la, fad' la, mi' la,4 la'

    %67
    sol8 fad16 sol si4 la8 sold16 la dod4
    si8 la16 si re4 dod8 si16 dod mi4
    re8[dod16 si la sol fad mi] re8 re' la, dod'\mbreak

    %70
    re4\fermata r r2

}

Ivlan =  \relative do' {

    fad8 fad fad fad re' la fad re
    fad fad fad fad re' la fad re
    fad sol mi dod la4 la

    %4
    la'8 la la la sol16[sol sol sol sol sol sol sol]
    sol8 sol sol sol fad16[fad fad fad fad fad fad fad]
    fad8 fad fad fad\mbreak mi16[mi mi mi mi mi mi mi]

    %7
    mi8 mi mi dod la4 la
    la la la la
    la la  la8 mi' la fad

    %10
    re4 si'8 sold mi4 dod'8 lad
    fad4 re'8 si sol4 mi'8 dod
    la si mi, dod la si la la'\mbreak

    %13
    fad4 r r2
    R1*6
    la,8 la la la la la la la

    %21
    R1*5
    r2 dod8 dod dod dod
    la' mi dod la dod dod dod dod

    %28
    la'[sold16 fad mi8 re] dod si la4
    dod'16[la dod la dod la dod la]\mbreak dod, dod dod dod dod dod fad fad
    fad[fad fad fad fad fad si, si] si8 si si si

    %31
    sol' sol si, si si si re re
    mi mi fad fad sol sol re re
    mi mi fad fad si,4 r\mbreak

    %34
    R1*12
    r2 r4 r8 fad'
    fad fad fad fad re' la fad re

    %48
    fad fad fad fad re' la fad re
    re'[dod16 si la8 sol] fad mi re re
    R1*11

    %61
    la'8 la la la sol16[sol sol sol sol sol sol sol]
    sol8 sol sol sol fad16[fad fad fad fad fad fad fad]
    fad8 fad fad fad\mbreak mi16[mi mi mi mi mi mi mi]

    %64
    mi8 mi mi dod la4 la
    la la la la
    la la  la8 mi' la fad

    %67
    re4 si'8 sold mi4 dod'8 lad
    fad4 re'8 si sol4 mi'8 dod
    la si mi, dod la si la la'\mbreak

    %70
    fad4\fermata r r2

}

Ibcn = \relative do {

    re8 re re re re'la fad re
    re re re re re' la fad re
    re sol dod, la re mi fad re

    %4
    re re re re sol16[sol sol sol sol sol sol sol] %ripresa
    dod,8 dod dod dod fad16[fad fad fad fad fad fad fad]
    si,8 si si si\mbreak mi16[mi mi mi mi mi mi mi]

    %7
    la,8 la la la la4 la
    la la la la
    la la la8 la' fad re

    %10
    sol sol, sold' mi la la, lad' fad
    si si, si' sol dod dod, dod' la
    re sol, la la, re16 mi fad sol la8 la,\mbreak

    %13
    re4 r8 re re re re re %fine rip.
    re8 re, re re' re re re re
    re re, re re' re re re re

    %16
    re [re,] \once\stemUp re re'' re re re re
    dod dod dod dod mi mi mi mi
    re re re re\mbreak fad fad fad fad

    %19
    mi mi mi mi re re re re
    la la, la la' la la, la la'
    re,4 re la8 la la la

    %22
    re4 re la8 la la la
    la' la sold sold la la sold sold\mbreak
    la la sold sold la si dod sold

    %25
    la la, mi'[mi,] la la' dod sold
    la la, mi'[mi,] la la la la
    la' mi dod la la la la la

    %28
    la'[sold16 fad mi8 re] dod8 si la4
    la'8 la, la la'\mbreak fad16[fad fad fad fad fad fad fad]
    si,8 si si si mi mi mi mi

    %31
    mi mi mi mi re re re re
    mi mi fad fad sol sol re re
    mi mi fad fad si, dod re dod\mbreak

    %34
    si dod re si fad' sold lad sold
    fad sold lad fad si, dod re dod
    si dod re si mi fad sol? fad

    %37
    mi fad sol mi fad sold lad sold
    fad sold lad fad si si, si4
    si'8 fad re si mi sol, mi r\mbreak

    %40
    la' mi dod la re fad, re r
    sold' mi si sold la' mi la, r
    re4. re8 dod dod dod dod

    %43
    dod dod dod dod dod dod dod dod
    dod sold' si mid, fad fad, si dod
    fad fad, si' mid,\mbreak fad, fad' si, dod

    %46
    fad, fad' dod dod, fad4 r8 re'
    re re re re re' la fad re
    re re re re re' la fad re

    %49
    re'[dod16 si la8 sol] fad mi re re
    re4 dod re8 re, r re'
    re4 dod\mbreak re8 re, r re'

    %52
    re re, dod'[dod,] re' re, dod'[dod,]
    re' re, dod'[dod,] re' mi fad re
    re' fad, re' fad, la dod, la' dod,

    %55
    mi' sol, mi' sol, si re, si' re,
    re' re, re'[re,]\mbreak la si dod la
    re re la la re re la la

    %58
    re4 re re r
    re8 re, la''[la,] re4 re
    re r re8 re, la''[la,]

    %61
    re re re re sol16[sol sol sol sol sol sol sol] %ripresa
    dod,8 dod dod dod fad16[fad fad fad fad fad fad fad]
    si,8 si si si\mbreak mi16[mi mi mi mi mi mi mi]

    %64
    la,8 la la la la4 la
    la la la la
    la la la8 la' fad re

    %67
    sol sol, sold' mi la la, lad' fad
    si si, si' sol dod dod, dod' la
    re sol, la la, re16 mi fad sol la8 la,\mbreak

    %70
    re4\fermata r r2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \time 4/4
    \tempo 2 = 55
    s1*70
    \bar"|."

}

Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln \forma>>

}

IvlI = {
    \Iglobal
    <<\IvlIn \forma>>

}

IvlII = {
    \Iglobal
    <<\IvlIIn \forma>>

}

Ivla = {
    \Iglobal
    \clef alto
    <<\Ivlan \forma>>

}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn \forma \Ibfn>>
    \typeset

}

IIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
    \terzine \con
}

IIvln = \relative do'' {

    mi,8
    la16(dod mi dod la8) mi\tr la16. si32 dod8 r dod
    re64(dod si16.) si64[(la sold16.)] sold64(fad mi16.) re'64[(dod si16.)]dod16 si la8 r mi'
    \tuplet 3/2 { fad16[(mi re]} re8 la') fad \senza \tuplet 3/2 { mi16(re dod dod[si la] } la8) mi'

    %4
    \tuplet 3/2 { re16(dod si si[la sold] } sold8) re'\mbreak re\tr dod r dod
    \tuplet 3/2 { dod16(mi re dod[si la)] dod16(mi re dod[si la)] red(fad mi red[dod si)] red(fad mi red[dod si)]}
    \tuplet 3/2 { sold'(fad mi)~ }mi8\noBeam ~\tuplet 3/2 { mi16(fad sold la[sold fad)] sold(fad mi~)} mi8\noBeam~\tuplet 3/2 {
        mi16 (fad sold la[sold fad)]

        %7
        sold(fad mi) la[(sold fad)]
    } fad8.\tr mi16 \mbreak mi4 r16 mi fad16. sold32
    dod,16. dod32 re16. mi32 lad,16. lad32 si16. dod32 fad,16 dod'-.(dod-. dod-. dod-. dod-. dod-. dod-.)
    re16. dod32 si8 r16 re mi16. fad32 si,16. si32 dod16. re32 sold,16. sold32 la16. si32

    %10
    mi,16[si'-.(si-. si-. si-. si-. si-. si-.)] dod16. si32 la8 r mi'\mbreak
    \tuplet 3/2 { fad16(mi re re[dod si)] si(la sold si[dod re)] mi(re dod dod[si la)] la(sold fad la[si dod)] }
    \tuplet 3/2 { re(dod si si[la sold)] sold(fad mi si'[dod re)] } dod8\tr si \tuplet 3/2 { r16 dod(re mi[re dod)] }

    %13
    dod8\tr si \tuplet 3/2 { r16 re(mi fad[mi re)] } re8\tr dod r si\mbreak
    dod16(re mi la,) si(dod re sold,) dod(re mi la,) si(dod re sold,)
    la1\fermata

}

IIvlIn =  \relative do'' {

    r8
    mi mi mi mi mi mi mi mi
    mi mi mi mi mi mi mi mi
    fad fad fad fad  mi mi mi mi

    %4
    re re re re\mbreak re dod dod dod
    dod dod dod dod red red red red
    mi mi mi fad mi mi mi fad

    %7
    mi la fad [fad] mi mi mi mi
    dod dod dod dod dod dod dod dod
    re re re re si si si si

    %10
    si si si si dod dod dod dod\mbreak
    dod dod si si si si la la
    la la sold re' dod si dod dod

    %13
    dod si re[re] re dod si[si]\mbreak
    dod dod si si dod dod si si
    dod1\fermata

}

IIvlIIn = \relative do'' {

    r8
    dod dod dod dod dod dod dod dod
    si si si si dod dod dod dod
    re re re re mi mi mi mi

    %4
    si si si si\mbreak la la la la
    la la la la la la la la
    sold sold sold red' si si si si

    %7
    si mi red[red]\mbreak  si si si si
    lad lad lad lad lad lad lad lad
    si si si si sold sold sold sold

    %10
    sold sold sold sold la la la la\mbreak
    la la sold sold sold sold fad fad
    fad fad mi si' la sold la la

    %13
    la sold si[si] si la sold sold\mbreak
    la la sold sold la la sold sold
    la1\fermata

}

IIvlan =  \relative do' {

    r8
    la' la la la la la la la
    sold sold sold sold la la la la
    la la la la la la la dod

    %4
    sold sold sold sold\mbreak mi mi mi mi
    mi mi la la fad fad fad red
    si si si si si si si si

    %7
    si la si si\mbreak sold sold mi' mi
    mi mi mi mi mi mi mi mi
    fad fad re re re re re re

    %10
    re re re re mi mi la la\mbreak
    fad fad re re mi mi dod dod
    re re si sold' mi mi mi mi

    %13
    mi mi mi mi mi mi mi mi\mbreak
    la, la mi' mi la, la mi' mi
    la,1\fermata

}

IIbcn = \relative do {

    r8
    la la la la la la la la
    mi mi mi mi la la la la
    re re re re dod dod dod dod

    %4
    si si mi, mi\mbreak la la la la
    la la la la la la la la
    mi' mi mi red mi mi mi red

    %7
    mi dod' si si,\mbreak mi mi mi mi
    fad fad fad fad fad fad fad fad
    si, si si re mi mi mi mi

    %10
    mi mi mi mi la, la la la\mbreak
    re re sold sold dod, dod fad fad
    si, si mi mi mi mi mi mi

    %13
    mi mi mi mi mi mi mi mi\mbreak
    la, la mi' mi la, la mi' mi
    la,1\fermata

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key la\major
    \time 4/4
    \tempo 4 = 50
    \partial 8 s8
    s1*15
    \bar"|."

}

IIvl = {
    \IIglobal
    %\notypeset
    <<\IIvln \forma>>

}

IIvlI = {
    \IIglobal
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
    <<\IIbcn \forma \IIbfn>>
    \typeset

}

IIIglobal = {
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletBracket #'bracket-visibility = ##f
}

IIIvln = \relative do'' {

    re,8 re la
    re re la
    re re la

    %4
    re16 re' dod si la sol
    fad si la sol fad mi
    re8 re la

    %7
    re re la
    re re la
    re16 re' dod si la sol

    %10
    fad8 mi re
    re'16 mi re mi re mi  %%% rip
    dod8 la la\mbreak

    %13
    si16 dod si dod si dod
    la8 fad fad
    sol16 la sol la sol la

    %16
    fad8 re re
    re16 la re la re la
    re la re la re la

    %19
    re mi fad sol la8
    re sol, la
    re,16 la re la re la

    %22
    re la re la re la
    re mi fad sol la8
    re sol, la\mbreak % fine prima pag allegro2

    %25 OK
    re,4 r8
    re'\p-.(re-. re-.)
    re16(mi fad mi re) r

    %28
    fad8-.(fad-. fad-.)
    fad16(sol la sol fad) r
    fad(sol la sol fad) r

    %31
    mi(fad sol fad mi) r
    re(mi fad mi re) r
    dod8 si la

    %34
    dod16(mi re dod si la)
    re(mi fad4)
    mi16(fad sol4)\mbreak %fine primo sistema p. 10

    %37
    fad16(sol la8) fad
    fad4\tr mi8
    fad,16\f la re la fad re

    %40
    la mi' la, fad' la, sol'
    la, fad' la, sol' la, la'
    la, mi' la, fad' la, sol'

    %43
    la, fad' la, sol' la, la'
    la, mi' la, fad' la, sol'
    <<{la8 la la}\\{fad mi re}>>

    %46
    mi'16\p(dod) dod4\tr
    re16(si) si4\tr
    dod16(la) la4\tr\mbreak

    %49
    la,16^\f (mi' la si dod re)
    mi dod si la sold fad
    mi la <<si4\tr\\mi,>>

    %52
    la16 re <<si4\tr\\mi,>>
    la16 re <<si4\tr\\mi,>>
    la8 la mi

    %55
    la la mi
    la la mi
    la16 la' sold fad mi re

    %58
    dod8 si la
    la'16 si la si la si
    sold8 mi mi

    %61
    fad16 sold fad sold fad sold
    mi8 dod dod
    re16 mi re mi re mi

    %64
    dod8 la la
    la16 mi la mi la mi
    la mi la mi la mi

    %67
    la si dod re mi8
    la, re, mi
    la8. si16 dod8

    %70
    \appoggiatura dod8 <<si4.\tr\\mi,>>
    <si' mi,>8. dod16 re8
    \appoggiatura re8 <<dod4.\tr\\mi,>>

    %73
    \appoggiatura {dod'16[re]} mi8. re16 dod8
    \appoggiatura {si16[dod]} re8. dod16 si8
    \appoggiatura {la16[si]} dod8. si16 la8

    %76
    sold?16[fad] mi4
    mi'32(re) mi(fad) mi[(re) mi(fad)] mi16-. re-.
    dod32(si) dod(re) dod[(si) dod(re)] dod16-. si-.

    %79
    lad-. fad-. lad-. dod-. mi-. dod-.
    re dod si8 r
    si16 dod re8 fad,

    %82
    \appoggiatura {mi16[fad]} sol8 fad4
    si16 dod re8 fad,
    \appoggiatura {mi16[fad]} sol4 fad8

    %85
    <<{si8^\f si si
       si si si}\\{\senza \override TupletBracket #'bracket-visibility = ##f\tuplet 3/2 { fad16(re fad) fad[(re fad)] fad(re fad)
                   fad16(re fad) fad[(re fad)] fad(re fad)}}>>
    re'8 mi dod

    %88
    si4 r8
    <<{si8 si si
       si si si}\\{\senza \override TupletBracket #'bracket-visibility = ##f\tuplet 3/2 { fad16(re fad) fad[(re fad)] fad(re fad)
                   fad16(re fad) fad[(re fad)] fad(re fad)}}>>

    %91
    re'8 mi dod
    si si re
    mi si mi

    %94
    dod la dod
    re la re
    si sol si

    %97
    dod sold dod\mbreak
    lad fad lad
    si fad si

    %100
    dod fad, dod'
    si fad si
    lad fad si

    %103
    mi, dod fad
    si,4 la'8\f
    re,16 fad la re la fad

    %106
    re fad la re la fad
    re la re la re la
    re la re la re la\mbreak

    %109
    re fad la re la fad
    re fad la re la fad
    re4 r8

    %112
    re'16\p mi fad8 r
    mi16 fad sol8 r
    fad(mi re

    %115
    dod si la)
    la16(si do4)
    si16(la sol4)

    %118
    si16(dod? re4)
    dod16(si la4)
    re16(mi fad4)

    %121
    mi16(fad sol4)\mbreak
    fad16(sol la8) fad\noBeam
    fad4\tr mi8

    %124
    re\f re,16 mi fad mi
    re8 re re
    re' re,16 mi fad mi

    %127
    re8 re re
    re'16 la fad re la re
    re' la fad re la re

    %130
    re'8 dod16 si la sol
    fad8 sol mi
    re re'-.\p (re-.

    %133
    re-. re-. re-.)\mbreak
    <<{s8 mi mi
       mi mi mi

       %136
       la fad fad
       fad fad fad}\\{sol dod, dod
                      dod dod dod
                      s re re
                      re re re}>>
    \stemUp sol mi16 fad sol8

    %139
    sol mi16 fad sol8
    sol4\tr fad8\stemNeutral
    re\f re,16 mi fad mi

    %142
    re8 re re
    re' re,16 mi fad mi
    re8 re re

    %145
    re'16 la fad re la re\mbreak
    re' la fad re la re
    re'8 dod16 si la sol

    %148
    fad8 sol mi
    re' dod16 si la sol
    fad8 sol mi
    re4 r8

    %152
    re'16 mi re mi re mi  %%% rip
    dod8 la la\mbreak
    si16 dod si dod si dod

    %155
    la8 fad fad
    sol16 la sol la sol la
    fad8 re re

    %158
    re16 la re la re la
    re la re la re la
    re mi fad sol la8

    %161
    re sol, la
    re,16 la re la re la
    re la re la re la

    %164
    re mi fad sol la8
    re sol, la\mbreak
    re,4\fermata r8

}

IIIvlIn =  \relative do'' {

    re,8 re la
    re re la
    re re la

    %4
    re16 re' dod si la sol
    fad si la sol fad mi
    re8 re la

    %7
    re re la
    re re la
    re16 re' dod si la sol

    %10
    fad8 mi re
    re'16 mi re mi re mi  %%% rip
    dod8 la la\mbreak

    %13
    si16 dod si dod si dod
    la8 fad fad
    sol16 la sol la sol la

    %16
    fad8 re re
    re16 la re la re la
    re la re la re la

    %19
    re mi fad sol la8
    re sol, la
    re,16 la re la re la

    %22
    re la re la re la
    re mi fad sol la8
    re sol, la\mbreak % fine prima pag allegro2

    %25 OK
    re,4 r8
    R4.*28
    la'8 la mi

    %55
    la la mi
    la la mi
    la16 la' sold fad mi re

    %58
    dod8 si la
    la'16 si la si la si
    sold8 mi mi

    %61
    fad16 sold fad sold fad sold
    mi8 dod dod
    re16 mi re mi re mi

    %64
    dod8 la la
    la16 mi la mi la mi
    la mi la mi la mi

    %67
    la si dod re mi8
    la, re, mi
    la4 r8

    %70
    R4.*22
    re8 si re
    mi si mi

    %94
    dod la dod
    re la re
    si sol si

    %97
    dod sold dod\mbreak
    lad fad lad
    si fad si

    %100
    dod fad, dod'
    si fad si
    lad fad si

    %103
    mi, dod fad
    si,4 r8
    R4.*6

    %111
    re16 fad la re la fad
    re4 r8
    R4.*39

    %152
    re'16 mi re mi re mi  %%% rip
    dod8 la la\mbreak
    si16 dod si dod si dod

    %155
    la8 fad fad
    sol16 la sol la sol la
    fad8 re re

    %158
    re16 la re la re la
    re la re la re la
    re mi fad sol la8

    %161
    re sol, la
    re,16 la re la re la
    re la re la re la

    %164
    re mi fad sol la8
    re sol, la\mbreak %
    re,4\fermata r8

}

IIIvlIIn = \relative do'' {

    re,8 re la
    re re la
    re re la

    %4
    re16 re' dod si la sol
    fad si la sol fad mi
    re8 re la

    %7
    re re la
    re re la
    re16 re' dod si la sol

    %10
    fad8 mi re
    re'16 mi re mi re mi  %%% rip
    dod8 la la\mbreak

    %13
    si16 dod si dod si dod
    la8 fad fad
    sol16 la sol la sol la

    %16
    fad8 re re
    re16 la re la re la
    re la re la re la

    %19
    re mi fad sol la8
    re sol, la
    re,16 la re la re la

    %22
    re la re la re la
    re mi fad sol la8
    re sol, la\mbreak % fine prima pag allegro2

    %25 OK
    re,4 r8
    R4.*28
    la'8 la mi

    %55
    la la mi
    la la mi
    la16 la' sold fad mi re

    %58
    dod8 si la
    la'16 si la si la si
    sold8 mi mi

    %61
    fad16 sold fad sold fad sold
    mi8 dod dod
    re16 mi re mi re mi

    %64
    dod8 la la
    la16 mi la mi la mi
    la mi la mi la mi

    %67
    la si dod re mi8
    la, re, mi
    la4 r8

    %70
    R4.*22
    si8 fad si
    si sold si

    %94
    la mi la
    la fad la
    la re, sol

    %97
    sold mid sold\mbreak
    dod fad, dod'
    re fad, re'

    %100
    mi fad, mi'
    re fad, re'
    dod fad, si

    %103
    mi, dod fad
    re4 r8
    R4.*6

    %111
    re16 fad la re la fad
    re4 r8
    R4.*39

    %152
    re'16 mi re mi re mi  %%% rip
    dod8 la la\mbreak
    si16 dod si dod si dod

    %155
    la8 fad fad
    sol16 la sol la sol la
    fad8 re re

    %158
    re16 la re la re la
    re la re la re la
    re mi fad sol la8

    %161
    re sol, la
    re,16 la re la re la
    re la re la re la

    %164
    re mi fad sol la8
    re sol, la\mbreak %
    re,4\fermata r8

}

IIIvlan =  \relative do' {

    re8 re la
    re re la
    re re la

    %4
    re4 r8
    re4 r8
    re re la

    %7
    re re la
    re re la
    re4 r8

    %10
    re4 r8
    fad8 fad fad
    mi dod dod\mbreak

    %13
    re re re
    dod la la
    si si si

    %16
    la fad fad
    re'16 la re la re la
    re la re la re la

    %19
    re mi fad sol la8
    re sol, la
    re,16 la re la re la

    %22
    re la re la re la
    re mi fad sol la8
    re8 sol, la\mbreak

    %25
    re,4 r8 %%%% fine rip
    R4.*28
    la'8 la mi

    %55
    la la mi
    la la mi
    la4 r8

    %58
    la4 r8
    dod dod dod
    si sold sold

    %61
    la la la\mbreak
    sold mi mi
    fad fad fad

    %64
    mi dod dod
    la'16 mi la mi la mi
    la mi la mi la mi

    %67
    la si dod re mi8
    la, re, mi
    la,4.

    %70
    R4.*22
    fad'8 re fad
    sold mi sold

    %94
    mi dod mi
    fad  re fad
    re si re

    %97
    mid dod mid\mbreak
    fad, fad' fad,
    fad fad' fad,

    %100
    fad fad' fad,
    fad fad' fad,
    fad' fad, si'

    %103
    mi, dod fad
    si,4 r8
    R4.*6

    %111
    re16 fad la re la fad
    re4 r8
    R4.*39

    %152
    fad8 fad fad
    mi dod dod\mbreak
    re re re

    %155
    dod la la
    si si si
    la fad fad

    %158
    re'16 la re la re la
    re la re la re la
    re mi fad sol la8

    %161
    re sol, la
    re,16 la re la re la
    re la re la re la

    %164
    re mi fad sol la8
    re8 sol, la\mbreak
    re,4\fermata r8

}

IIIbcn = \relative do {

    re8 re la
    re re la
    re re la

    %4
    re4 r8
    re4 r8
    re re la

    %7
    re re la
    re re la
    re4 r8

    %10
    re4 r8
    re' re re % rip
    dod la la\mbreak

    %13
    si si si
    la fad fad
    sol sol sol

    %16
    fad re re
    re16 la re la re la
    re la re la re la

    %19
    re mi fad sol la8
    re sol, la
    re,16 la re la re la

    %22
    re la re la re la
    re mi fad sol la8
    re8 sol, la\mbreak

    %25
    re,4 r8 %%%% fine rip
    re4 r8
    re4 r8

    %28
    re4 r8
    re4 r8
    re' re re

    %31
    dod dod dod
    si si si
    la la la

    %34
    sol sol sol
    fad mi re
    dod si la\mbreak

    %37
    re fad re
    la' la, la
    re fad re

    %40
    la4.~
    la~
    la~

    %43
    la~
    la
    re4 re,8

    %46
    la'' la, la'
    si sold mi
    la mi dod\mbreak

    %49
    la4 r8
    la4 r8
    la16 fad' mi8[mi,]

    %52
    la16 fad' mi8[mi,]
    la16 fad' mi8[mi,]
    la' la mi

    %55
    la la mi
    la la mi
    la4 r8

    %58
    la4 r8
    la la la
    sold mi mi

    %61
    fad fad fad\mbreak
    mi dod dod
    re re re

    %64
    dod la la
    la'16 mi la mi la mi
    la mi la mi la mi

    %67
    la si dod re mi8
    la, re, mi
    la,4.

    %70
    mi'8 sold mi
    mi4.
    la8 dod la

    %73
    sold4 la8\mbreak
    si la sold
    la fad red

    %76
    mi sold mi
    dod' dod si
    lad lad sol?

    %79
    fad fad fad
    si re, si
    si si si

    %82
    si si si
    si si si
    si si si\mbreak

    %85
    si si si
    si si si
    si' mi, fad

    %88
    si,16 sol' fad mi re dod
    si8 si si
    si si si

    %91
    si' mi, fad
    si, si' si,
    mi, mi' mi,

    %94
    la la' la,
    re, re' re,
    sol sol' sol,

    %97
    dod, dod' dod,\mbreak
    fad fad' fad,
    fad fad' fad,

    %100
    fad fad' fad,
    fad fad' fad,
    fad' fad, si'

    %103
    mi, dod fad
    si,4 re8
    re4 r8

    %106
    re4 r8
    re re re
    re re re\mbreak

    %109
    re4 r8
    re4 r8
    re16 fad la re la fad

    %112
    re8 re' re,
    dod la dod
    re4 sold8

    %115
    la4 la,8
    fad'4.
    sol

    %118
    sold
    la
    fad

    %121
    dod\mbreak
    re
    la'8 la, la

    %124
    re4 r8
    re re re
    re4 r8

    %127
    re re re
    re4 r8
    re4 r8

    %130
    re sol dod,
    re sol, la
    re, re' re

    %133
    re re re
    r la la
    la la la

    %136
    r re re
    re re re
    la4.~

    %139
    la~
    la4 re8
    re4 r8

    %142
    re re re
    re4 r8
    re re re

    %145
    re4 r8\mbreak
    re4 r8
    re sol dod,

    %148
    re sol, la
    re sol dod,
    re sol, la
    re4 r8

    %152
    re' re re % rip
    dod la la\mbreak
    si si si

    %155
    la fad fad
    sol sol sol
    fad re re

    %158
    re16 la re la re la
    re la re la re la
    re mi fad sol la8

    %161
    re sol, la
    re,16 la re la re la
    re la re la re la

    %164
    re mi fad sol la8
    re8 sol, la\mbreak
    re,4\fermata r8

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \key re\major
    \override Staff.TimeSignature.style = #'single-digit
    \time 3/8
    \tempo 4. = 64
    s4.*166
    \bar"|."


}

IIIvl = {
    \IIIglobal
    %\notypeset
    <<\IIIvln \forma>>

}

IIIvlI = {
    \IIIglobal
    <<\IIIvlIn \forma>>

}

IIIvlII = {
    \IIIglobal
    <<\IIIvlIIn \forma>>

}

IIIvla = {
    \IIIglobal
    \clef alto
    <<\IIIvlan \forma>>

}

IIIbc = {
    \IIIglobal
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>
    \typeset

}
#(set-global-staff-size 16)


\pointAndClickOff

\paper  {

    systems-per-page = #4
    print-first-page-number = ##t
    first-page-number = #2

}

\markup\huge "[1.] All[egr]o] "

\score {
    {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \set Staff.instrumentName = \markup \center-column{"Violino""in Tromba"}
                \Ivl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Primo]"}
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \set Staff.instrumentName = \markup \center-column{"[Violino"\vspace #-0.2"Secondo]"}
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName = \markup \center-column{"[Viola]"}
                \Ivla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \set Staff.instrumentName = \markup \center-column{"[Basso]"}
                \Ibc

            >>
        >>

    }

    \layout {

        indent = 1.8\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

\markup\huge "[2.] And[ant]e] "

\score {
    {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \IIvl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIbc

            >>
        >>

    }

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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

%\pageBreak

\markup\huge "[3.] All[egr]o] "

\score {
    {
        \new ChoirStaff \with {
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
        } <<

            \new Staff  <<
                \set Staff.midiInstrument = #"violin"
                \IIIvl
            >>

            \new PianoStaff \with {
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            } <<

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIIvla
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"cello"
                \IIIbc

            >>
        >>

    }

    \layout {

        indent = 0.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.padding = #2
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
            \override BarLine #'hair-thickness = #1.2
            \override SpacingSpanner.uniform-stretching = ##t
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




