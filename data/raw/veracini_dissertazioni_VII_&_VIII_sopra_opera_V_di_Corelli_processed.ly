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


Iglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza \terzinequarto
}

Ivln = \relative do'' {
   
   la,8
   re fa mi la fa re'4 dod8
   re fa mi la fa fa, re'4~
   re8 mi16 fa mi8 re dod4 r8 la'
   
   %4
   fa la re, fad sol sol, r sol'16 fa
   mi8 sol do, mi\mbreak fa fa, r do'
   re re, do do' sib sib, la la'
   
   %7
   re sol, do fa, sib do16(sib) la8 re
   mi, fa16 (sol) sol4 fa8 do' fa mi16(fa)
   re8 re sol4 r8 sol, do mi
   
   %10
   la, sib16(do) fa,4 r8 re sol sib
   mi,! fa16(sol) do,4 r8 la' re fa
   sib, re sol,4 r8 la fa la,\mbreak
   
   %13
   re8. mi32 fa mi8. re16 dod4. mi'8
   la4. la8 fad re sol4~
   sol8 sol16 fa? mi8 sol do4. do8
   
   %16
   la sib16 do fa,4. re8 sol4~
   sol8 sol16 fa mi8 do fa4. re8
   sol fa16(mi) la4~\mbreak la8 fa sib8 la16 (sol)
   
   %19
   do4. re8 sib2~
   sib8 do la (sol) la4 do,~
   do8 sib16(do) la8 do re4. do8
   
   %22
   si! re mi4. re16(mi) dod8 mi
   la4. sol8 fa la, re4~\mbreak 
   re8 do (si re,) sol4. fa8
   
   %25
   mib4 re dod8 la re4
   re4. dod8 re4.


}

Ibcn = \relative do {
   
   r8 
   r4 r8 la re fa mi[la]
   fa re'4 dod8 re4 r8 re,
   sol4. la16 sib la8 sol fa mi
   
   %4
   re4 r8 re' sib re sol, si
   do do, r do'16 sib\mbreak la8 do fa,[la]
   sib sib, r do' re re, do do'
   
   %7
   sib sib,? la la' sol do, fa sib,!
   do re16 sib do8 do, fa4 r8 fa'
   sib la16 sib sol8 sol do4 r8 do,
   
   %10
   fa la re, mib16 fa sib,4 r8 sol
   do mi? la, si?16 do fa,4 r8 re'
   sol sib mi,[sol] dod,4 r8 re
   
   %13
   sib re, sol8. la32(sib) la4. r8
   \clef tenor r8 la' re4. re8 si![sol]
   do4. do16 sib la8 do fa4~
   
   %16
   fa8 fa re mib16 fa sib,4. sol8
   do4. do16 sib la8 fa sib4~
   sib8 sol do sib16 la\mbreak re4. sib8
   
   %19
   mi re16 do fa4. sol8 mi re
   mi do fa sib, do4 r
   \clef bass fa,4. mi16 fa re8 fa sol4~
   
   %22
   sol8 fa mi sol la4. sol16 la   
   fa8 la re4. do8 sib re,\mbreak
   sol4. fa8 mib[sol,] do4~
   
   %25
   do sib la fa8 re
   la'2 re,4.
 
}

forma = {

   \time 4/4
   \key do\major
   \tempo 4 = 65
   \partial 8 s8
   s1*12
   s2 s4 s8 \bar ":..:"\break s
   s1*12
   s2 s4 s8
   \bar":|."

}


Ivl = {
   \Iglobal
   % \notypeset
   <<\Ivln\forma>>
}

Ibc = {
   \Iglobal
   \clef bass
   <<\Ibcn\forma>>
   \typeset
}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


IIglobal = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletBracket.bracket-visibility = ##f
   \senza \terzinequarto
}

IIvln = \relative do'' {

   re,16
   re4. fa8 mi sol
   fa la re fa, la, dod'
   re4 \once\stemUp re,8 fa' mi re

   %4
   mi la, do mi do la
   re4 \once\stemUp sib,8 re' do sib
   do fa,la do la fa

   %7
   sib4 \once\stemUp  sol,8 re'' do sib
   la fa la do fa do
   re sib re fa sol re\mbreak

   %10
   mi do mi sol do sol
   la do, re mi fa sol
   fa sol fa sol fa sol

   %13
   fa do re\p mi fa sol
   \tuplet 3/2 { fa(sol mi) fa[(sol mi)] fa(sol mi) }
   fa\f do la sib do la

   %16
   re re, mi fa sol fa
   mi re' do mi, fa la,
   sib fa' <<{fa4 mi}\\do2>>

   %19
   <la' mi la,>4. la'8 sol fa
   mi sol mi do mi fad
   sol4. sib8 la sol\mbreak

   %22
   fa la fa re fa sold
   la4. do8 si la
   sold si la si mi, si'

   %25
   do mi, re mi do mi
   si mi re mi si mi
   la, mi' re mi la, mi'

   %28
   <<<mi si>4.\\sold,>> re'8(do si)
   \tuplet 3/2 { si(re, do') } <<{si4. la8}\\mi2>>
   la8\f mi' re mi do mi

   %31
   si mi re mi si mi
   la, mi' re mi la,mi'
   <<<mi si>4.\\sold,\f>>  re'8(do si)\mbreak

   %34
   \tuplet 3/2 { do(re, do') } <<{si4. la8}\\re,2>>
   <la' mi la,>2~<la mi la,>8. mi'16
   mi4. la8 sold la

   %37
   mi la dod, la' la, la'
   fa4. fa8 sol? la
   re, sol si,! sol' sol, sol'

   %40
   mi4. mi8 fa sol
   do, fa la, fa' fa, fa'
   \tuplet 3/2 { re(mi fa) re[(mi fa)] re(mi fa)\mbreak

   %43
   mi(fa sol) mi[(fa sol)] mi(fa sol)
   fa(sol la) fa[(sol la)] fa(sol la)
   sol(la si) sol[(la si)] sol(la si)}

   %46
   la do la do la do
   sol do sol do sol do
   fa, do' fa, do' fa, do'

   %49
   mi,4. sib'8(la sol)
   \tuplet 3/2 { la sib, la'} <<{sol4. fa8}\\do2>>
   <<fa4\\la,>> r8 la' la sib

   %52
   do4. re8 (sib la)\mbreak
   sib4. fad8 sol la
   sib(la) la4. sol8

   %55
   sol sib16(la) sib8 sol la sib
   do,4. sib'8 la sol
   la fa sol la fa la

   %58
   sib,4. la'8 sol fa
   sol mi fa sol mi sol
   la,4. sol'8 fa mi

   %61
   fa[sib16(la) sib8 fa re sib']\mbreak
   do, mi la mi do la'
   sib, re sol re sib sol'

   %64
   la, fa'16(mi) fa8 do la fa'
   sol, sib mi! sib sol mi'
   fa, la re la fa re'

   %67
   sol, dod re fa, mi dod'
   re, sib'16(la) sib8 fa re sib'
   do, mi la mi do la'

   %70
   sib, re sol re sib sol'\mbreak
   <dod sol la,>4. re8 sib(la)
   sol(fa) <<{mi4. re8}\\la2>>

   %73
   <<re4.\\re>> re'8 sib(la)
   sol(fa) <<{mi4. re8}\\la2>>
   <<{re2~re8.}\\{re2~re8.}>>

}

IIbcn = \relative do {

    re16
    r2 r4
    re la' la,
    re sib' r

    %4
    do, la' la,
    sib sol' r
    la, fa' fa,

    %7
    sol do r
    fa, fa' la,
    sib sib' r\mbreak

    %10
    do, do' mi,
    fa fa' r
    sib, sib, sib'

    %13
    la fa r
    sib sib, sib'
    la fa r

    %16
    sib sib, sib'
    do do, re
    sib do do'

    %19
    la fa si,!
    do r do'
    sib sol dod,\mbreak  % fine secondo sistema

    %22
    re r re'
    do la red,
    mi r sold

    %25
    la mi' la,
    sold mi' sol,
    fad mi' fa,

    %28
    mi4. sold8 la4
    re, mi mi,
    la' mi' la,

    %31
    sold mi' sol,
    fad mi' fa,
    mi4. sold8 la4\mbreak

    %34
    re, mi mi,
    la2~la8. la'16
    la4 la, si

    %37
    dod la' r
    re, fa re
    si! sol' r

    %40
    do, mi do
    la fa' r
    sib! sib, sib'\mbreak

    %43
    do, do' r
    re re, re'
    mi, mi' r

    %46
    fa, do' fa,
    mi do' mi,
    re do' re,

    %49
    do4. re8 mi4
    sib do do,
    fa' do' fa,

    %52
    mi fad re\mbreak
    sol4. re8 mib4
    do re re,

    %55
    sol sol' fa
    mi do' do,
    r fa mi

    %58
    re sib' sib,
    r mi re
    dod la' la,

    %61
    r re sib'\mbreak
    r do, la'
    r sib, sol'

    %64
    r la fa'
    r sol, mi'
    r fa, re'

    %67
    sol, la la,
    r re sib'
    r do, la'

    %70
    r sib, sol'\mbreak
    la,4. fa'8 sol4
    re sol la,

    %73
    sib'4. fa8 sol4
    re sol la,
    re2~re8.

}

forma = {

   \time 3/4
   \key do\major
   \tempo 2 = 67
   \partial 16 s16
   s2.*34
   s2 s8.\bar ":..:"\break s16
   s2.*39
   s2 s8.
   \bar":|."

}


IIvl = {
   \IIglobal
   % \notypeset
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

    la'4 fa re
    sib'2 la4
    sol fa4. sol8

    %4
    mi2 re4
    la' fa re
    mi la la,

    %7
    re4. dod8 re mi
    dod2.
    la'4 do,!4. do8

    %10
    do2 si!4
    sol' sib,4. sib8
    sib?2 la4

    %13
    fa' mib sol8.(la32 sib)
    dod,4. dod8 re4~
    re8 mi mi4. re8

    %16
    re2.

}

IIIbcn = \relative do {

    re'4 re,2
    sol2 fa4
    dod re sol,

    %4
    la2 re,4
    re'' re,2
    do'4 do,2

    %7
    sib'4 sib,2
    la2.\mbreak
    fad'4 re fad

    %10
    sol sol,2
    mi'4 do mi
    fa fa,2

    %13
    fa'4 sol sib
    la4. sol8 fa4
    sol la la,

    %16
    re2.

}

forma = {

   \time 3/4
   \key do\major
   \tempo 4 = 60
   s2.*8 \bar ":..:"\break
   s2.*8
   \bar":|."

}


IIIvl = {
   \IIIglobal
   % \notypeset
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

    r8 r re dod (la dod)
    re(la re) dod(la dod)
    re4 fa8 mi la mi

    %4
    fa(la fa) mi(la mi)
    fa4 la8 sol(mi sol)
    la(fa la) sol(mi sol)

    %7
    la4 sib8 la(re la)\mbreak
    sib re sib la re la
    sib4. la4 dod,8

    %10
    re(mi fa) mi4 re8
    dod4. r8 r la'
    fad(sol la) re,(mi fad)

    %13
    sol4. r8 r sol
    mi(fa? sol) do,(re mi)
    fa4. r8 r do\mbreak

    %16
    re sib re re sib re
    mi, re'(do) fa,(sol la)
    re,(mi fa) do4 do'8

    %19
    la(do la) sol(do sol)
    la4. r8 r do
    do(re do) re (mi re)

    %22
    re4. r8 r re
    re(mi re) mi(fa mi)\mbreak
    mi4. r8 r mi

    %25
    do(si la) fa'(sol fa)
    fa(sol fa) mi(fa mi)
    la(si la) re,(mi re)

    %28
    sold(mi sold) la(mi re)
    do(si la) mi(la sold)
    la,4 do'8\p fa(sol fa)\mbreak

    %31
    fa(sol fa) mi(fa mi)
    la(si la) re,(mi re)
    sold(mi sold) la(mi re)

    %34
    do (si la)  mi la sold
    la,2. %%% OK
    r8 r fa'' mi(do mi)

    %37
    fa(do fa) mi(do mi)
    fa4 la8 sol(mi sol)
    la(fa la) sol(mi sol)

    %40
    la4 re,8 do(fa do)
    re(fa re) do(fa do)
    re4 sib'8 la re, la'

    %43
    sib re, sib' la re, la'\mbreak
    sib re, sib' sib re, sib'
    la re, la' la re, la'

    %46
    sol re sol sol do, sol'
    fad re fad sol la sib
    mi, fad sol re sol fad

    %49
    sol4.~sol8 la sib
    la sol fa do fa mi
    fa4.~fa8 sol la\mbreak

    %52
    sol( la fa) mi(fa re)
    dod4. la'
    re, sib'

    %55
    dod, la'\p
    re, sib'
    dod, la'\f

    %58
    sol8 la fa mi4.
    re4 fa,8 sib do sib
    sib do sib la sib la\mbreak

    %61
    re mi re sol, la sol
    dod la dod re la sol
    fa mi re la4 dod8

    %64
    re4\p fa8 sib do sib
    sib do sib la sib la
    re mi re sol, la sol

    %67
    dod la dod re la sol\mbreak
    fa mi re la4 dod8
    re2.

}

IVbcn = \relative do {

    R2.*2
    \clef tenor r8 r re' dod la dod
    re la re dod la dod

    %5
    re4 \clef bass fa,8 mi do mi
    fa do fa mi do mi
    fa4 sol8 fad re fad

    %8
    sol re sol fad re fad
    sol4. la
    sib4.  r8 r sib

    %11
    la4 la,8 si4 dod8
    re4. r8 r re'
    si! do re sol, la si

    %14
    do4. r8 r do
    la sib! do fa, sol la\mbreak
    sib4. r8 r sib,

    %17
    do4. la
    sib do
    fa, r8 r mi'

    %20
    fa do fa mi do mi
    fa4. r8 r fad
    sol re sol fad re fad

    %23
    sol4. r8 r sold
    la mi la sold mi sold
    la4. r8 r la

    %26
    sold4. sol
    fad fa
    mi do

    %29
    re mi
    la, r8 r la'\mbreak
    sold4. sol

    %32
    fad fa
    mi do
    re mi

    %35
    la,2.
    R2.*2
    \clef tenor r8 r fa'' mi re mi

    %39
    fa do fa mi do mi
    fa4 \clef bass sib,8 la fa la
    sib fa sib la fa la

    %42
    sib4 sol8 fad re fad
    sol re sol fad re fad\mbreak
    sol4. r8 r sol

    %45
    fad4. fa
    mi mib
    re sib

    %48
    do re
    sol, mi'!
    fa4 sib8 do4 do,8

    %51
    fa4. la\mbreak
    sib sol
    la fa8 sol la

    %54
    sib la sib sol fa sol
    la sol la fa sol la
    sib la sib sol fa sol

    %57
    la sol la fa mi fa
    sol fa sol la sol la
    re,4.\clef tenor r8 r re'

    %60
    dod4. do\mbreak
    si!sib
    la fa

    %63
    sol la
    \clef bass re, r8 r re
    dod4. do

    %66
    si sib
    la fa\mbreak
    sol la

    %69
    re,2.

}

forma = {

   \time 6/8
   \key do\major
   \tempo 2. = 60
   s2.*35
   \bar ":..:"\break
   s2.*34
   \bar":|."

}


IVvl = {
   \IVglobal
   % \notypeset
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

    si4
    mi2 fad4
    sol2 la4
    si la8 (sol fad mi)

    %4
    red2.
    si'4. la8 sol fad
    sol4 sold4.(la16 si)

    %7
    mi,4. re8(do si)
    do4. re8 si4\mbreak
    mi la,4. si8

    %10
    si2.
    r4 fad' si
    sol2.

    %13
    r4 mi la
    fad2.
    r4 sol si

    %16
    mi, la do
    fad,4. re8 sol re
    do(si) la2

    %19
    sol4 sol'2\mbreak
    r4 fad2
    r4 mi fad8 sol

    %22
    lad,4. fad'8 si fad
    mi re dod2
    si fad'4

    %25
    sol(si) red,
    mi2 si'4
    do mi sold,

    %28
    la2 mi4
    fa la, re\mbreak
    re4. mi8 re do

    %31
    do re si2
    la4 do2~
    do4 si8(la) sol(fad)

    %34
    sol4 mi sol'~
    sol fad8 mi red dod
    red4 si si'~

    %37
    si mi, la~
    la sol fad
    sol fad2\mbreak

    %40
    mi4. re8(do si)
    do4 dod4. (re16 mi)
    la,4. sol8(fa mi)

    %43
    fa4 fad4. (sol16 la)
    red,4. si'8(mi si)
    la sol fad2

    %46
    mi

}

Vbcn = \relative do {

    r4
    r r si
    mi2 fad4
    sol2 la4

    %4
    si la8 sol fad mi
    red4 si red
    mi4. re8 do si

    %7
    do4 sol!2
    la si4\mbreak
    do2.

    %10
    si4 si' mi
    red si red
    mi, mi' re!

    %13
    dod la dod
    re, re' do!
    si2 sol4

    %16
    do2 do,4
    re2 si4
    do re re,

    %19
    sol si sol\mbreak
    re' red sol,
    mi' sol mi

    %22
    fad2 re4
    mi fad fad,
    si2 r4

    %25
    r r si'
    do mi sold,
    la2\clef tenor mi'4

    %28
    fa la dod,
    re4. do!8 si la\mbreak
    \clef bass sold4 mi la

    %31
    re, mi mi,
    la'4. sol8 fad mi
    red2 r4

    %34
    mi4. re!8 do si
    lad2.
    si4 \clef tenor r8 si' dod red

    %37
    dod4. dod8 red mi
    red4 mi la,
    \clef bass si4. la8 sol fad\mbreak

    %40
    sol4 sold mi
    la4. sol!8 fa mi
    fa?4 dod2

    %43
    re4. do!8 si la
    si2 sol4
    la si2

    %46
    mi,

}

Vbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s4
   s2.*38
   <6 4>4 <5 _+>2
   <6>2.
   <_+>
   s
   <3!>4 <3+>2
   <7> <6>4
   s <_+>2

}

forma = {

   \time 3/4
   \key mi\minor
   \tempo 4 = 68
   \partial 4 s4
   s2.*23
   s2\bar ":..:"\break s4
   s2.*21
   s2
   \bar":|."

}


Vvl = {
   \Vglobal
   % \notypeset
   <<\Vvln\forma>>
}

Vbc = {
   \Vglobal
   \clef bass
   <<\Vbcn\forma\Vbfn>>
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

    si8
    mi si mi, sol' fad si,4 si'8
    mi, si do, mi' red si,4 si''8
    sold si, mi, sold' la la,,4 la''8

    %4
    fad la, re, fad' sol sol,,4 si''8
    la dod, red la' sol mi,4 sol'8
    fa la, do! fa mi do,4 do''8\mbreak

    %7
    red, mi si, re' <mi si mi,>4 r8 mi
    red fad si, si' sol mi,4 si'8
    lad dod fad, mi' re si,4 fad''8

    %10
    sol si, fad' si, mi4. re8
    dod mi dod si lad(mi' re si')
    re,4 dod si4. fad8

    %13
    si fad si, re' dod fad,4 fad'8
    si, fad sol, si' lad fad4 fad'8
    si fad si la sold4.(fad16 mi)

    %16
    la8 mi la sol fad4. re8
    sol re sol fad mi la16(sol) fad8 si16(la)
    sol8 do16 si la8 re16 do si8 re re, re'\mbreak

    %19
    mi, re' fad, re' sol, re' re, re'
    mi, re' fad, re' sol, do(si la)
    si4 la sol r8 sol,

    %22
    re' la re do si4 r8 si
    mi si mi re dod4 r8 dod
    fad dod fad  mi red4 r8 si'

    %25
    sol si fad si\mbreak sol si fad si
    sol si fad si sol(si) si,(si')
    dod,(si') red,(si') mi, la \parentSlur (sol fad)

    %28
    sol4 fad mi r8 si'\p
    sol si fad si\mbreak sol si fad si
    sol si fad si sol(si) si,(si')

    %31
    dod,\f(si') red,(si') mi, la (sol fad)\mbreak
    sol4 fad mi4. re8
    do mi, si' mi, la4. sol8

    %34
    fad la fad mi red(la' sol mi')
    sol,4 fad mi4.

}

VIbcn = \relative do {

    r8
    r4 r8 mi si' red, mi si
    do4 r8 do  si si' red si
    mi mi,4 re8 dod la' dod la

    %4
    re re,4 dod?8 si sol' si sol
    dod,4 r8 red mi fad sol mi
    la,4 r8 si! do mi do la\mbreak

    %7
    si4\clef tenor r8 si' mi si mi, sol'
    fad si, \clef bass r8 si, mi fad sol mi
    fad4 r8 fad si dod re si

    %10
    mi4 r8 re dod mi dod si
    lad4 r8 sold fad4 si,
    fad' fad, si4.\mbreak r8

    %13
    r4 r8 si' fad' lad, si fad
    sol4 r8 sol fad mi re dod
    si4 r8 si' mi si mi re

    %16
    dod4 r8 la re la re do
    si4 r8 sol do4 re
    mi fad sol r8 si,\mbreak

    %19
    do4 re mi r8 si
    do4 re mi r8 do
    re do re re, sol re sol, sol'

    %22
    fad4 r8 re sol re sol, si'
    sold4 r8 mi la mi la, dod'
    lad4 r8 fad si fad si, si'

    %25
    mi4 red\mbreak mi r8 si
    mi4 red mi r8 sol,
    la4 si do r8 la

    %28
    si la si si, mi mi' re si
    mi4 red mi r8 si
    mi4 red mi r8 sol,

    %31
    la4 si do r8 la\mbreak
    si8 la si si, mi fad sold mi
    la4 r8 sol! fad la fad mi

    %34
    red4. dod8 si4 mi
    si' si, mi4.

}

VIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown

   s8
   s1*31
   s2 <_!>4 <6>

}

forma = {

   \time 4/4
   \key mi\minor
   \tempo 2 = 65
   \partial 8 s8
   s1*11
   s2 s4 s8 \bar ":..:"\break s
   s1*22
   s2 s4 s8
   \bar":|."

}


VIvl = {
   \VIglobal
   % \notypeset
   <<\VIvln\forma>>
}

VIbc = {
   \VIglobal
   \clef bass
   <<\VIbcn\forma\VIbfn>>
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

    si4 mi4. fad8
    red2 mi4
    do8(si) do4. do8

    %4
    do4 si2
    mi4 la,4. la8
    la4(sol) si

    %7
    mi la,4. si8
    si2.\mbreak
    fad'4 si4. la8

    %10
    sol(fad) sol2
    mi4 la4. sol8
    fad(mi) fad2

    %13
    si,4 mi4. mi8
    lad4. fad8 si fad
    mi re dod2

    %16
    si2.
    si4 mi4. re8
    do si do2

    %19
    la4 re4. do8
    si(la) si2
    mi,4 la4. la8

    %22
    red4. si8 mi si
    la sol fad2
    mi2.

}

VIIbcn = \relative do {

    mi8 fad sol mi sol la
    si do si la sol mi
    la si la sol fad re

    %4
    sol fad sol la si sol
    do si do la si do
    red, si mi fad re mi

    %7
    do si do2
    si2.\mbreak
    \clef tenor red'8 dod red si dod red

    %10
    mi red mi fad mi re
    dod si dod la si dod
    re dod re \clef bass re, mi fad

    %13
    sol fad sol mi fad sol
    fad sol fad mi re si'
    mi, la fad mi fad fad,

    %16
    si' la si do si la\mbreak
    sold fad sold mi fad sold
    la sold la si la sol

    %19
    fad mi fad re mi fad
    sol fad sol sol, la si
    do si do la si do

    %22
    si do si la sol mi'
    la, mi' si2
    mi,2.

}

VIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {

   \time 3/4
   \key mi\minor
   \tempo 4 = 60
   s2.*8 \bar ":..:"%\break
   s2.*16
   \bar":|."

}


VIIvl = {
   \VIIglobal
   % \notypeset
   <<\VIIvln\forma>>
}

VIIbc = {
   \VIIglobal
   \clef bass
   <<\VIIbcn\forma\VIIbfn>>
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

    si8
    sol(fad mi) sol(si mi) red(dod si) r r mi
    do re mi la, re do si la sol sol,4 si''8
    la(si sol) fad(sol mi) red mi fad si, do la

    %4
    sol si mi fad,4 red'8 mi,4. r8 r sol'\mbreak
    la fad la si fad si sol fad mi r r si'
    do la do re la re si la sol r r si

    %7
    la si la re do re sol,4. r8 r sol
    fad mi fad si la si mi,4. r8 la sol\mbreak
    fad mi re sol la si mi, fad sol re,4 fad'8

    %10
    sol,,4. r8 si' dod re mi re re mi re
    dod? si la r dod! red mi fad mi mi fad mi
    red? dod si fad'4.\parentSlur (fad4) si,8 mi4.~

    %13
    mi8 re? dod re dod si\mbreak lad' fad si dod, si' lad
    si4.~si4 la!8 sol4.~sol4 fad8
    mi fad re dod re si lad4 sol'8 fad4 mi8

    %16
    re fad si fad,4 lad'8 si,4.~si4 fad'8
    re(dod si) re fad si lad sold fad r r si
    sol la? si mi, la sol fad mi re re,4 fad'8

    %19
    fad mi fad si, sol' fad sol4 si,8 mi,4 si''8
    si la si mi, do' si do4 mi,8 la,4 la'8\mbreak
    la si do si do la sold fad mi r r mi

    %22
    fa sol mi fa sol mi re4.~re4 do8
    re4 do8 re4 do8 sib4.~sib4 la8
    si! do la si do la sold4 fa'8 mi4 re8

    %25
    do mi la mi,4 sold'8\mbreak la4 mi,8 la,4 la''8
    fad re sol si, sol' fad sol4 re,8 sol,4 si''8
    la si la fad,4 la'8 sol la sol mi,4 sol'8

    %28
    fad sol la fad sol mi red4 fad,8 si,4 si'8
    do re si do re si la4.~la4 sol8\mbreak
    la4 sol8 la4 sol8 fa4.~fa4 mi8

    %31
    fa sol mi fa sol mi red4 si8 si'4.~
    si4 mi,8 la4.~la8 sol fad? sol fad mi
    red' si mi fad, mi' red mi4.~mi4 re8\mbreak

    %34
    do4.~do4 si8 la si sol fad sol mi
    red4 do'8 si4 la8 sol si mi si,4 si'8
    sol si mi si,4 red'8 <mi si mi,>4.~<mi si mi,>4

}

VIIIbcn = \relative do {

    r8
    mi'4. mi, si' sold
    la fad sol r4 r8
    la4. la, si r8 r red

    %4
    mi4 la,8 si4 si'8 sol fad mi sol si mi\mbreak
    red dod si r r si, mi4 mi8 sol do? si
    la sol fad r r re sol4 sol8 si la sol

    %7
    fad4. r8 r fad mi fad mi la sol la
    re,4. r8 r sol do,4 do8 do'4.~\mbreak
    do si do re

    %10
    sol,4 re8 sol,4 sol'8 fad4. sold
    la4 mi8 la,4 la'8 sold4. la
    si r8 r fad sol4. r8 r sol

    %13
    lad,4. si\mbreak fad r8 r fad'
    re dod si red fad si mi,4. fad
    sol mi fad r8 r lad

    %16
    si4 mi,8 fad4 fad,8 si4.~si4 r8
    si'4. si, fad' red
    mi dod re? r4 r8

    %19
    red4. r8 r si mi4. r4 r8
    sold4. r8 r mi la4. r4 r8\mbreak
    re,4. red mi4 mi8 sold fad mi

    %22
    la4. r8 r sol fa4 mi8 fa4 mi8
    fa4. r8 r mi re4 do8 re4 do8

    %24
    re4. r8 r do si!4. r8 r re
    mi4. mi,\mbreak la r8 r do
    re4. re, sol r8 r sol'

    %27
    fad4. r8 r fad mi4. r8 r mi
    la,4. lad si r8 r si'
    mi4. r8 r re do4 si8 do4 si8\mbreak

    %30
    do4. r8 r si la4 sol8 la4 sol8
    la4. r8 r la si4. r8 r si
    do4. r8 r do red,4. mi

    %33
    si r8 r si' sol fad mi sold si mi\mbreak
    la,4. si do la
    si r8 r si, mi sol mi si'4 si,8

    %36
    mi sol mi si'4 si,8 mi4.~mi4

}

VIIIbfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown



}

forma = {



   \time 12/8
   \key mi\minor
   \tempo 2. = 60
   \partial 8 s8
   s1.*15
   s2. s4. s4
   \bar ":..:"\break s8
   s1.*19
   s2. s4. s4
   \bar":|."

}


VIIIvl = {
   \VIIIglobal
   % \notypeset
   <<\VIIIvln\forma>>
}

VIIIbc = {
   \VIIIglobal
   \clef bass
   <<\VIIIbcn\forma\VIIIbfn>>
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

\markup\huge\bold\fill-line{"Dissertazione VII"}

\markup \huge \column{"  ""  ""[I.1] Preludio - And[an]te Moderato"}

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

\markup \huge \column{"[I.2] Corrente"}

\score {
    \new ChoirStaff <<

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep -0.5)
     }<<
        \set Staff.midiInstrument = #"violin"
        \IIvl
      >>

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep +0.5)
     }
      <<
        \set Staff.midiInstrument = #"harpsichord"
        \IIbc
      >>
    >>

  \layout {

    indent = 1\cm

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

\markup \huge \column{"[I.3] Sarabanda - Largo"}

\score {
    \new ChoirStaff <<

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep -0.5)
     }<<
        \set Staff.midiInstrument = #"violin"
        \IIIvl
      >>

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep +0.5)
     }
      <<
        \set Staff.midiInstrument = #"harpsichord"
        \IIIbc
      >>
    >>

  \layout {

    indent = 1\cm

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

\markup \huge \column{"[I.4] Giga - Allegro"}

\score {
    \new ChoirStaff <<

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep -0.5)
     }<<
        \set Staff.midiInstrument = #"violin"
        \IVvl
      >>

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep +0.5)
     }
      <<
        \set Staff.midiInstrument = #"harpsichord"
        \IVbc
      >>
    >>

  \layout {

    indent = 1\cm

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

\markup\huge\bold\fill-line{"Dissertazione VIII"}

\markup \huge \column{"  ""  ""[II.1] Preludio - Largo"}

\score {
    \new ChoirStaff <<

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep -0.5)
     }<<
        \set Staff.instrumentName = \markup\center-column {"[Violino]"}
        \set Staff.midiInstrument = #"violin"
        \Vvl
      >>

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep +0.5)
     }
      <<
        \set Staff.instrumentName = \markup\center-column {"[Basso]"}
        \set Staff.midiInstrument = #"harpsichord"
        \Vbc
      >>
    >>

  \layout {

    indent = 1.7\cm

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

\markup \huge \column{"[II.2] Al[l]emanda - Allegro"}

\score {
    \new ChoirStaff <<

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep -0.5)
     }<<
        \set Staff.midiInstrument = #"violin"
        \VIvl
      >>

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep +0.5)
     }
      <<
        \set Staff.midiInstrument = #"harpsichord"
        \VIbc
      >>
    >>

  \layout {

    indent = 1\cm

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

\markup \huge \column{"[II.3] Sarabanda - Largo"}

\score {
    \new ChoirStaff <<

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep -0.5)
     }<<
        \set Staff.midiInstrument = #"violin"
        \VIIvl
      >>

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep +0.5)
     }
      <<
        \set Staff.midiInstrument = #"harpsichord"
        \VIIbc
      >>
    >>

  \layout {

    indent = 1\cm

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

\markup \huge \column{"[II.4] Giga - Allegro"}

\score {
    \new ChoirStaff <<

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep -0.5)
     }<<
        \set Staff.midiInstrument = #"violin"
        \VIIIvl
      >>

      \new Staff \with {
        fontSize = #-1
       \override StaffSymbol.staff-space = #(magstep +0.5)
     }
      <<
        \set Staff.midiInstrument = #"harpsichord"
        \VIIIbc
      >>
    >>

  \layout {

    indent = 1\cm

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
