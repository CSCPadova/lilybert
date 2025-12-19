\language "italiano"
	%********************************** VARIABILI
	\version "2.20.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

prallup = ^\markup {\musicglyph "scripts.prallup" }

su = \change Staff = up

giu = \change Staff = down

tasto = _\markup\italic"Tasto"

tremb = ^\markup {\musicglyph "scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

pad = \once \override TextScript.padding = #1.5

padall = \override TextScript.padding = #1.2

puntopz = -\parenthesize -.

fermopz = -\parenthesize \fermata

segnopz = -\parenthesize \segno

terzine = \tupletSpan 8

terzinequarto = \tupletSpan 4

sestine = \tupletSpan 2

sestinequarto = \tupletSpan 4

ds = _\markup \italic \center-align \center-column{"Da Capo""Dal Segno"}

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
	  \musicglyph "scripts.turn"
      \musicglyph "scripts.prall"}}
mbreak = { }


Iglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

Ivln = \relative do'' {

    do2~do4. do8
    re4. re8 mi4 r8 sol
    mi do r sol' mi re do4

    %4
    si r8 do16(sol) la8 do, fa4~
    fa4 sol8 la mi4 re\mbreak
    do2 r\fermata

    %7
    sol''~sol4. sol8
    la4. la8 si4 r8 re
    si sol r re' si la sol4

    %10
    fad r8 sol16(re) mi8 sol, do4~\mbreak
    do re8 mi si4 la
    sol r8 do'16(sol) la8 re, sol do,

    %13
    fa4.sol16(fa) mi4. fa16(mi)
    re4. mi16 re do(mi) re(do) si4
    la8 mi'16 si do4. re16(do) re4~\mbreak

    %16
    re8 mi16(re) mi4. fa16(mi) fa8[mi]
    red mi mi8. red16 mi4 r8 sol
    do,4. mi8 la,4. la'8

    %19
    si, do fa  mi re sol, r do'16(sol)
    la8 do, fa4~\mbreak fa8 sol16(re) mi8 la16 la,
    si8 do16 re re8. do16 do4 r8 sol'

    %22
    do,4 r8 sol' la,4 r8 la'
    si, do16(re32 mi) do8. si16 do8\f la16 mi fa4~
    fa8 re'16(re,) mi8 la16(si32 do) mi,4 re

    %25
    do1\fermata

}

Ibcn = \relative do {

    r8 do'16 re mi8 do la[la16 si do8 mi,]
    fa8 mi16 fa sol8 sol, r do' si sol
    r do si sol do si la re,
    sol\clef tenor sol'16 re mi8 do fa mi re[do]
    si\clef bass sol mi fa sol4 sol,\mbreak
    do2 r\fermata
    r8 sol'16 la si8 sol mi mi16 fad sol8 si,
    do si16 do re8 re,r sol' fad re
    r sol fad re sol fad mi la,
    re re'16 la si8 sol do si la sol\mbreak
    fad re si[do] re do re re,
    sol sol'16 re mi8 do fa\clef tenor fa'16 re mi4~
    mi8 la, re sol,\clef bass r do16 si la8 fa
    r si16 la sold8 re la' re, mi mi,
    la4 r8 la'16 mi fa8 fa, r fad'\mbreak
    sol sol, r sold' la la, r la'
    si mi, si'[si,] mi do'16 re mi8 do
    la la16 si do8 mi, fa la16 sol fa4~
    fa8 mi re do sol sol'16(re) mi8 do
    fa4. la16 la,\mbreak si8 sol do[fa]
    sol mi sol[sol,] r do'16 re mi8 do
    la la16 si do8 mi, fa la16 sol fa8 fad
    sol do, sol' [sol,] la4 r8 la'16 la,
    si8 sol do[fad,] sol2
    do,1\fermata

}

forma = {

    \time 4/4
    \key do\major
    \tempo 4 = 50
    s1*25
    \bar"|."

}


Ivl = {
    \Iglobal
    \notypeset
    <<\Ivln\forma>>
}

Ibc = {
    \Iglobal
    \clef bass
    <<\Ibcn\forma>>
    \typeset
}


IIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

IIvln = \relative do'' {

    r8 sol' la mi fa re sol sol,
    do re16(mi fa8) la, si do do si
    do16 si do re mi re mi fad sol fad sol la si sol la si

    %4
    <<
        {
            do4 sol~sol fad
            si, s8 do do si la la
        }\\{
            r8 do mi do do la re re,
            sol \slurUp la16(si do8) mi, fad sol sol fad
        }
    >>
    sol16 fad sol la si sol la si do si do re mi re mi fad

    %7
    sol8 si,<<
        {
            do4~do8 \once\slurDown sib16(la) sib4~
            sib8 \once\slurDown la16 (sol)
        }\\{
            r8 do, re4 r8 sol16 fa
            mi4
        }
    >> la8 re16(do) si!8 do sol, si'
    <do mi, sol,>4 sol16 fad sol la si la si do re si do re\mbreak

    %10
    mi re mi fad <<
        {
            sol4~sol8 fa!16 mi fa4~
            fa8 \once\slurDown mi16(re)
        }\\{
            r8 sol, la4 r8 re16 do
            si4
        }
    >> mi8 la16(sol) fad8 sol re, fad'
    <sol si, re, sol,>4 re16 si do re mi re mi fad sol fad sol la

    %13
    <<{si,8[sol']}\\sol,4>> la'8 mi fa re sol sol,\mbreak
    do8[re16(mi fa8) fa] <<
        {
            mi4 do8 do
            la \slurDown si16(do)  re8 re si do16(re) mi8 mi
            do re16(mi)
        }\\{
            sol,8 la16 si s8 mi,
            fa4 s8 fad sol4 s8 sold
            la4
        }
    >> \slurNeutral fa'16 mi re do si do re si mi re do si

    %17
    la si do la re mi fa re sold8 mi do16 la' do, la'\mbreak
    si, la' si, la' mi sol mi sol mi fa mi fa re fa re fa
    re mi re mi mi do' mi, do' re, do' re, do' re, si' re, si'

    %20
    do, si' do, si' do, la' do, la' si, la' si, la' si, sold' si, sold'
    la, la' la, la' mi, la mi la fa la fa la sold la sold la\mbreak  %%% fin qui OK
    <<{ la [s sold] s}\\{s la [s la]}>> fa la mi la fa la mi la re, la' do, la'

    %23
    <<{<mi' si>4 do8(re) si2}\\{sold4 la mi2}>>
    la8 fad' sol4. fa16(mi) fa4~
    fa8 mi16(re) mi8 la16(sol) fad8\noBeam re' mi si

    %26
    do la re re, sol (la16 si) do8 do\mbreak  %%% fine prima riga seconda pagina
    <<
        {
            si4 sol8 sol mi \slurDown fad16(sol) la8 la
            fad sol16 la si8 si sol la16 si
        }\\{
            re,8 \slurUp mi16(fad) r8 si, do4 r8 dod
            re4 r8 red mi4
        }
    >> do'16 si la sol

    %29
    fad sol la fad si la sol fad mi fad sol mi la sol fad mi
    red8 si mi16 sol mi sol mi fad mi fad re! si' re, si'\mbreak
    do, si' do, si' do, la' do, la' si, la' si, la' si, sol' si, sol'

    %32
    la, sol' la, sol' la, fad' la, fad' sol, si sol si sol mi' sol, mi'
    fad, mi' fad, mi' fad, red' fad, red' mi, mi' mi, mi' si mi si mi
    do mi do mi red mi red mi  <<{mi [s red]}\\{s mi[s mi]}>> do mi si mi\mbreak

    %35
    do mi si mi <<{s8 si}\\{la16 mi' sol ,mi'}>> <la, red, si>4 sol8(la)
    <<fad2\\si,>> mi8 si' do4~
    do8 sib16(la) sib4. la16(sol) la8 re16(do)

    %38
    si!8 sol' la mi fa re sol sol,
    do8[re16(mi fa8) la,] si do~do[si]
    <<
        {
            mi16 fa mi fa sol fa sol fa\mbreak mi fa mi fa sol fa sol fa

            %41
            mi fa mi fa mi fa mi fa mi fa mi fa mi fa mi fa
            mi8[fa16 sol fa8 mi]
        }\\{
            do16 re do re mi re mi re do re do re mi re mi re
            do re do re do re do re do re do re do re do re
            do8[re16 mi re8 do]
        }
    >> si sol, r sol''\mbreak
    la16 do si la si re do si do mi, fa sol la la, si do

    %44
    si sol do mi, re do' si re, do si do re mi re mi fa
    sol8 sol, sol'16 fad sol la si la si do re8 re,
    r8 re' mi si do la re[re,]

    %47
    sol la16 si <<{do8 do}\\{s mi,}>> <fad' do re,>4 r8 re
    mi16 sol fad mi fad la sol fad sol si, do re mi mi, fad sol
    fad re sol si, la sol' fad la, sol8 re'' mi si

    %50
    do sol' la mi fa do' re la
    sib2~sib8 sol la mi
    fa re sol sol, <<{do \slurDown re16(mi) fa8 fa}\\{mi,4 s8 la}>>\mbreak

    %53
    <fa' si, re, sol,>4 r8 sol, la16 do si la si re do si
    do mi, fa sol la la, si do si8 sol sol'16 mi' sol, mi'
    fa, mi' fa, mi' fa, re' fa, re' mi, re' mi, re' mi sol mi sol

    %56
    mi fa mi fa re fa re fa re mi re mi mi do' mi, do'\mbreak
    fad,? do' fad, do' sol si sol si sol la sol la la, fad' la, fad'
    si, fa' si, fa' do mi do mi do re do re si sol' si, sol'

    %59
    la, sol' la, sol' la, fa'! la, fa' <<
        {
            sol,, si' fa' si, sol, do' mi do
            sol, do' re do sol, si' re si sol, si' do si sol, la' do la
            sol, la' si la sol, sol' si sol sol, sol' la sol sol, fa' la fa

            %62
            sol, fa' si fa sol, fa' re' fa, sol, mi' re' mi, sol, mib' do' mib,
            sol, re' do' re, sol, re' do' re, sol, fa' si fa sol, fa' si fa
        }

        \new Staff \with {
            \override VerticalAxisGroup.default-staff-staff-spacing =
            #'((basic-distance . 0.5) (padding . +1))
            \remove "Time_signature_engraver"
            alignAboveContext = #"main" fontSize = #-3
            \override StaffSymbol #'staff-space = #(magstep -3)
            \override StaffSymbol #'thickness = #(magstep -3)
        }
        {
            \set Staff.midiInstrument = #"violin"

            %59bis
            \key do\major <fa' si, sol,>4^\markup\italic"manoscritto" <mi do sol,>
            <re do sol,> <re si sol,> <do si sol,> <do la sol,>
            <si la sol,> <si sol sol,> <la sol sol,> <la fa sol,>
            <si fa sol,> <re fa, sol,> <re mi, sol,> <do mib, sol,>
            <do re, sol,>2 <si fa sol,>
        }
    >>

    %64
    <mi do mi, do>1\fermata

}

IIbcn = \relative do {

    R1*6
    r8 sol' la mi fa re sol[sol,]
    do re16 mi fa4. mi16 fa sol8 sol,

    %9
    do16 si do re mi re mi fad sol fad sol la si sol la si\mbreak
    do8 do, mi[do] do la re[re,]
    sol la16 si do4. si16 do re8 re,

    %12
    sol'16 fad sol la si sol la si \clef tenor do si do re  mi re mi fad
    sol8 si, do4. sib16 la sib4~\mbreak
    sib8 [la16 (sol) la8 si] do4 \clef bass do,8 re16 mi

    %15
    fa8 fa re mi16 (fad) sol8 sol mi fad16 sold
    la4 r8 la sold4 sol
    fad fa mi r\mbreak

    %18
    R1
    r8 sol la mi fa re sol[sol,]
    do re16 mi  fa8 do re si mi[mi,]

    %21
    la4 r8 do re4 r8 mi\mbreak
    fa mi re[do] re do si[la]
    mi'4 la, mi' mi,

    %24
    la r8 dod' re4. do16 si
    do4 r8 dod re fad, sol4~
    sol8 fa!16 mi fa4. mi16 re mi8 fad\mbreak

    %27
    sol4 sol,8 la16 si do8 do la si16 dod
    re8 re si dod16 red mi4 r8 mi
    red4 re dod do

    %30
    si r r2\mbreak
    r \clef tenor r8 re' mi si
    do la re[re,] \clef bass sol la16 si do8 sol

    %33
    la fad si[si,] mi4 r8 sol
    la4 r8 si do si la[sol]\mbreak
    la sol fad[mi] si'4 mi,

    %36
    si' si, mi r8 fad
    sol4. fa!16 mi fa4 r8 fad
    sol si do4. sib16 la sib4~

    %39
    sib8 la16 sol la8 fa sol do, sol'[sol,]
    r do' do do,\mbreak r do' do do,
    r la' la la, r la' la la,

    %42
    r fa' fa fa, r sol' la mi
    fa re sol[sol,] do re16 mi fa4~
    fa8 mi16 fa sol8[sol,] do do, do'16 si do re

    %45
    mi re mi fa sol8 sol, sol'16 fad sol la si la si do
    re8 re, r re mi16 sol fad mi fad la sol fad
    sol si do re mi mi, fad sol fad8 re mi do\mbreak

    %48
    do la re[re,] sol la16 si do4~
    do8 si16 do re8 re, sol4 r8 sol'
    la mi fa do'  re la sib fa

    %51
    sol mi fa sol do,4 r8 sol'
    la16 do si la si re do si do mi, fa sol la la, si do\mbreak
    si8\noBeam sol' la mi fa re sol[sol,]

    %54
    do re16 mi fa4. mi16 fa sol8 sol,
    la16 do si la si re do si do8 do, r sol''
    la16 do si la si re do si do mi,fad sol la la, si do\mbreak

    %57
    re8 re' mi [si] do la re[re,]
    sol la16 si do8 mi, fad re mi[si]
    do la re [re,] sol2~

    %60
    sol1~
    sol~
    sol~

    %63
    sol
    do,\fermata

}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 57
    s1*64
    \bar"|."

}


IIvl = {
    \IIglobal
    \notypeset
    <<\IIvln\forma>>
}

IIbc = {
    \IIglobal
    \clef bass
    <<\IIbcn\forma>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza \terzinequarto
}

IIIvln = \relative do'' {

    mi4 la, fa'
    sold, la2
    mi4 <<{do'2

           %4
           do4 si}\\{la2
                   la4 sold}>> mi'~
    mi la, re~
    re do si

    %7
    do8 re si2
    la la4
    si4. do8(re mi)\mbreak

    %10
    do4 la mi'
    la4. do8(si la)
    sold2.\fermata

    %13
    si4 mi, do'
    red, mi2
    si4 <<{sol'2

          %16
          sol4 fad}\\{mi2
                      mi4 red}>> si'~
    si mi, la~
    la sol fad

    %19
    sol8(la) fad2
    mi mi4
    fad4. sol8(la si)\mbreak

    %22
    sold4 mi la~
    la8 fad sol!2~
    sol4 la8(sol) fa?(mi)

    %25
    fa4 la re,
    sib' dod, re~
    re8 mi mi4. re8

    %28
    re4 fa2~
    fa4 sol8(fa) mi(re)
    mi4 sol do,

    %31
    do2.~
    do4 sib2
    la4 la' re,\mbreak

    %34
    re2.~
    re4 do2
    si4 re mi

    %37
    fa2.~
    fa4 sol la
    mi re2

    %40
    do2.
    dod
    re

    %43
    red
    mi~
    mi2 la,4

    %46
    mi do' red,
    mi2.
    si'4 mi, mi'

    %49
    la re, sib'\mbreak
    dod,4 mi2~
    mi4 la, fa'

    %52
    sold,2.
    la4 la'8(sol) fa(mi)
    fa re si'(la) sold(fad)

    %55
    sold4. mi8 la4
    re,8(do si2)
    la2.~

    %58
    la
    sib2 re4
    sold4. mi8 la4

    %61
    re,8(do) si2
    la mi' re
    mi2.\fermata

}

IIIbcn = \relative do {

    R2.
    mi4 la, fa'
    sold, la2

    %4
    mi4 \clef tenor mi'' la,
    fa'2.
    \clef bass sold,4 la re

    %7
    mi2 mi,4
    la, fa'2
    sold,2.\mbreak

    %10
    la4 la' sol!
    fa2.
    mi\fermata

    %13
    R
    si'4 mi, do'
    red, mi2

    %16
    si4 si' mi,
    do'2.
    red,4 mi la,

    %19
    si2 si'4
    mi, do'2
    red,2.\mbreak

    %22
    r4 r la'
    si4. do8 re mi
    dod4 la dod

    %25
    re2 fad,4
    sol la sib
    sol la  \parenthesize la,

    %28
    re re'8 do si la
    si4 sol si
    do2 r4

    %31
    r do fa,
    re' mi, do
    fa2 r4\mbreak

    %34
    r re' sol,
    mi' fad, re
    sol2 r4

    %37
    r la si
    do mi, fa
    sol sol,2

    %40
    do4 do' sib
    la la sol
    fa re' do

    %43
    si! si la
    sold8 fad mi4 r
    \clef tenor mi' la, fa'

    %46
    sold, la2
    \clef bass mi4 la, la'~
    la sol2

    %49
    fa sol4\mbreak
    la2 dod,4
    re fa2~

    %52
    fa4 mi8 re do si
    do4 dod2
    re4 red2

    %55
    mi do4
    re mi mi,
    la la' sol

    %58
    fa fa mi
    re re'2
    re, do4

    %61
    re mi mi,
    la2 sol fa
    mi2._\fermata

}

forma = {

   \time 3/4
   \key do\major
   \tempo 4 = 60
   s2.*64
   \bar"|."

}


IIIvl = {
   \IIIglobal
   \notypeset
   <<\IIIvln\forma>>
}

IIIbc = {
   \IIIglobal
   \clef bass
   <<\IIIbcn\forma>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IVglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

IVvln = \relative do'' {

    do16 mi sol mi do mi sol mi re sol re si re sol re si
    do mi do la fad re' la do si re sol re si re sol re
    do mi sol mi do mi sol mi la  la, do la fa la re la

    %4
    si sol do mi, re do' si re,\mbreak do mi sol mi do mi sol mi
    re sol si re si sol si re do mi la sol fad re fad la
    si si, re si sol si re si la dod re la fad la re fad,

    %7
    sol si do sol mi sol do mi, fad la re la si re sol si,\mbreak
    do fad sol si, la sol' fad la, sol si re si sol si re si
    do mi sol mi do mi sol mi la fa la do la fa la do

    %10
    sol mi sol do sol mi sol do fa, la fa re si sol' re fa
    mi sol mi do la fa' do mi re fa re si sold si mi si\mbreak
    do la do mi si sol si mi la, fa la do re, do' si la

    %13
    sold si mi si mi, si' mi mi, fa la re la fa la re la
    sold si mi si do mi la do, re sold la do, si la' sold si,
    la do mi do la do mi do\mbreak sold si mi si sold si mi si

    %16
    la do mi do la do mi do si re sol re si re sol si,
    do mi sol mi do mi sol mi dod mi la mi dod mi la mi
    re fa la fa re fa la fa red fad si fad red fad si fad

    %19
    sol si, mi si sol si mi si do mi fa do re fa sol re
    mi sol la do, si re sol si, la do fa la, sol si mi sol,
    fa la re fa, mi sol do mi, fa si do mi, re do' si re,

    %22
    do mi la do, si re sol si, la sol' do mi, fa la re fa,
    mi re' sol si, do mi la do, sol si do mi, fa si do mi,
    <do' re, sol,>4^\markup\italic "Adagio" <si fa sol,> <mi do mi, do>2\fermata

}

IVbcn = \relative do {

    do4 r8 do' si4 r8 si
    la4 re, sol r
    mi r8 mi fa4 r8 fa

    %4
    fa re fa[sol]\mbreak do,4 r8 do
    si4 r8 si la4 re
    sol, r8 sol' fad4 r8 si

    %7
    mi,4 r8 la re,4 r8 si\mbreak
    la sol re'[re,] sol4 r

    %9
    mi' r8 mi fa4 r8 fa
    mi4 r8 mi re4 sol
    do, fa si, mi\mbreak

    %12
    la, sol fa2
    mi4 r8 do' re4 r8 re
    mi4 r8 do si la mi'[mi,]

    %15
    la4 r mi' r
    la r sol r
    do, r la r

    %18
    re r si r
    mi r8 sol la4 si
    do r8 sol la4 mi

    %21
    fa r8 mi re do sol'[sol,]
    do4 r8 sol' la4 r8 si\mbreak
    do4 r8 fa,  sol mi re [do]

    %24
    sol2_\markup\italic "Adagio" do_\fermata


}

forma = {

    \time 4/4
    \key do\major
    \tempo 2 = 70
    s1*24
    \bar"|."

}


IVvl = {
    \IVglobal
     \notypeset
    <<\IVvln\forma>>
}

IVbc = {
    \IVglobal
    \clef bass
    <<\IVbcn\forma>>
    \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


Vglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

Vvln = \relative do'' {

    sol8
    do(si do) sol(do si) do4. r8 r do
    re(mi fa) re (sol fa) mi4. r8 sol fa
    mi sol mi re sol re mi sol mi re sol re

    %4
    do fad sol re,4 fad'8 sol,,4. r8 sol'' fa?\mbreak
    la(sol la) la,(si do) sol(la si) mi,(do' si)
    fa(si do) sol(do si) do,4. r8 sol'' mi

    %7
    fa re fa sol re sol mi do mi sol re si
    do la do re la re si sol si do sol mi
    fa re fa sol re sol mi sol do mi, do' sib\mbreak

    %10
    fa la si? re, re' do si re sol si, sol' fa
    do mi sol la, la' sol fad la sol fad sol la
    re, fad la do, fad la si, re do si do re

    %13
    mi, re' do fad, do' re sol, si la sol  la si
    mi, fad sol re sol fad sol,4.~sol4 re'8%%%%%% fine primo ritornello
    sol (fad sol) re(sol fad) sol4. r8 r sol

    %16
    la(si do) re,(re' do) si4. r8 re do
    si do re sol,  la si do sol mi do sol'' fa
    mi fa sol do, re mi fa do la fa la' sol\mbreak

    %19
    fad sol la re, mi fad sol re si sol si' la
    sold la si mi, fad sold la mi do la la' sol?
    fa? mi re do si la sold la si fa mi re

    %22
    do mi la si, la' sold\mbreak la,4. r8 do'' do
    mi, do' do mi, do' do fad, do' do fad, do' do
    sol si si sol si si mi, si' si mi, si' si

    %25
    fad la la fad la la red, la' la red, la' la
    mi si' la sol la si\mbreak do, la' sol fad sol la
    red, la' la mi sol sol la, mi' mi si mi red

    %28
    mi sol fad mi fad sol dod, sol' sol la, sol' sol
    re fa! mi re mi fa si, fa' fa sol, fa' fa
    do mi re do re mi la, fa la re la re\mbreak

    %31
    si sol si mi sol, mi' do la do fa la, fa'
    re la re sol si, sol' mi do mi do' mi, do'
    la fa la re la re si sol si do mi, do'

    %34
    la si do re, do' si do4 re,8 mib4.
    r8 r do reb4.\mbreak r8 r si do4.~
    do8 re do sol do si do4 re8\p mib4.~

    %37
    mib8 re do reb4.~ reb8 do si do4.~
    do8 re do sol do si do sol' fa mi fa sol
    la, sol' fa si, fa' sol do, mi re do re mi\mbreak

    %40
    la, si do sol do si \once\tieDashed do,4.~ do4

}

Vbcn = \relative do {

    r8
    do'4. si la mi
    fa sol do, sol'
    do si do si

    %4
    la re, sol do\mbreak
    fa fa,~fa mi
    re sol do, do'~

    %7
    do si do r8 r sol
    la4. fad sol r8 r do,
    re4. si do r8 r mi\mbreak

    %10
    fa4. fad sol r8 r si
    do4. dod re r8 r re,
    fad4. re sol r8 r si,

    %13
    do4. re mi r8 r si
    do4. re \once\tieDashed sol,4.\parenthesize r4 r8
    sol'4. fad mi si

    %16
    do re sol, r
    sol' fa! mi r
    do' sib la r\mbreak

    %19
    re do si r
    mi re do r
    re re, mi r8 r re

    %22
    mi4. mi,\mbreak la r
    la' la, re r
    sol sol, do r

    %25
    fad fad, si r
    mi mi,\mbreak la r8 r la'
    si4. do la si

    %28
    mi mi, la r
    re re, sol r
    do do, fa r\mbreak

    %31
    sol r la r
    si r do r8 r mi,
    fa4. r8 r fa sol4. mi

    %34
    fa sol do, r8 r do'
    fa,4. r8 r sib\mbreak mib,4. r8 r fa
    sol4. sol, do r8 r do'

    %37
    fa,4. r8 r sib mib,4. r8 r fa
    sol4. sol, do r8 r mi
    fa4. sol la mi\mbreak

    %40
    fa sol do,4. \parenthesize r4

}

forma = {

    \time 12/8
    \key do\major
    \tempo 2. = 60
    \partial 8 s8
    s1.*13
    s2. s4. s4
    \bar":..:"\break
    s8
    s1.*25
    s2. s4. s4
    \bar":|."

}


Vvl = {
   \Vglobal
   \notypeset
   <<\Vvln\forma>>
}

Vbc = {
   \Vglobal
   \clef bass
   <<\Vbcn\forma>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

VIvln = \relative do'' {

    fa4 do'8. sib16 la8 fa r la16(fa)
    sol8 do16(mi,) fa8.\turn mi32(fa) mi4 r8 do'16(sol)
    la8. sol16 fa8 fa si4 do8. fa,16

    %4
    mi4 re do2\mbreak
    do,4 do'8. sib16 la8 fa r fa'16(si,)
    do4 fa8. fa16 mi8 do r sol'

    %7
    do4~do16 sol la sib la4~la16 mi fa sol
    fa2 fa4 sol8 la16 sib
    dod,8 re16 mi mi8. re16 re8 la'16 mi fa4~

    %10
    fa mi8 fa16 sol\mbreak la8 fa do'4~
    do16 do sib la sib4~sib8 mi, la4~
    la16 re, mi fa sol8 fa mi8 do' fa, la

    %13
    re,16(mi fa8) fa8. mi16 fa8(re16 si) do4~
    do si8 do16 re mi8 do r do'16(sol)
    la8 do sol do\mbreak fa, do' mib, do'

    %16
    re, sib'16(mi,!) fa4~fa8 sol32(la sib16) fa8.\turn mi16
    fa2 do,4 fa8. fa16
    mi8 do'16(mi,) fa2 mi4

    %19
    fa1\fermata

}

VIbcn = \relative do {

    r2 fa4 fa'8. fa16
    mi8 do la[fa] do do'16 sol la8 mi
    fa sol la[fa] sol fa mi fa

    %4
    sol fa sol sol, do4 fa8. fa16\mbreak
    mi8 do r do'16(mi,) fa8 re' si[sol]
    mi do' la fa do4 do'8. sib16

    %7
    la8 fa mi[do] fa re dod [la]
    re sib' la fa sib re sib sol
    la re, la'[la,] re4 r8 re'16 la

    %10
    sib8 sol do do,\mbreak fa4 r8 fa
    re'4~re16 re do sib do4~do8 fa,
    sib4~sib16 sol la sib do4 r8 re

    %13
    sib8 la16 sib do8 do, fa4 r8 la16 mi
    fa8 re sol[sol,] do do'16 sol la8 mi
    fa4 do'8. sib16\mbreak la8 fa r la

    %16
    sib4 r8 fa'16 (la,) sib8 sol do[do,]
    fa4 sib8. sib16 la8 do la fa
    do4 r8 fa16 si, do4 do,

    %19
    fa1\fermata

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 45
    s1*19
    \bar"|."

}


VIvl = {
   \VIglobal
   \notypeset
   <<\VIvln\forma>>
}

VIbc = {
   \VIglobal
   \clef bass
   <<\VIbcn\forma>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

VIIvln = \relative do'' {

    r8 do do do fa fa fa fa
    sib[sib sib la16 (sol)] la8 fa, fa fa
    <<{do' do do do fa [fa fa mi16(re)]

       %4
       mi8 do do'4~do sib?
       la8 do, fa fa}\\{r4 mi, la si
                        do la re mi
                        fa s8 la,}>> <fa' sol, do,>4 <fa sol, do,>
    <fa la, do,> r8 do\mbreak re[re re do16(sib)]

    %7
    do8 re16 (mi) fa4. sol16(la) sib8 la16(sol)
    la8\noBeam fa, fa fa do' do do do
    fa[fa fa mi16 (re)] mi8 do<<{<sol' do,>4

                               %10
                               sol fa fa8 \slurDown sol16(re)}\\{mi,4
                                                                 la si do}>> mi8 sol
    la do, fa, la' si, sol' do, la'\mbreak  %%%% fine secondo sistema
    mi4 re do8 do, do do

    %13
    <<{fa fa fa fa sib[sib sib la16 sol]
       la8 [fa]}\\{r4 la, re mi
                 fa}>> fa'4. sol16(fa) mi8 sol
    la[la la sol16 (fa)] sol8 la16 si do4~

    %16
    do8 fa, sib?4. do16 sib la8 do
    re fa, sib, re' mi, do' fa, re'\mbreak
    la4 sol fa r8 mi

    %19
    re fa, sib, re' do (re16 mi) fa4~
    fa8 mi16 fa sol8 sib, sib la r do
    re fa, sib, re' mi, do r do'

    %22
    fa fa, sol sol' la(si,) <<{<do fa,>4
                               do si}\\{la,4
                                        re mi}>> si'8 do16(sol) la8 fa'16(do)\mbreak
    re8(mi) fa(do) re(do) sib(la)

    %25
    <<{sol2 <la fa>4}\\{do,2 la4}>> r8 fa''
    mi do r do'16 sib la8 fa r fa,
    mi do r do'16 sib la do sib do sol do sib do

    %28
    la[do la do la do la do] sol do sol do sol do sol do\mbreak %%% fine prima pagina
    la do sol do la do sol do la do sol do la do sol do
    la8 do16(sib) la8 fa'16(mib) re fa mib fa do fa  mib fa

    %31
    re fa re fa re fa re fa do fa do fa do fa do fa
    re fa do fa re fa do fa re fa do fa re fa do fa
    re8 fa16(mib) re8 sol16(fa) mi sol re sol mi sol re sol\mbreak

    %34
    mi8 sol16(fa) mi8 la16(sol) fa la mi la fa la mi la
    fa la sol la sib la sol fa mi sol fa sol la sol fa mi
    re fa mi fa sol fa mi re  <<{mi fa mi fa sol fa sol fa

                                 %37
                                 mi fa mi fa sol fa sol fa mi8 fa mi mi}\\{dod16 re dod re mi re mi re
                                                                           dod re dod re mi re mi re dod8 re <re la> <dod la>}>>
    re16 fa la fa do! fa la fa\mbreak si, fa' sol fa si, fa' sol fa
    do mi sol mi sib! mi sol mi la, do fa do la do fa do

    %40
    re fa re sib re fa sib re, do fa do la do fa la do,
    sib re sib sol sib mi sol sib, la8 fa fa fa
    do' do do do fa[fa fa mi16(re)]

    %43
    mi8 do r sol' la do, \once\stemUp fa,[la']\mbreak
    sol la16(si) do4. si16(do) re8 fa,
    fa mi r sol la do, fa, la'

    %46
    si, sol'16(re) mi8 do'16(sol) la8 si do sol
    la sol fa mi<<re2\turn\\sol,>>
    <<<mi' do>4\\mi,>> r8 do si sol r sol'16 fa\mbreak

    %49
    mi8 do r do' si sol r sol'16 fa
    mi sol fa sol re sol fa sol mi sol mi sol mi sol mi sol
    re sol re sol re sol re sol mi sol re sol mi sol re sol

    %52
    mi sol re sol mi sol re sol mi 8sol16(fa) mi8 do'16 si
    la do si? do sol do si do la do la do la do la do\mbreak
    sol do sol do sol do sol do la do sol do la do sol do

    %55
    la do sol do la do sol do la8 do16(sib?) la8 fa16(mib)
    re8 sib, r <<fa''\\re>>  <<si\\sol>> fa'4(mi16 re)
    mi8 do, r <<{sol'' dod,}\\{mi la,}>> sol'4(fa16 mi)\mbreak

    %58
    fa8 re, r la' sold mi r mi'16 re
    do8 la, r la'' sold mi r mi'16 re
    do mi re mi si mi re  mi do mi do mi do mi do mi

    %61
    si mi si  mi si mi si mi do mi si mi do mi si mi\mbreak
    do mi si mi do  mi si mi re mi re do si mi re do
    si mi re do si4\prall la16 do mi do sol do mi do

    %64
    fad, do' re do fad, do' re do sol sib? re sib fa sib re sib
    mi, sib' do sib mi, sib' do sib <<{do8 la, la[la]
                                       sol}\\{fa' fa, fa[fa]
                                              do}>> do'4(sib8) <<la4\\{fa16 mi fa sol}>> la sol la sib

    %67
    do do, mi do mi do mi do <<la'4\\{fa8 fa' mi re}>>
    r do'16 sib la8 fa r do do do
    fa16[mi fa sol fa sol  mi fa] sol[fa sol la sol la fa sol]

    %70
    la8 fa4(mib8)\mbreak re sol4(fa8)
    mi\noBeam do, do do fa fa fa fa
    sib[sib sib la16(sol)] la8\noBeam fa fa fa

    %73
    <<{do' do do do fa[fa fa mi16 re]
       mi8 [sol]}\\{r4 mi, la si
                  do}>> sib?2 la4
    re mi fa8 do' fa,4~\mbreak

    %76
    fa mi la si
    do8 sol do4. fa,8 sib!4~
    sib8[do16 sib la8 do] re4 <<re,\\re,>>

    %79
    <<do'1\fermata\\mi,>>
    r8^\markup\italic"Adagio" fa16 do <<{re8 mi fa fa mi[la]
                                         la sol4 fa8 fa4 mi}\\{r8 do16 sol la8 si do[do]
                                                               sib?4 la sol sol}>>

    %82
    <la' fa la,>1\fermata

}

VIIbcn = \relative do {

    r2 \clef tenor r4 la'
    re mi fa r8 fa
    fa4 r8 mi re4

    %4
    sol, do r r2
    \clef bass r2 r8 do, do do
    fa fa fa fa\mbreak sib[sib sib la16 (sol)]

    %7
    la4. sib16 la sol8 fa mi do
    fa\clef tenor fa' fa fa mi4 \clef bass mi,
    la si do r8 do,

    %10
    fa fa, sol sol' la si, do mi
    fa sol la fa sol fa mi fa\mbreak
    sol fa sol sol, do4 r

    %13
    R1
    \clef tenor r8 fa fa fa do' do do do
    fa[fa fa mi16(re)] mi4. fa16 mi

    %16
    re4. sol,8 do4 r8 la
    sib do re sib do sib la sib\mbreak
    do\noBeam \clef bass do, do do fa fa fa fa

    %19
    sib[sib sib la16 (sol)] la4. sib16 la
    sol8 fa mi do fa sol la fa
    sib do re sib do4 la,

    %22
    re mi fa r8 fa
    sib sib, do do' re mi, fa la,\mbreak
    sib do re la sib do re sib

    %25
    do4 do, fa'16 mi fa sol la sol la sib
    do do, mi do mi do mi do fa mi fa sol la sol la sib
    do do, mi do mi do mi do fa8 fa' mi re

    %28
    fa4 r8 fa, mi re mi[do]\mbreak   %%%%%% OK fine prima pagina
    mi4 r8 mi fa mi fa[mi]
    fa4 r8 fa, sib sib' la[fa]

    %31
    sib4 r8 sib la sol la[fa]
    la4 r8 la sib la sib la
    sib4 r8 si do si do si

    %34
    do4 r8 dod re dod re dod
    re4 r8 sib do4 r8 la
    sib4 r8 sol la4 r8 re,

    %37
    la'4 r8 re, la' re, la' [la,]
    re4 r r2
    r8 do do do fa fa fa[fa]

    %40
    sib sib sib la16 sol la4 re,
    sol do, fa8 fa' fa fa
    mi do4 sib8 la fa, fa fa

    %43
    do' do do do fa[fa fa mi16 re]\mbreak
    mi4. fa16 mi re8 do si sol
    do re mi[do] fa sol la fa

    %46
    sol si do[mi,] fa sol la fa
    fa sol la fa sol4 sol,
    do16 si do re mi re mi fa sol sol, si sol si sol si sol\mbreak

    %49
    do si do re mi re mi fa sol sol, si sol si sol si sol
    do8 do' si[sol] do4 r8 do,
    si la si [sol] do4 r8 si

    %52
    do si do[si] do4 r8 do,
    fa fa' mi[do] fa4 r8 fa\mbreak
    mi re mi[do] fa4 r8 mi

    %55
    fa mi fa[mi] fa4 r8 la,
    sib16 re fa re sib re fa re sol si re si sol si re si
    do, mi sol mi do mi sol mi la dod mi dod la dod mi dod\mbreak

    %58
    re, fa la fa re fa la fa mi sold si sold mi sold si sold
    la sold la si do si do re mi mi, sold mi sold mi sold mi
    la8 la sold[mi] la4 r8 la

    %61
    sold mi? sold[mi] la4 r8 sold\mbreak
    la sold la[sold] la4 r8 re
    mi la, mi' [mi,] la la, la4

    %64
    r8 re re re sol sol, sol4
    r8 do do do fa16 mi fa sol la sol la sib\mbreak
    do[do, mi do mi do mi do] fa8\clef tenor fa' fa fa

    %67
    mi do4 sib8 la4 r8 do16 sib
    la8 fa r fa' mi do r do16 sib
    la8 fa fa fa do' do, do4

    %70
    r8 fa fa fa\mbreak sib16 la sib do sib do la sib
    do sib do re do re sib do re do re mi re mi do re
    mi[re mi fa mi fa re mi] fa2

    %73
    mi re
    do8\noBeam \clef bass do, do do fa fa fa fa
    sib[sib sib la16 sol] la4. sib16 la\mbreak

    %76
    sol8[la16 sib do8 do,] fa4 r
    r la, re mi
    fa fa, sib sib'

    %79
    sib1_\fermata
    r2_\markup\italic"Adagio" r4 r8 fa16 do
    re8[mi fa la,16 sib] do4 do,\mbreak

    %82
    fa1\fermata

}

forma = {

    \time 4/4
    \key fa\major
    \tempo 2 = 55
    s1*79
    \tempo 4 = 43
    s1*3
    \bar"|."

}


VIIvl = {
   \VIIglobal
  \notypeset
   <<\VIIvln\forma>>
}

VIIbc = {
   \VIIglobal
   \clef bass
   <<\VIIbcn\forma>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


VIIIglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

VIIIvln = \relative do'' {

    fa8 do fa la do la
    fa do re sib sol do
    la do fa la do la

    %4
    sol do, mi sol mi do
    fa la fa re si sol'
    mi do mi sol do sol

    %7
    la fa,la do fa do
    re sib, re fa re sib
    sol sol' si re sol re\mbreak

    %10
    mi do, mi sol mi do
    la la' dod mi la mi
    fa re, fa la re re,

    %13
    mi do' mi sol do sol
    la fa, la do fa do
    re fa sib, re sol, sib

    %16
    mi, sol do, do' fa, fa'
    sib, sib' <<sol2\\do,>>
    \tuplet 3/2 { fa8 do fa fa[do fa] fa do fa

    %19
    sol do, sol' sol[do, sol'] sol do, sol'
    la do, la' la[do, la'] la do, la'
    sol do, sol' sol[do, sol'] sol do, sol'

    %22
    fa si, fa' fa[si, fa'] fa si, fa'
    mi do mi mi[do mi] do' mi, do'
    la fa la la[fa la] re fa, re'

    %25
    si sol si si[sol si] do mi, do'\mbreak
    la si do mi,[do' mi,] re do' si}
    do mi, sol mi do sol

    %28
    mi do' mi sol do sol
    la la, do la fa do
    la fa' la do fa do

    %31
    re sib re fa sol re
    mi do mi sol la mi
    fa la, re fa sib re,

    %34
    dod mi la la, do la'\mbreak
    si, re sol sib, mi sol
    la, dod re re, fa re'

    %37
    sib! sol fa re' mi, dod'
    re, re' fa la fa re
    si re sol re si sol'

    %40
    mi sol, do mi do sol
    mi sol do sol mi do'
    la do fa la fa do

    %43
    la do fa do la fa'
    re fa sib, re sol, sib
    mi, sol' do, mi la, do\mbreak

    %46
    fa, la' re, fa sib, re
    sol, sib' mi, sol do, mi
    la, do' fa, la do, fa

    %49
    re fa sib, re sol, sib
    re, sol do, do' fa, fa'
    sib, sib' <<sol2\\do,>>

    %52
    fa8 la, re la fa re'
    sol, si do sol mi do'
    fa, la re fa sib re,

    %55
    mi sol do mi, la la,\mbreak
    re fa sib sib, re sol
    mi sol do mi, fa do

    %58
    re la sol2
    fa4. fa'8 re (do)
    sib(la) sol2

    %61
    <la fa do>2.

}

VIIIbcn = \relative do {

    fa2 r4
    la,4 sib do
    fa2 r4

    %4
    mi2 r4
    re sol sol,
    do2 r4

    %7
    fa fa, la
    sib2 r4
    si sol si\mbreak

    %10
    do2 r4
    dod4 la dod
    re2 r4

    %13
    do'4 do, mi
    fa fa, la
    sib2 sib'4

    %16
    sib2 la4
    sib do do,
    fa do' fa,\mbreak

    %19
    mi do' mi,
    fa do' fa,
    mi do' mi,

    %22
    re sol sol,
    do2 mi4
    fa2 fa4

    %25
    sol2 la4\mbreak
    fa sol sol,
    do2 r4

    %28
    do' do, mi
    fa2 r4
    fa fa, la

    %31
    sib2 si4
    do2 dod4
    re fa, sol

    %34
    la la'2~\mbreak
    la4 sol2~
    sol4 fa re

    %37
    sol la la,
    re2 r4
    sol si, sol

    %40
    do2 r4
    do' mi, do
    fa2 r4

    %43
    fa' la, fa
    sib2.
    do\mbreak

    %46
    re
    mi
    fa2 la,4

    %49
    sib2 sib4
    do2 re4
    sib do do,

    %52
    fa2.
    mi
    re

    %55
    do\mbreak
    la2 sib'4
    sib2 la4

    %58
    sib do do,
    fa4. la,8 sib4
    fa do' do,

    %61
    fa2.

}

bfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s2.*51
	<5>4 <6>2
	<7>4 <6>2
	<7>4 <6>2
	<7>4 <6>2
	<7>4 <6> s

}

forma = {

    \time 3/4
    \key fa\major
    \tempo 2 = 58
    s2.*61
    \bar"|."

}


VIIIvl = {
   \VIIIglobal
  \notypeset
   <<\VIIIvln\forma>>
}

VIIIbc = {
   \VIIIglobal
   \clef bass
   <<\VIIIbcn\forma\bfn>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IXglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

IXvln = \relative do'' {

    do4. do8 fa4. fa8
    sol4. la16(sol) fa8 re r sib'
    mi,4 la8 la, re(mi16 fa) mi8. re16

    %4
    dod4 r8 la' fa dod r sib'
    sol mi r do' la fa r do'
    sib4 r8 la sol4 r8 fa

    %7
    sib16(sol) la(fa) sol8. fa16\mbreak fa4 la~
    la8 si16(do32 re) do8. si16 do8 la16 si do4~
    do8 sib!16(do) la4 sol re~

    %10
    re8 mi32(fa sol16) fa8. mi16 fa8 re16 mi fa4~
    fa8 mi4 re do sib8~
    sib la4 sol fa mi16 re\mbreak

    %13
    dod8 re4 dod8 re4 r8 re'
    dod la r sol fa! mi re4~
    re8 mi16 fa mi8. re16 dod2\fermata

}

IXbcn = \relative do {

    re'8 do sib la sib la sol fa
    mi re dod la re4 re'~
    re do sib2

    %4
    la8 la, si dod re mi fa re
    mi do re mi fa fa' mi mi,
    re re' do do, sib sib' la re

    %7
    mi, fa do' do,\mbreak fa re do la
    re si mi[mi,] la4 r8 la'16 sol
    fad8 sol do,[re] sol, sol' fa? re

    %10
    sol mi la [la,] re4 r8 re'16 do
    si8 do fad, sold la[la, re sol?16 fa?]
    mi8 fa si, dod re re' sol,4~

    %13
    sol8 fa16 sol la8 la, re sol fad re
    r sol fa! mi re4. do8
    sib2 la

}

bfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s1*9
	s4 <6 4>8 <5 _+>



}

forma = {

    \time 4/4
    \key fa\major
    \tempo 4 = 45
    s1*15
    \bar"|."

}


IXvl = {
   \IXglobal
  \notypeset
   <<\IXvln\forma>>
}

IXbc = {
   \IXglobal
   \clef bass
   <<\IXbcn\forma\bfn>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


Xglobal = 	{
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
    \senza \terzinequarto
}

Xvln = \relative do'' {

    do4 fa
    mi8 re do4 mi la
    sol do2 sib4~
    sib <<{la fa sol

           %4
           mi2}\\{do4 re sib
                  do2}>> fa4 sib
    la8(sol) fa4 la re
    do8(sib) la4 sib re

    %7
    mi,4  fa8 (sol) <<{sol2
                     fa}\\{do
                           la}>> fa4 sib
    la8(sol) fa4 la re

    %10
    do8(sib) la4 sib re\mbreak
    mi, fa8(sol) sol2
    <la fa do>4 r8 do \tuplet 3/2 { fa8 la fa do[la' fa]

    %13
    sol do sol mi[la mi] fa la fa re[sol re]
    mi sol mi do[mi do] fa sol la fa[sol la]
    si, la' sol do,[re mi] la, si do sol[do si]}

    %16
    do,4 r8 re'\tuplet 3/2 { fa sol la fa[sol la]}
    re,4 r8 re \tuplet 3/2 { sol la sib sol[la sib] }
    mi,4 r8 sol, \tuplet 3/2 { do re mi do[re mi]

    %19
    la, si do la[si do] re mi fa re[mi fa]
    si, do re si[do re] mi fa sol mi[fa sol]
    do, re mi do[re mi] fa sol la fa[sol la]

    %22
    si, la' sol do,[re mi] la, si do sol[do si]}
    do4 r8 do, \tuplet 3/2 { fa sol la fa[sol la]
    si, la' sol do,[re mi] la, si do sol[do si]}

    %25
    do2 <<{<mi' do>4 <mi si>
           <mi do> r <fa re> <mi dod>}\\{la, sold
                                         la s re, la'}>>
    <fa' re re,> r8 re \tuplet 3/2 { la' sol fa mi[fa re]

    %28
    dod la sol fa[re' la] si dod re mi,[re' dod]}
    re,4 r8 la''  \tuplet 3/2 { re do sib la[sib sol]
    fad re do sib[sol' re] mi fad sol la,[sol' fad]}

    %31
    sol,4 r8 re' \tuplet 3/2 { sol8 re sol sol[re sol] }
    mi4 r8 sol \tuplet 3/2 { do sol do do[sol do] }
    la4 r8 do, \tuplet 3/2 { fa do fa fa[do fa]

    %34
    re sib re re[sib re] sol re sol sol[re sol]
    mi do mi mi[do mi] la mi la la[mi la]
    fa re fa fa[re fa] re' fa, re' re[fa, re']

    %37
    si sol si do[mi, do'] la si do re,[do' si]}
    do2 <<do,4\\la>> fa'
    re sol2 sib4

    %40
    <<{mi,2 mi4}\\{do2 do4}>> la'
    fa sib2 re4
    <<sol,2\\mi>> do,4 fa\mbreak  %%%fine 2do sistema p. 2 OK

    %43
    mi8(re) do4 mi la
    sol do2 sib4~
    sib <<{la fa sol

           %46
           mi}\\{do re sib
                 do}>> fa8. sol16 sol2
    <la fa do>4 r8 do \tuplet 3/2 { fa sol la fa[sol la]
    re, mi fa re[mi fa] sol la sib sol[la sib]

    %49
    mi, fa sol mi[fa sol] la sib do la[sib do]
    fa, sol la fa[sol la] sib do re sib[do re]}
    mi,4 r8 do \tuplet 3/2 { fa do fa sol [do, sol']

    %52
    la do, la' sol[do, sol'] la do, la' sib[do, sib']}
    do8. mi,16 fa8. sol16 sol2
    fa4 r8 fa, \tuplet 3/2 { sib\p do re sib[do re]

    %55
    mi, re' do fa,[sol la] re, mi fa do[fa mi]}
    <<fa4\\la,>> r8 fa' \tuplet 3/2 { sib do re sib[do re]
    mi, re' do fa,[sol la] re, mi fa do[fa mi]}

    %58
    <la fa do>2

}

Xbcn = \relative do {

    r2
    \clef tenor r do'4 fa
    mi8(re) do4 re sol,
    do \clef bass fa, sib sol

    %4
    do do,8 sib la4 sol
    fa2 fa'4 sib
    la8 sol fa4 re' sib

    %7
    sib la8 sib do4 do,
    re do8 sib la4 sol
    fa2 fa'4 sib

    %10
    la8(sol) fa4 re sib\mbreak
    sib la8(sib) do4 do,
    fa r fa' fa'

    %13
    mi8 re do4 la si
    do r la re
    sol, mi fa sol

   %16
   \tuplet 3/2 { do8 re do sib[do sib] } la4 r8 fa
   \tuplet 3/2 { sib do re sib[do re] } sol,4 r8 sol\mbreak
   \tuplet 3/2 { do si do re[do re] } mi4 r8 do,

   %19
   \tuplet 3/2 { fa sol la fa[sol la] } re,4 r
   sol r mi r
   la r la re

   %22
   sol, mi fa sol
   \tuplet 3/2 { do,8 re do si[do si] } la4 re\mbreak
   sol, la fa sol

   %25
   do,2 la'4 mi'
   la r re, la'
   re r fa, sib

   %28
   la re, sol la
   re, r sib mib
   re sol, do re\mbreak

   %31
   \tuplet 3/2 { sol8 fad sol la[sol la] } si4  r8 sol
   \tuplet 3/2 { do sol do do[sol do] } mi,4 \clef tenor  r8 do'
   \tuplet 3/2 { fa do fa fa[do fa] } \clef bass la,4 r

   %34
   sib4 r si r
   do r dod r
   re r fa, re\mbreak

   %37
   sol mi fa sol
   do, r8 do \tuplet 3/2 { fa sol la fa[sol la]
   sib do re sib[do re] sol, la sib sol[la sib]

   %40
   \clef tenor do re mi do[re mi] la, sib do la[sib do]
   re mi fa re[mi fa] sib, do re sib[do re]
   do re do sib[do sib]} la4 fa\mbreak

   %43
   do'2 \clef bass do,4 fa
   mi8(re) do4 re sol
   do, fa sib sol

   %46
   do fa, do' do,
   \tuplet 3/2 { fa8 mi fa sol[fa sol] } la4 r8 fa
   \tuplet 3/2 { sib do re sib[do re]  } sol,4 r

   %49
   do r la r
   re r\mbreak sib sol
   \tuplet 3/2 { do8 re do sib[do sib] } la4 r8 do,

   %52
   fa4 mi fa re
   do la sib do
   \tuplet 3/2 { fa8 sol fa mi[fa mi] } re4\p sol

   %55
   do, la\mbreak sib do
   \tuplet 3/2 { fa8 sol fa mi[fa mi] } re4 sol
   do, la sib do

   %58
   fa,2

}

bfn = \figuremode {

	\bassFigureExtendersOff
	\bassFigureStaffAlignmentDown

	s2
	s1*26
	s2 s4 <6 4!>
	s1
	s2 <6>4 <6 4!>

}

forma = {

    \time 2/2
    \key fa\major
    \tempo 2 = 68
    \partial 2 s2
    s1*24
    s2
    \bar":..:"\break
    s
    s1*32
    s2
    \bar":|."

}


Xvl = {
   \Xglobal
  %  \notypeset
   <<\Xvln\forma>>
}

Xbc = {
   \Xglobal
   \clef bass
   <<\Xbcn\forma\bfn>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
#(set-global-staff-size 19)


\pointAndClickOff

\paper  {

  systems-per-page = #6
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge\bold\fill-line{"Dissertazione III"}

\markup \huge \column{"  ""[I.1] Adagio"}

\score {
    \new ChoirStaff <<

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep -0.5)
     }<<
        \set Staff.instrumentName = \markup\center-column {"[Violino]"}
        \set Staff.midiInstrument = #"violin"
        \Ivl
      >>

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep +0.5)
     }
      <<
        \set Staff.instrumentName = \markup\center-column {"[Basso]"}
        \set Staff.midiInstrument = #"harpsichord"
        \Ibc
      >>
    >>

  \layout {

    indent = 1.7\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #1.5
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\markup \huge \column{"  ""[I.2] Allegro"}

\score {
    \new ChoirStaff <<

      \new Staff = "main" <<
        \set Staff.midiInstrument = #"violin"
        \IIvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \IIbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #1.5
      \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\markup \huge \column{"  ""[I.3] Adagio"}

\score {
    \new ChoirStaff <<

      \new Staff = "main" <<
        \set Staff.midiInstrument = #"violin"
        \IIIvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \IIIbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup \huge \column{"  ""[I.4] Allegro"}

\score {
    \new ChoirStaff <<

      \new Staff = "main" <<
        \set Staff.midiInstrument = #"violin"
        \IVvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \IVbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup \huge \column{"  ""[I.5] Allegro"}

\score {
    \new ChoirStaff <<

      \new Staff = "main" <<
        \set Staff.midiInstrument = #"violin"
        \Vvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \Vbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup\huge\bold\fill-line{"Dissertazione IV"}

\markup \huge \column{"  ""[II.1] Adagio"}

\score {
    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \VIvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \VIbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup \huge \column{"  ""[II.2] Alleg[r]o"}

\score {
    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \VIIvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \VIIbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup \huge \column{"  ""[II.3] Vivace"}

\score {
    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \VIIIvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \VIIIbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup \huge \column{"  ""[II.4] Adagio"}

\score {
    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \IXvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \IXbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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

\markup \huge \column{"  ""[II.5] Allegro"}

\score {
    \new ChoirStaff <<

      \new Staff <<
        \set Staff.midiInstrument = #"violin"
        \Xvl
      >>

      \new Staff \with {
        fontSize = #+1
        \override StaffSymbol.staff-space = #(magstep +1)
      } <<
        \set Staff.midiInstrument = #"harpsichord"
        \Xbc
      >>
    >>

  \layout {

    indent = 0.8\cm

    \context	{
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
      %\override SpacingSpanner.uniform-stretching = ##t
      \override BarLine.hair-thickness = #1.2
      \override StaffGrouper.staff-staff-spacing.padding = #2
      \override StaffGrouper.staff-staff-spacing.basic-distance = #10
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
