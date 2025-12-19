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

notypeset = \set Score.skipTypesetting = ##t

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
\language "italiano"


Iglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
}



IflIn = \relative do'' {

    R2.*7
    re'2.~\dolce
    re~

    %10
    re4 sib sol
    dod,4. re8 mi4~
    mi re do!8 la'

    %13
    sib, sib'-. r la-. r sol~
    sol16 fa(mi fa) r fa(mi fa) r fa(mi fa)
    sol (fa mi fa) fa2\tr

    %16
    mi16 sib'(la sol) fa2\tr\mbreak
    mi4 r r
    R2.

    %19
    r4 la re
    sib2.~
    sib4 sol do

    %22
    la2.~
    la4 fa sib
    sol2.~

    %25
    sol4 mi la
    fa16(la sib re) sib2\tr
    la8 la-. r la-. r16 fa la8

    %28
    r8 sol-. r sol-. r16 mi sol8~
    sol16 fa re8 re4(do8) sib\mbreak
    la r r4 r

    %31
    R2.
    sol2.~
    sol4 fa la

    %34
    sib2.~\mbreak
    sib16 la sib8 sib4(la8) sol
    fa r r4 r

    %37
    re'2.~
    re4 dod mi
    fa2.~\mbreak

    %40
    fa4 mi sol
    la16 re sib8-. r la r sol
    fa4\tr(mi) r

    %43
    R2.*3
    re'2.~
    re~

    %48
    re4 sib sol
    \grace re8 dod4. re8 mi4~\mbreak
    mi re do!8 la'

    %51
    sib, sib'-. r la-. r sol~
    sol16 fa(mi fa) r fa(mi fa) r fa(mi fa)
    sol (fa mi fa) fa2\tr

    %54
    mi16 sib'(la sol) fa2\tr

}

IflIIn = \relative do'' {

    R2.*4
    la'2.~
    la~

    %7
    la4 fa re
    sib8 re-. r re-. r16 sib re8
    r do r do r16 la do8

    %10
    sib2.~
    sib4 la sol8 mi'\mbreak
    fa,4. mi8 fad4\tr

    %13
    sol8 sol'-. r fa!-. r mi~
    mi16 re(dod re) r re(dod re) r re(dod re)
    mi (re dod re) re2\tr

    %16
    dod16 sol'(fa mi) re2\tr\mbreak
    dod4 r r
    R2.*2

    %20
    r4 re sol\mbreak
    mi2.~
    mi4 do fa

    %23
    re2.~
    re4 sib mi\mbreak
    dod2 r4

    %26
    r sol16(sib re sol) \grace fa8 mi4
    fa8 do!-. r do-. r16 la do8
    r sib-. r sib-. r16 sol sib8~

    %29
    sib16 la sib8 sib4(la8) sol\mbreak
    fa r r4 r
    fa2.~

    %32
    fa4 mi sol
    la2.~
    la4 sol sib\mbreak

    %35
    do16 fa re8 re4(do8) sib
    la r r4 r
    R2.

    %38
    mi'2.~
    mi4 re fa\mbreak
    sol2.~

    %41
    sol16 fa sol8-. r fa r mi
    re4\tr(dod) r
    la'2.~

    %44
    la~\mbreak
    la4 fa re
    sib8 re-. r re-. r16 sib re8

    %47
    r do-. r do-. r16 la do8
    sib2.~
    sib4 la sol8 mi'\mbreak

    %50
    fa,4. mi8 fad4\tr
    sol8 sol'-. r fa!-. r mi~
    mi16 re(dod re) r re(dod re) r re(dod re)

    %53
    mi (re dod re) re2\tr
    dod16 sol'(fa mi)  re2\tr

}


IvlIn = \relative do'' {

    r8 fa^\markup\italic"con Sordino et sempre piano" r fa r16 re fa8
    r mi r mi r16 dod mi8~
    mi16 re sib8 sib4(la8) sol

    %4
    fa16 re' sib8 sib4(la8) sol
    fa8 fa'-. r fa-. r16 re fa8\mbreak
    r mi-. r mi-. r16 dod mi8

    %7
    re r r4 r
    r8 sib-. r sib-. r16 sol sib8
    r la r la r16 fad la8

    %10
    sol-. sol,-. r re'-. r mi-.
    r mi r mi r dod\mbreak
    r re r la' r la

    %13
    sol r r4 r
    R2.*3\mbreak
    r16 mi' sib8 sib4(la8) sol

    %18
    fa16 re' sib8 sib4(la8) sol
    fa16(la) la(fa) fa(la) la(fa) fa(la) la(fa)
    re8 r r4 r\mbreak

    %21
    r16 sol sol(mi) mi(sol) sol(mi) mi(sol) sol(mi)
    fa8 r r4 r
    r16 fa fa(re) re(fa) fa(re) re(fa) fa(re)

    %24
    mi8 r r4 r\mbreak
    r16 mi mi(dod) dod(mi) mi(dod) dod(mi) mi(dod)
    re8 r r4 r

    %27
    do'!2.~
    do2 r4
    R2.\mbreak

    %30
    r16 fa re8 re4(do8) sib
    la do, r do r do
    r re r mi r mi

    %33
    r do r re r fa
    r re r re r sol~\mbreak
    sol16 fa r8 r4 r

    %36
    r16 re' sib8 sib4(la8) sol
    fa la-. r la r la
    r sib r la r dod

    %39
    r la r sib r re\mbreak
    r sib r re r dod16 mi~
    mi re r8 r4 r

    %42
    R2.
    r8 fa-. r fa-. r16 re fa8
    r mi-. r mi-. r16 dod mi8\mbreak

    %45
    re r r4 r
    r8 sib-. r sib-. r16 sol sib8
    r la-. r la-. r16 fad la8

    %48
    sol sol, r re' r mi
    r mi r mi r dod\mbreak
    r re r la' r la

    %51
    sol r^\markup\italic"[senza sord]." r4 r
    R2.*3

}


IvlIIn = \relative do'' {

    r8 la^\markup\italic"con Sordino et sempre piano" r la r16 fa la8
    r sol r sol r16 mi sol8~
    sol16 fa sol8 sol4(fa8) mi

    %4
    re16 fa sol8 sol4(fa8) mi
    re la'-. r la-. r16 fa la8\mbreak
    r sol-. r sol-. r16 mi sol8

    %7
    fa r r4 r
    sol,-. sol-. sol-.
    re'-. re-. re-.

    %10
    sol,8-. sol-. r sol-. r sol-.
    r la r la r la\mbreak
    r re r re r re

    %13
    re r r4 r
    R2.*3\mbreak
    r16 sol sol8 sol4(fa8) mi

    %18
    re16 fa sol8 sol4(fa8) mi
    re16(fa) fa(re) re(fa) fa(re) re(fa) fa(re)
    re8 r r4 r

    %21
    r8. do16 do(mi) mi(do) do(mi) mi(do)
    fa8 r r4 r
    r8. sib,16 sib(re) re(sib) sib(re) re(sib)

    %24
    mi8 r r4 r\mbreak
    r8. la,16 la(dod) dod(la) la(dod) dod(la)
    la8 r r4 r

    %27
    do'!2.~
    do2 r4
    R2.\mbreak

    %30
    r16 la sib8 sib4(la8) sol
    fa la, r la r la
    r sib r sol r sib

    %33
    r do r re r do
    r re r re r re\mbreak
    do r r4 r

    %36
    r16 fa sol8 sol4(fa8) mi
    re fa-. r fa r fa
    r sol r mi r sol

    %39
    r fa r fa r la\mbreak
    r sib r sol r sib
    la r r4 r

    %42
    R2.
    r8 la-. r la-. r16 fa la8
    r sol\parenthesize -. r sol\parenthesize -. r16 mi sol8

    %45
    fa r r4 r
    sol,-. sol-. sol-.
    re'-. re-. re-.

    %48
    sol,8 sol r sol r sol
    r la r la r la\mbreak
    r re r re r re

    %51
    re r^\markup\italic"[senza sord.]" r4 r
    R2.*3

}


Ivlan = \relative do' {

    re4-.^\markup\italic"con Sordino et sempre piano" re-. re-.
    dod-. dod-. dod-.~
    dod16 re re8 r re4 dod8

    %4
    re4 r8 re4 dod8
    re4-. re-. re-.\mbreak
    dod-. dod-. dod-.

    %7
    re8 r r4 r
    R2.*9
    r4 r8 re4 dod8

    %18
    re4 r8 re4 dod8
    la r r4 r
    sib16(re) re(sib) sib(re) re(sib) sib(re) re(sib)\mbreak

    %21
    do8 r r4 r
    r16 do do(la) la(do) do(la) la(do) do(la)
    sib8 r r4 r

    %24
    r16 sib sib(sol) sol(sib) sib(sol) sol(sib) sib(sol)\mbreak
    la8 r r4 r
    R2.

    %27
    r4 fa'-. fa-.
    r do-. dod-.
    re8 r r4 r\mbreak

    %30
    r r8 fa4 mi8
    do r r4 r
    R2.*4

    %36
    r4 r8 re4 dod8
    la re16 do! sib8 la sol fa
    sol mi16 sol la8 sol fa mi

    %39
    re re'16 do sib8 la sol fa\mbreak
    mi mi'16 re dod8 si la sol
    fa r r4 r

    %42
    R2.
    re'4-. re-. re-.
    dod-. dod-. dod-.\mbreak

    %45
    re8 r^\markup\italic"[senza sord.]" r4 r
    R2.*9

}

Ibcn = \relative do {

    re,4-. re'-. re,-.
    la'-. la'-. la,-.
    sib r8 sol' la la,

    %4
    sib4 r8 sol' la la,
    re,4-. re'-. re,-.\mbreak
    la'-. la'-. la,-.

    %7
    re,8 r r4 r
    R2.*5
    sol4-. sol-. la-.

    %14
    sib sib la
    r r sold
    la r sold\mbreak

    %17
    la r8 sol'! la la,
    sib4 r8 sol' la la,
    re, r r4 r

    %20
    sol'16(sib) sib(sol) sol(sib) sib(sol) sol(sib) sib(sol)
    do,8 r r4 r
    r8. fa16 fa(la) la(fa) fa(la) la(fa)

    %23
    sib,8 r r4 r
    r8. mi16 mi(sol) sol(mi) mi(sol) sol(mi)\mbreak
    la,8 r r4 r

    %26
    re r8 sol, do do,
    fa4 r r
    do' r r

    %29
    re, r8 sib' do do,\mbreak
    re4 r8 sib' do do,
    fa fa'16 mi re8 do sib la

    %32
    sib sol16 sib do8 sib la sol
    fa fa'16 mi re8 do sib la
    sol sol'16 fa mi8 re do sib\mbreak

    %35
    la4 r8 sib do do,
    fa'4 r8 sol la la,
    re, r r4 r

    %38
    R2.*3
    r4 fa'-. sol-.
    la la, r

    %43
    re, -. re'-. re,-.
    la'-. la'-. la,-.
    re,8 r r4 r

    %46
    R2.*5
    sol4-. sol-. la
    sib sib' la

    %53
    r r sold
    la r sold

}

Ibfn = \figuremode {

    \bassFigureExtendersOn
    \bassFigureStaffAlignmentDown

    s2.*34
    <9 7>16 <8 6> s8 s2
    s2.*5
    <9 7>16 <8 6>

}

forma = {

    \time 3/4
    \key re\minor
    \tempo 4 = 55
    s2.*54 |
    \time 2/2

}

IflI = {
    \Iglobal
    %notypeset
    <<\IflIn \forma>>
}

IflII = {
    \Iglobal
    <<\IflIIn \forma>>
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
    << \Ibcn \forma\Ibfn>>
    \typeset
}




\language "italiano"


IIglobal = 	{
    \override Score.MetronomeMark #'transparent = ##t
    \override Score.BarNumber #'font-size = #0.5
    \override Score.BarNumber #'padding = #1.3
    \override TupletNumber #'transparent = ##t
    \override TupletBracket #'bracket-visibility = ##f
}



IIflIn = \relative do'' {

    mi4 r r2
    R1*8
    r2 re4. fa8
    \grace la, sold4. la8 si fa' mi re

    %12
    do16 si la4 si16 do re8 fa mi re\mbreak
    do4 r8 fa16 (re) si8.(do32 re) do8 si
    do mi16 do la2 sold4

    %15
    la8 la'16 fa re2 dod4\mbreak
    re4 r8 sib'16 sol mi8.(fa32 sol) fa8 mi
    fa4 re'2 do!4~

    %18
    do16 fa, sol la sib2 la4~\mbreak
    la16 re, mi fad sol2 fa4~
    fa16 [re mi fa] sol mi fa re dod4 r

    %21
    la'4. sib8 \grace re, dod4. re8\mbreak
    mi sib' la sol fa16 mi re4 mi16 fa
    sol8 sib la sol fa16[mi re dod] re do si\tr la

    %24
    si[re mi fa] mi re do la \grace la8 sold4. sold8\mbreak
    la4 la'2 sold4
    la r la4. sib!8

    %27
    \grace re,8 dod4. dod8 re2~\mbreak
    re4 dod re16 mi fa sol la8 [la,]
    mi'4. fa8~fa re do si

    %30
    la4 la'2 sold4\mbreak
    la4 r8 fa,8 sol'!4~sol16 mi fa sol
    la4  r8 la, mi'4~mi16 do re mi

    %33
    fa4 r8 fa, do'4~do16 la sib do\mbreak
    re4~re16 fa! mib re do4~do16 mib re do
    sib4~sib16 re do sib la8\tr sol r4

    %36
    r r16 do' sib la sol2\mbreak
    fa4~fa16 la sol fa mi4.(mib8)
    re4~re16 fa mib re do4~do8 re16 mib

    %39
    re4~re16 re mi! fa mi4~mi16 mi fa sol\mbreak
    fa4~fa16 fa sol la sol4~sol16 sol la sib
    la8 do,16 (la) fa2 mi4

    %42
    fa8\tr(mi) r4 r2\mbreak
    R1
    do'4. re8 \grace re do4. sib8
    la4 r8 re16 (sib) sol8.(la32 sib) la8 sol\mbreak

    %46
    la do16 la fa2 mi4
    fa r8 sib'16 sol mi8.(fa32 sol) fa8 mib
    re4 r8 sol16 mib do8.(re32 mib) re8 do\mbreak

    %49
    sib4 r8 mib16 do la8.(sib32 do) sib8 la
    si8 do4 si8 dod re4 dod8
    re4 r16 sol la sib do,!4 r

    %52
    do'4. re8 \grace fa, mi4 fa
    do'4. re8 \grace fa, mi4. mi8
    fa2. mi4

    %55
    fa8 do'16 la fa2 mi4
    la16[fa do la] fa' do sib la sol4 r
    la8 [do] fa16 do sib la sol4 r

    %58
    la8 [do] fa16 do sib la sol fa' mi re mi [do sib la]
    sib8 re sol sib, la sol' fa si,
    do mi la do, si fad' sol sib,

    %61
    la sol' fa lab, sol [re'] do16 sib la? sol
    fa8 r r4 r2
    R1

    %64
    r2 r4 mi'~
    mi re~re8 do~do16 [re do sib]
    la4 r sol'2~\mbreak
    sol4 fa sib2~

    %68
    sib4 la re2~
    re4 do~do8 sib la4~\mbreak
    la4 re,2 dod4

    %71
    fa2. mi4
    la2. sol4~\mbreak
    sol fa~fa8 mi4 re16 mi

    %74
    fad2(sol4) r
    sold2 la4~la16[sib do la]
    fad8 r r4 r2\mbreak

    %77
    R1*8
    r2 sol4. sib8\mbreak
    \grace re, dod4. re8 mi sib' la sol

    %87
    fa16 mi re4 mi16 fa sol8 sib la sol
    fad re sol2 fa!4~\mbreak
    fa mib2 re4~
    re do2 sib4~

    %91
    sib16 re do sib la4~la16 do sib la sol4~
    sol16 sib la sol fad4\tr sol8 r r4
    R1*3
    r4 sol2 fad4

    %97
    sol 8 (sib' sol mib) \grace re dod2\mbreak
    re8 (fa! re sib) \grace la sold2
    la8 mi'!16 dod la2 sol'!4~

    %100
    sol fa2 mi4~\mbreak
    mi re2 do4~
    do sib2 la4

    %103
    sol r r2
    r re'4. mib8\mbreak
    \grace sol, fad4. fad8 sol mib' re do

    %106
    sib16 la sol4 fad8 sol do sib la
    sol r r4 r2
    r8 sol'(fa mi) re2\tr

    %109
    dod4 r r2
    R1*8
    r2 re4. fa8

    %119
    \grace la, sold4. la8 si fa' mi re
    do16 si la4 si16 do re8 fa mi re\mbreak
    do mi16 do la2 sol'!4~

    %122
    sol8 fa r sib16 sol mi8.(fa32 sol) fa8 mib
    re4\fermata r mib8.(fa32 sol) mib8 re
    dod sib' la sol fa4 mi!\tr

    %125
    re1

}

IIflIIn = \relative do'' {

    dod4 r r2
    R1*124

}


IIvlIn = \relative do'' {

    R1*9
    r2 re4. fa8
    \grace la, sold4. la8 si fa' mi re

    %12
    do16 si la4 si16 do re8 fa mi re\mbreak
    do4 r8 fa16 (re) si8.(do32 re) do8 si
    do mi16 do la2 sold4

    %15
    la8 la'16 fa re2 dod4\mbreak
    re4 r8 sib'16 sol mi8.(fa32 sol) fa8 mi
    fa4 re'2 do!4~

    %18
    do16 fa, sol la sib2 la4~\mbreak
    la16 re, mi fad sol2 fa4~
    fa16 [re mi fa] sol mi fa re dod4 r

    %21
    la'4. sib8 \grace re, dod4. re8\mbreak
    mi sib' la sol fa16 mi re4 mi16 fa
    sol8 sib la sol fa16[mi re dod] re do si la

    %24
    si[re mi fa] mi re do la \grace la8 sold4. sold8\mbreak
    la4 la'2 sold4
    la r la4. sib!8

    %27
    \grace re,8 dod4. dod8 re2~\mbreak
    re4 dod re16 mi fa sol la8 [la,]
    mi'4. fa8~fa re do si

    %30
    la4 la'2 sold4\mbreak
    la4 r8 fa,8 sol'!4~sol16 mi fa sol
    la4  r8 la, mi'4~mi16 do re mi

    %33
    fa4 r8 fa, do'4~do16 la sib do\mbreak
    re4~re16 fa! mib re do4~do16 mib re do
    sib4~sib16 re do sib la8\tr sol r4

    %36
    r r16 do' sib la sol2\mbreak
    fa4~fa16 la sol fa mi4.(mib8)
    re4~re16 fa mib re do4~do8 re16 mib

    %39
    re4~re16 re mi! fa mi4~mi16 mi fa sol\mbreak
    fa4~fa16 fa sol la sol4~sol16 sol la sib
    la8 do,16 (la) fa2 mi4

    %42
    fa8\tr(mi) r4 r2\mbreak
    R1
    do'4. re8 \grace re do4. sib8
    la4 r8 re16 (sib) sol8.(la32 sib) la8 sol\mbreak

    %46
    la do16 la fa2 mi4
    fa r8 sib'16 sol mi8.(fa32 sol) fa8 mib
    re4 r8 sol16 mib do8.(re32 mib) re8 do\mbreak

    %49
    sib4 r8 mib16 do la8.(sib32 do) sib8 la
    si16 sol do4 si8 dod16 la re4 dod8
    re4 r16 sol la sib do,!4 r

    %52
    do4. re8 mi,4 fa
    do'4. re8 \grace fa, mi4. mi8
    fa4 fa'2 mi4\mbreak

    %55
    fa8 do16 la fa2 mi4
    la16[fa do' la] fa' do sib la sol4 r
    la16[fa do' la] fa' do sib la sol4 r

    %58
    la16[fa do' la] fa' do sib la sol[fa' mi re] mi do sib la
    sib[sol re' sib] sol' re do sib la[sol' fa mi] fa re do si
    do[la mi' do] la' mi re do si[la' sol fad] sol si, sol' sib,\mbreak

    %61
    la[sol' fa! mi] fa la, fa' lab, sol[fa' mi re] do sib la sol
    fa8 r r4 r8 sol4 fad8
    sol r r4 r8 la4 sold8

    %64
    la r r4 r mi'~
    mi re~re8 do~do16 [re do sib]
    la4 r sol'2~\mbreak
    sol4 fa sib2~

    %68
    sib4 la re2~
    re4 do~do8 sib la4~\mbreak
    la4 re,2 dod4

    %71
    fa2. mi4
    la2. sol4~\mbreak
    sol fa~fa8 mi4 re16 mi

    %74
    fad2(sol4) r
    sold2(la16) la, do' sib! la[sib do la]
    fad8 r r4 r2\mbreak

    %77
    R1*8
    r2 sol4. sib8\mbreak
    \grace re, dod4. re8 mi sib' la sol

    %87
    fa16 mi re4 mi16 fa sol8 sib la sol
    fad re sol2 fa!4~\mbreak
    fa8 sib, mib2 re4~
    re8 sol, do2 sib4~

    %91
    sib16 re do sib la4~la16 do sib la sol4~
    sol16 sib la sol fad4\tr sol16 fa mib re dod4\tr
    re8 la'16 fa re2 dod4

    %94
    re r8 sib'16 sol mi8.(fa32 sol) fa8 mi\mbreak
    fad sol r mib'16 do la8.\parentSlur (sib32 do) sib8 la
    sib re16 sib sol2 fad4

    %97
    sol 8 sib' (sol mib) \grace re dod2\mbreak
    re8 fa (re sib) \grace la sold2
    la8 mi'?16 dod la2 sol!4~

    %100
    sol fa2 mi4~\mbreak
    mi re2 do4~
    do sib2 la4

    %103
    sol r r2
    r re''4. mib8\mbreak
    \grace sol, fad4. fad8 sol mib' re do

    %106
    sib16 la sol4 fad8 sol do sib la
    sol r r4 r2
    r8 sib la sol fa2\tr\mbreak

    %109
    mi4 r r2
    R1*8
    r2 re'4. fa8

    %119
    \grace la, sold4. la8 si fa' mi re
    do16 si la4 si16 do re8 fa mi re\mbreak
    do mi16 do la2 sol!4~

    %122
    sol8 fa r sib'16 sol mi8.(fa32 sol) fa8 mib
    re4\fermata r mib8.(fa32 sol) mib8 re
    dod sib' la sol fa4 mi!\tr

    %125
    re1

}


IIvlIIn = \relative do'' {

    R1*7
    la4. sib8 \grace re, dod4. re8\mbreak
    mi sib' la sol fa16 mi re4 mi16 fa

    %10
    sol8 sib la sol fa la16 sol fa8[mi16 re]
    mi4. fa16 mi fa8 re' do si
    la2. sold4\mbreak
    la8 mi'16 (do) la2 sold4
    la r8 fa'16 re si8.(do32 re) do8 si

    %15
    dod re r sib'!16 sol mi8.(fa32 sol) fa8 mi\mbreak
    fa la16 fa re2 dod4
    re r16 la' sol fa mi4.(mib8)

    %18
    re4~re16 fa mib re do2\mbreak
    sib4~sib16 re do sib la4. sib16 do
    sib2~sib16 sol la sib la [fa sol mi]

    %21
    fa8 fa4 sol16 fa mi sol la sib la[sol fa re]\mbreak
    dod re mi dod' re8[dod] re2~
    re4 dod re8. mi16 fa [mi re do]

    %24
    si4. la16 do re[do si la] si sold la si\mbreak
    mi,8 do'16 mi fa[mi re do] si4~si16 re mi fa
    mi sol fa mi re8[mi]~mi8 r r4

    %27
    R1\mbreak
    r2 re4. fa8
    \grace la, sold4. la8 si fa' mi re
    do16 si la4 si16 do re8 fa mi re\mbreak
    do fa, fa'2 mi4~

    %32
    mi8 la, re2 do4~
    do8 fa, sib2 la4~\mbreak
    la16 re, mi fad sol4~sol16 sib la sol fad4~

    %35
    fad16 la sol fa mi8 [fa16 sol] fa8\tr[mi] r4
    fa fa'2 mi4~\mbreak
    mi16 la, si dod re2 do4~

    %38
    do16 fa, sol la sib2 la4~
    la16 fa sol la sol4~sol16 sol la sib la4~\mbreak
    la16 la sib do sib4~sib16 sib do re do4~

    %41
    do8 r r re16 sib sol8.(la32 sib) la8 sol
    la\tr\parentSlur (sol) r4 r2
    do4. re8 do sib la[sol16 fa]
    mi2 fa4. mi8

    %45
    fa8 do'16 (la) fa2 mi4
    fa4 r8 re'16 sib sol8.(la32 sib) la8 sol
    fa la'16 fa re2 do4~

    %48
    do sib2 la4~
    la sol2 fa4~
    fa8 mib re sol~sol fa mi la

    %51
    fa16 re' mi fa sib,4~sib16 sol la sib do, [sib' la sol]\mbreak
    la4 r do4. re8
    \grace fa, mi4. fa8 sol re' do sib

    %54
    la16 sol fa4 sol16 la sib8 re do sib
    la4 r8 re16 sib sol8.(la32 sib) la8 sol
    fa4 r mi16 [do sol' mi] do' sib la sol

    %57
    fa4 r mi16 [do sol' mi] do' sib la sol\mbreak
    fa8 r r4 r8 sol4 fad8
    sol r r4 r8 la4 sold8

    %60
    la r r4 r mi'~\mbreak
    mi re~re8 do~do16[re do sib]
    la[fa do' la] fa' do sib la sol[fa' mi re] mi do sib la

    %63
    sib[sol re' sib] sol' re do sib la[sol' fa mi] fa re do si\mbreak
    do[la mi' do] la' mi re do si[la' sol fad] sol si, sol' sib,
    la[sol' fa! mi] fa la, fa' lab, sol[fa' mi re] do sib la sol

    %66
    fa4 fa'2 mi4\mbreak
    la2. sol4
    do2. sib4~

    %69
    sib la~la8 sol4 fa16 mi\mbreak
    fa4 r mi2~
    mi4 re sol2~

    %72
    sol4 fa sib2~\mbreak
    sib4 la~la8 sol4 fa8
    mib2(re4) r

    %75
    fa2(mi!16) do mi re do[re mib do]
    la8 r r4 r2
    R1

    %78
    r2 sol4. sib8
    \grace re, dod4. re8 mi sib' la sol\mbreak
    fa16 mi re4 mi16 fa sol8 sib la sol

    %81
    fa sib4 la8 sol do4 sib8
    la re4 do sib la16 sol\mbreak
    fad8 [sol16 fad] sol8 r re'4. mib8

    %84
    \grace sol, fad4. fad8 sol4 sol'~
    sol fad sol8. la16 sib [la sol fa]\mbreak
    la4. sib8 \grace re, dod4. dod8
    re2. dod4
    re r8 re la'4~la16 fa sol la\mbreak

    %89
    sib4 r8 sib, fa'4~fa16 re mib fa
    sol4 r8 sol, re'4~re16 sib do re
    mib4~mib16 sol fa mib re4~re16 fa mib re\mbreak

    %92
    do4~do16 mib re do sib4~sib16 sib la sol
    fa4 r8 sib16 sol mi!8.(fa32 sol) fa8 mi
    fa la16 fa re2 dod4\mbreak

    %95
    re8 re'16 sib sol2 fad4
    sol r8 mib'16 do la8.\parentSlur (sib32 do) sib8 la
    sib8 sol'(re sib) sib2\mbreak

    %98
    la8 re(la fa) fa2
    mi!4 r8 fa'16 re si8.(do32 re) do8 sib
    la4 r8 re16 sib sol8.(la32 sib) la8 sol\mbreak

    %101
    fa4 r8 sib16 sol mi8.(fa32 sol) fa8 mib
    re4 r8 sol16 mib do8.(re32 mib) re8 do
    sib4 r r2

    %104
    re'4. mib8 \grace sol, fad4. sol8\mbreak
    la mib' re do sib16 la sol4 fad8
    sol do sib la sol r r4

    %107
    r2 r4 r8 sib
    la sol fa mi! re2\tr\mbreak
    dod4 r r2

    %110
    R1*6
    la'4. sib8 \grace re, dod4. re8\mbreak
    mi sib' la sol fa16 mi re4 mi16 fa

    %118
    sol8 sib la sol fa[la16 sol] fa8 mi16 re
    mi4. fa16 mi fa8 re' do si
    la2. sold4\mbreak

    %121
    la r8 fa'16 re si8.(do32 re) do8 sib
    la la'16 fa re2 do4~
    do\fermata r sib2

    %124
    la8 dod re mi re4 dod\parenthesize \tr
    la1

}

IIvlan = \relative do' {

    R1*2
    r2 re4. fa8
    \grace la, sold4. la8 si fa' mi re\mbreak

    %5
    do16 si la4 si16 do re8 fa mi re
    do fa4 mi8 re sol4 fa8
    mi la4 sol fa mi16 re

    %8
    dod8 re16 dod re8\noBeam r la'4. sib8~\mbreak
    sib re, dod4\tr r8 re16 do sib8[la]
    sol sol' fa16[mi re dod] re mi fa sol la8[la,]

    %11
    si mi re do re16 do si la sold4\tr
    la8 re16 mi fa8[mi] re si4 mi8\mbreak
    mi do4 do8 fa re mi mi

    %14
    mi do4 do8 fa re mi mi
    mi re4 fa8 sib sol la la\mbreak
    la fa4 fa8 sib sol la la

    %17
    la4. sib16 la la4 r8 la
    fa4. sol16 fa fa4 r8 fad\mbreak
    re4. mib16 re re2~

    %20
    re16 fa sol la sib[sol la fa] mi mi fa sol fa[re mi dod]
    re8 re4 sol16 la la4. sib8\mbreak
    la[sol] fa16 re mi la re,[do sib la] sib la sol fa

    %23
    mi8 sol la4~la8 fa4 la8
    mi'2~mi8 r r4\mbreak
    R1

    %26
    la4. sib8 \grace re, dod4. re8
    mi sib' la sol fa16 mi re4 mi16 fa\mbreak
    sol8 sib la sol fa [la16 sol] fa mi re do

    %29
    si8 mi re do re16 do si la sold4\tr
    la8 re16 mi fa8[mi] re si4 mi8\mbreak
    mi4 re~re16 sib do re do8[do]

    %32
    do4 sib~sib16 sol' la sib la8[la]
    la4 sol~sol16 mib fa sol fa8[fa]~\mbreak
    fa re sib2 la4

    %35
    sol r8 do do do r4
    r8 la16 sib do8[re16 do] do4 r8 dod\mbreak
    la la'4 sib16 la la4 r8 la   %%% fin qui OOKK

    %38
    fa4. sol16 (fa) fa2~
    fa8 fa re sol r sol mi la\mbreak
    r la fa sib r sib sol sol

    %41
    fa fa4 la,8 re sib do [do]
    do do r4 do4. re8\mbreak
    \grace fa, mi4. mi8 fa[re'] do sib16 la

    %44
    sol2 la4 do8 do
    do la4 la8 re sib do do\mbreak
    do4 r r do'~

    %47
    do sib2 la4~
    la sol2 fa4~
    fa mib2 re4\parentSlur (

    %50
    re8) sol4 sol16 fa mi8 la,4 la8
    la4 re8 fa sol4 mi8 do\mbreak
    fa,16[do' fa mi] fa8 fa sol[la16 sib] la8 fa

    %53
    sol la sib la sol r r4
    R1
    do,4 r8 la re sib do do

    %56
    do la do do r do mi do
    r la do do r do mi do\mbreak
    do r r4 r8 do la re

    %59
    sol, r r4 r8 re' si mi
    la, r r4 r si'8 sib16 sol\mbreak
    la4. lab16 fa sol8. fa16 mi8[mi]

    %62
    do r r4 r8 do la re
    sol, r r4 r8 re' si mi\mbreak
    la, r r4 r si'8 sib16 sol

    %65
    la4. lab16 fa sol8. fa16 mi8[mi]
    do la4 re8~re16 sib! do re do8[do]
    do la re2 mi4~

    %68
    mi fa2 sol16 la sol fa
    mi[do re mi] fa sol la sib do[re mi re] dod mi la, dod\mbreak
    re8 fa,4 sib8~sib16[sol la sib] la8 la

    %71
    la fa sib4~sib8 dod,16 re mi[re dod si]
    la8 dod re4~re8 dod16 re mi[fa mi re]\mbreak
    dod[la si dod] re mi fa sol la4. la16 sib!

    %74
    do!2(re16) do sib do re[do sib do]
    re2(do4) r
    re,4. mib8 \grace sol, fad4. sol8\mbreak

    %77
    la mib' re do sib16 la sol4 la16 sib
    do8 mib re do sib16[sol sib do] re re mi! mi
    fa8 mi16 sib' sib[la sol fa] sol8 sol fa mi\mbreak

    %80
    re re16 mi re[do sib la] sol8[sol'] fa16 mi re dod
    re4 do!8 fa~fa mib re sol~
    sol fa mib4 re do~\mbreak

    %83
    do16[do sib la] sib la sol sol' la[sib do sib] la do sib sol
    do8 do4 sib16 la sol[fa mib fa] mib re do sib
    la[sib do la] re8 re re4. mi!8

    %86
    mi la sol fa sib r r4
    r8 fa4 sol8~sol mi4 la8
    la4 r16 sol[fa sol] mib do re mib re8[re]\mbreak

    %89
    re4 do~do16 lab' sib do sib8[sib]
    sib4 lab~lab16 fa sol lab sol8[sol]
    sol do do2 sib4~\mbreak

    %92
    sib la! sol~sol16 sol fa mi!
    re8 re4 fa,8 sib sol la la
    la re4 fa8 sib sol la la

    %95
    la sol4 sib,8 mib do re re
    re sol4 sib,8 mib do re re
    re re'\parentSlur (sib sol) mi!2\mbreak

    %98
    fa8 la\parentSlur (fa re) si2
    dod8 la fa'2 mi4~
    mi re2 do!4~

    %101
    do sib2 la4~
    la sol~sol8 r r4
    re'4. mib8 \grace sol, fad4. sol8

    %104
    la16 sib do sib la8 [sib] la[mib'] re do16 sib\mbreak
    do8 do' sib la sol do, sib  la
    sol mib' re do sib16 la sol8 r4

    %107
    r2 r8 sib' la sol
    fa16 mi re4 dod8 la4. sib16 la\mbreak
    la4 r r2

    %110
    R1
    r2 re4. fa8
    \grace la, sold4. la8 si fa' mi re\mbreak

    %113
    do16 si la4 si16 do re8 fa mi re
    do fa4 mi8 re sol4 fa8
    mi la4 sol fa mi16 re

    %116
    dod8[re16 dod] re8 r la'4. sib8~
    sib re, dod4\tr r8 re16 do sib8[la]
    sol sol' fa16[mi re dod] re mi fa sol la8[la,]

    %119
    si mi re do re16 do si la sold4\tr
    la8 [re16 mi] fa8 mi re si4 mi8
    mi do4 do8 fa re mi4~

    %122
    mi8 re4 fa8 sib sol la4~
    la\fermata r sol4. fa8
    mi mi fa sib la4 la

    %125
    fa1

}


IIbcn = \relative do {

    la'4. sib8 \grace re, dod4. re8
    mi sib' la sol fa16 mi re4 mi16 fa
    sol8 sib la sol fa la16 sol fa8[mi16 re]

    %4
    mi8 do si [la] re4 mi\mbreak
    r8 fa16 mi re8[do] si4 mi
    la sol8 do~do sib la re~

    %7
    re do sib4 la sol~
    sol8 fa16 mi fa8[sol]~sol fa mi re\mbreak
    sol4 la r8 sib16 la sol8[fa]
    mi sol la la, re2~
    re8 do si la re4 mi

    %12
    r8 fa16 mi re8[do] si re mi mi,\mbreak
    la do fa mi re si mi mi,
    la do fa mi re si mi mi,

    %15
    la fa' sib [la] sol mi la la,\mbreak
    re fa sib la sol mi la la,
    re re,16 mi fa8[sol] la16[la sib do] sib la sol fa

    %18
    sib8[sib16 do] re8 mib fa16[fa sol la] sol fad mi re\mbreak
    sol8[sol16 la] sib8 do re16[la re mi] re do sib la
    sol2 la

    %21
    re,16[fa sol la] sol fa mi re la'2~\mbreak
    la r
    r re,4. fa8

    %24
    \grace la, sold4. la8 si fa' mi re\mbreak
    do16 si la8~la [si16 do] re8 fa mi re
    dod[re16 mi] fa8 sol~sol fa mi re

    %27
    sol4 la r8 sib!16 la sib[la sol fa]\mbreak
    mi8 sol la la, re2~
    re8 do si la re4 mi

    %30
    r8 fa16 mi re8[do] si re mi mi,\mbreak
    la4 r16 re' do re sib sol la sib do8[do,]
    fa4 r16 sib la sib sol mi fa sol la8[la,]

    %33
    re4 r16 sol fa sol  mib do re mib fa8[fa,]\mbreak
    <<\new CueVoice {\stemUp sib^"manoscritto"[do16 re] mib8 fa16 sol r4}\\{sib,,8[do16 re] mib8 fa16 sol  la8[sib16 do] }>> re8 re,
    sol[la16 sib] do8 re16 mi! fa[la do re] do la sib sol

    %36
    fa8 fa,16 sol la8[sib] do16[do re mi] re dod si la\mbreak
    re8[re16 mi] fa8 sol la16[la sib do] sib la sol fa
    sib8 sib16 do re8[mib] fa16 do fa sol fa [mib re do]

    %39
    sib4 sib, <<{do2
    re mi
    fa8 [la]}\\{\stemUp\shiftOn do,,2
              re mi
              fa8 r}>> re'' do sib sol do4

    %42
    do,4. re8 \grace fa, mi4. fa8\mbreak
    sol re' do sib la16 sol fa4 sol16 la
    sib8 re do sib la sib la sol

    %45
    fa la re do sib sol do do,\mbreak
    fa' la re do sib sol do do,
    re fa sib la sol  mi la la,

    %48
    sib re sol fa mib do fa [fa,]
    sol sib mib re do la re re,
    sol2 la

    %51
    re, mi\mbreak
    fa8 sol la sib~sib la16 sol la8[sib]~
    sib la sol fa sib4 do

    %54
    r8 re16 mi re[do sib la] sol8 sib do do,\mbreak
    fa' la re do sib sol do do,
    fa fa, la fa do'4 r

    %57
    r8 fa, la fa do' r r4\mbreak
    fa8 fa, la fa do' r r4
    r8 sol sib sol re' r r4

    %60
    r8 la do la mi' mi'4 re8\mbreak
    dod re4 do8 si do4 do,8
    fa fa, la fa do' r r4

    %63
    r8 sol sib sol re' r r4\mbreak
    r8 la do la mi' mi'4 re8
    dod re4 do8 si do4 do,8

    %66
    fa,16[do' fa  mi] re do sib la sib[sol la sib] do do, mi do\mbreak
    fa[do' fa mi] re do sib la sol[re' sol fa] mi re do sib
    la[mi' la sol] fa mi re do sib[fa' sib la] sol fa mi re

    %69
    do8 r r4 r r8 la'\mbreak
    re,16[la' re do?] sib la sol fa sol[mi fa sol] la la, dod la
    re,[la' re do!] sib la sol fa mi[sol mi' re] dod si la sol

    %72
    fa[la fa' mi] re do! sib! la sol[re' sol fa] mi re dod si
    la8 r r4 r16 la[si dod] re mi fa sol
    la2(sib16)[re sol, la] sib re sol, la

    %75
    si2(do4) do,~
    do8 sib16 la sib8[do] re4. mib8\mbreak
    \grace sol, fad4. fad8 sol[mib'16 re] do8 sib

    %78
    la4 re sol8 re sib [sol]
    la'4. sib8 \grace re, dod4. dod8\mbreak
    re sib'16 do! sib[la sol fa] mi4 la8 la,

    %81
    re, r r4 r2
    R1\mbreak
    re'4. mib8 \grace sol, fad4. sol8

    %84
    la mib' re do sib16 la sol4 la16 sib
    do8 mib re do sib la sol4~\mbreak
    sol8 fa mi! re sol4 la

    %87
    r8 sib'16[la] sib la sol fa mi8 sol la la,
    re4 r16 mib' re mib do[la sib do] re8 re,\mbreak
    sol4 r16 do sib do lab[fa sol lab] sib8 sib,

    %90
    mib4 r16 lab sol lab fa[re mib fa] sol8 sol,
    do, re16 mib fa8[sol16 la!] sib8[do16 re] mib8 fa16 sol\mbreak
    la!8[sib16 do] re8 re, sol,4 la

    %93
    re8 fa sib la sol mi la la,
    re fa sib la sol mi la la,\mbreak
    re sib' mib re do la re re,

    %96
    sol sib mib re do la re re,
    sol,2~sol8 sib'(la sol)\mbreak
    fa2~fa8 fa,(mi re)

    %99
    dod[dod''16 mi!] fa8 mi re si mi mi,
    fa la re do! sib! sol do do,\mbreak
    re fa sib la sol mi la la,

    %102
    sib re sol fa mib do fa fad
    sol, la sib do re4. mib8
    \grace sol, fad4. sol8 <<{re'2\tasto~\mbreak

    %105
    re2~re~
    re2~re8 mib re do}\\{\stemUp\shiftOn re,2~
                         re~re~
                         re~re8 r r4}>>
    sib'8 sib' la sol fa16 mi! re4.\tasto~

    %108
    re2~re8 mi fa sol\mbreak
    la4. sib8 \grace re, dod4. re8
    mi sib' la sol fa16 mi re4 mi16 fa

    %111
    sol8 sib la sol fa[la16 sol] fa8 mi16 re
    mi8 do si [la] re4 mi\mbreak
    r8 fa16 mi re8[do] si4 mi

    %114
    la sol8 do~do sib la re~
    re do sib4 la sol~
    sol8 fa16 mi fa8[sol]~sol fa mi re\mbreak

    %117
    sol4 la r8 sib16 la sol8[fa]
    mi4 la re,2~
    re8 do si la re4 mi

    %120
    r8 fa16 mi re8[do] si re mi mi,\mbreak
    la do fa [mi] re si mi [re]
    dod[re16 fa] sib!8 la sol mi la sol

    %123
    fad4\fermata r sol, sol'~
    sol8 sol fa! sol la4 la,
    re,1

}

   IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown

    s1*23
    s2 <6\\ 4 3>
    s1*9
    <7>4 <5 7> <9 7> <7 _+>
    s1*4
    <7>4 <6> <5> <6>
    <5> <6> <5> <6>
    s1*7
    <9 7>2 <6 5>
    <9 7> s
    s1*41
    <7 _->4 <7-> <9 7> <7>
    <9 7> <7 _+> s2
    s1*26
    <4+>1

   }

forma = {

    \time 2/2
    \key re\minor
    \tempo 2 = 60
    s1*125
    \bar "|."

}

IIflI = {
    \IIglobal
    %\notypeset
    <<\IIflIn \forma>>
}

IIflII = {
    \IIglobal
    <<\IIflIIn \forma>>
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
    << \IIbcn \forma\IIbfn>>
    \typeset
}
#(set-global-staff-size 17)


\pointAndClickOff

\paper  {

    systems-per-page = #3
    print-first-page-number = ##t
    first-page-number = #2

}

\header {
    title = \markup \smaller "Sinfonia a 2 Travers[ieri], 2 Violini, Viola e Basso [Fk 65]"
    composer = \markup \center-column{"   ""W. F. Bach (1710-1784)"}
}

\markup \huge {[1.] Adagio}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup  \small\center-column{"Trav[ersiere] 1."}
                \set Staff.midiInstrument = #"flute"
                \IflI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \small \center-column{"Trav[ersiere] 2."}
                \set Staff.midiInstrument = #"flute"
                \IflII
            >>
        >>

        \new PianoStaff <<

            \new Staff <<
                \set Staff.instrumentName = \markup  \small\center-column{"Violino 1."}
                \set Staff.midiInstrument = #"violin"
                \IvlI
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup  \small\center-column{"Violino 2."}
                \set Staff.midiInstrument = #"violin"
                \IvlII
            >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup  \small\center-column{"Viola"}
            \set Staff.midiInstrument = #"viola"
            \Ivla
        >>

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.instrumentName = \markup  \small \center-column{"Continuo"}
            \set Staff.midiInstrument = #"contrabass"
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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

\pageBreak

\markup \huge {[2.] Allegro e forte}

\score {

    \new ChoirStaff <<

        \new PianoStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \IIflI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"flute"
                \IIflII
            >>
        >>

        \new PianoStaff <<

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

        \new Staff \with {
            fontSize = #+1
            \override StaffSymbol.staff-space = #(magstep +1)
        } <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>

    \layout {

        indent = 0\cm

        \context {
            \PianoStaff
            \consists #Span_stem_engraver
        }
        \context {
            \Score
            \override RehearsalMark.break-align-symbols = #'(left-edge)
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
            %\override SpacingSpanner.uniform-stretching = ##t
            \override BarLine.hair-thickness = #1.2
            \override StaffGrouper.staff-staff-spacing.padding = #1
            \override StaffGrouper.staff-staff-spacing.basic-distance = #4
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
