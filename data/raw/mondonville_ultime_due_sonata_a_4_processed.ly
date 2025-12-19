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

dolce = _\markup\italic {Doux}

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
      \musicglyph "scripts.prall"}}
mbreak = { }


global = {
    \override Score.MetronomeMark.transparent = ##t
    \override Score.BarNumber.font-size = #0.5
    \override Score.BarNumber.padding = #1.3
    \override TupletBracket.bracket-visibility = ##f
}

IvlIn = \relative do'' {

    re8
    sol4-+ r8 re sol16 sol, si re sol re si sol
    sol,4 r8 re'' sol16 sol, si re sol si re si
    <<
        {
            la(si do4) si8 la16 (si do4) si8

            %4
            la16(si do4) si8\mbreak si-+ [la]
        }\\{
            re,1~
            re2 re4
        }
    >> r
    r8 re si'[si,] r re\dolce la'[\once\stemUp re,,]
    r8 re' si'[si,] r re la'[re,]

    %7
    si16\f(do) la(si) sol(la) fad(sol) mi(la) dod(la) mi'(la,) dod(la)
    fad(la) re(la) fad'(la,) re(la) sol\dolce(la) dod(la) mi'(la,) dod(la)\mbreak
    fad(la) re(la) fad'(la,) re(la) sol\f(la) dod(la) mi'(la,) dod(la)

    %10
    re,(mi fad sol) la(si dod re) dod-+(si) la8 r <<mi'\\la,>>
    <<
        {
            fad'16(sol la4) sol16-+(fad) mi(fad sol4) fad16-+(mi)
            fad(sol la4) sol16-+(fad) mi(fad sol4) fad16-+(mi)
        }\\{
            la,1
            la
        }
    >>
    %13
    fad'16(sol) fad(sol) la8  re dod16-+(si) la8 r sol
    fad-+ mi16(re) mi8.-+ re16 re4 r8 la
    re4-+ r8 la' re16 re, fad la re la fad re

    %16
    re,4 r8 la'' re16 re, fad la re la fad re\mbreak
    <<
        {
            mi(fad sol4) fad8 mi16(fad sol4) fad8
            mi16 fad sol4 fad8 fad-+[mi]
        }\\{
            la,1
            la2 la4
        }
    >> r

    %19
    fad16(si) fad'(si,) la'(si,) fad'(si,) red,(si') fad'(si,) la'(si,) fad'(si,)
    sold(mi') si'(mi,) mi'(mi,) si'(mi,) sold,(mi') si'(mi,) re'!(mi,) si'(mi,)\mbreak
    dod,(la') mi'(la,) la'(la,) mi'(la,) dod,(la') mi'(la,) sol'!(la,) mi'(la,)

    %22
    fad(re') la'(re,) re'(re,) la'(re,) fad,(re') la'(re,) do'!(re,) la'(re,)
    dod,(fad) dod'(fad,) mi'(fad,) dod'(fad,) lad,(fad') dod'(fad,) mi'(fad,) dod'(fad,)\mbreak
    si,(re fad si re fad si lad) si8 re,16(fad,) dod'(fad,) si(fad)

    %25
    lad4_+ r r8 fad' mi16(fad,) re'(fad,)
    dod'(fad,) si(fad) lad(fad) si(fad) dod'(fad,) re'(fad,) mi'(fad,) re'(fad,)
    sol sol'(fad-+ mi) fad8 si16(la) sol-+(fad) mi(re) dod8.-+ si16\mbreak

    %28
    si4 r16 si' fad red si8 si'\prall r16 la! sold fad
    sold8-+ mi r16 mi si sold mi8 mi'\prall r16 re dod si
    dod8-+ la r16 la' mi dod la8 la'\prall r16 sol! fad mi

    %31
    fad8-+ re r16 re la fad re8 re'\prall r16 do! si la\mbreak
    si8_+ sol sol'4~sol16(fad) sol(mi) la4~
    la16(sol) la(fad) si4~si16(la) si(sol) do4~

    %34
    do16(si) do(la) re4~re8 re, do' si
    <<{la(si do si) si[la]}\\{re,2 re4}>> r
    r8 sol,\once\stemDown mi'[do,] r sol' \once\stemDown re'[ sol,,]\mbreak

    %37
    r8 sol'\dolce\once\stemDown mi'[do,] r sol' \once\stemDown re'[ sol,,]
    mi''16\f(fa) re(mi) do(re) si(do) la(re) fad(re) la'(re,) fad(re)
    si(re) sol(re) si'(re,) sol(re) do(re) \parenthesize fad(re) la'(re,) fad(re)

    %40
    si(re) sol(re) si'(re,) sol(re)\mbreak la(re) fad(re) la'(re,) fad(do)
    si(do) re4 do16(si) la_+(sol) fad(mi) <<{s8 la'-+}\\{re,,[re']}>>
    <<
        {
            si'16(do re4) do16-+(si) la(si do4) si16-+(la)

            %43
            si(do re4) do16-+(si) la(si do4) si16-+(la)
        }\\{
            re,1
            re
        }
    >>\mbreak
    si'16(do) si(do) re8 sol, fad16-+(mi) re8 r do
    si_+ la16(sol) la8._+(sol16) sol4. si8_+ la16(sol) la8._+(sol16) sol2

}

IvlIIn = \relative do'' {

    r8
    r16 sol si re sol re si sol sol,4 r8 re''
    sol16 sol, si re sol re si sol sol,8 re''4 sol8
    fad16(sol la4) sol8 fad16(sol la4) sol8\mbreak

    %4
    fad16(sol la4) sol8 sol-+ fad r la-+
    si16(sol) fad(sol) re(sol) si(sol) la(fad) mi(fad) re(fad) la(fad)
    si\dolce(sol) fad(sol) re(sol) si(sol) la(fad) mi(fad) re(fad) la(fad)

    %7
    sol\f(la) fad(sol) mi(fad) re(mi)\mbreak dod(mi) la(mi) dod(mi) la(mi)
    re(fad) la(fad) re(fad) la(fad) dod\dolce(mi) la(mi) dod(mi) la(mi)
    re(fad) la(fad) re(fad) la(fad) dod\f(mi) la(mi) dod(mi) la(mi)

    %10
    fad16(sol la4) sol16-+(fad)\mbreak mi(re) dod-+(si) la8 dod-+
    re16(mi fad4) mi16-+(re) dod(re mi4) re16-+(dod)
    re(mi fad4) mi16-+(re) dod(re mi4) re16-+(dod)

    %13
    re(mi) re(mi) fad8 sol16(fad) mi(re) dod-+(si) la8 dod-+\mbreak
    re8. [mi16 dod8.-+ re16] re4 r8 r
    r16 re, fad la re la fad re re4 r8 la'

    %16
    re16 re, fad la re la fad re re8 la'4 re8
    dod16(re mi4) re8 dod16(re mi4) re8\mbreak

    %18
    dod16(re mi4) re8 re-+ dod r4
    r16 si' la sol fad mi red-+ dod si4 r
    r16 mi re! do? si la sold_+ fad mi4 r

    %21
    r16 la' sol! fad mi re dod-+ si la4 r
    r16 re dod si\mbreak la sol fad mi re4 r
    r16 fad' mi re dod si lad_+ sold fad4 r

    %24
    r16 si' la! sol fad mi re-+ dod re8 fad mi-+ re
    dod4-+ r8 fad mi16(fad) re(fad) dod(fad) si,(fad')\mbreak
    lad,(fad') si,(fad') dod(fad) re(fad) mi(fad) re(fad) dod(fad) si,(fad')

    %27
    lad,4 si2 lad4-+
    si16 si' fad red si8 si'\prall r16 si fad red si8 si'\prall
    r16 mi, si sold mi8 mi'\prall \mbreak r16 mi si sold mi8 mi'\prall

    %30
    r16 la mi dod la8 la'\prall r16 la mi dod la8 la'\prall
    r16 re, la fad re8 re'\prall r16 re la fad re8 re'\prall
    r8 si16(do) re(mi) fa(re) mi(mi,) mi'(mi,) mi'(mi,) mi'(mi,)\mbreak

    %33
    fad'!(fad,) fad'(fad,) fad'(fad,) fad'(fad,) sol'(sol,) sol'(sol,) sol'(sol,) sol'(sol,)
    la'(la,) la'(la,) la'(la,) la'(la,) si'8 do16(si) la8-+ sol
    fad sol la sol sol fad r re

    %36
    mi16(do) si(do) sol(do) mi(do) re(si) la(si) sol(si) re(si)\mbreak
    mi\dolce(do) si(do) sol(do) mi(do) re(si) la(si) sol(si) re(si)
    do\f(re) si(do) la(si) sol(la) fad(la) re(la) fad(la) re(la)

    %39
    sol(si) re(si) sol(si) re(si) fad\dolce(la) re(la) fad(la) re(la)
    sol(si) re(si) sol(si) re(si)\mbreak fad\f(la) re(la) fad(la) re(la)
    sol la si do re mi fad sol fad(mi) re8 r fad

    %42
    sol16(la si4) la16-+(sol) fad16(sol la4) sol16-+(fad)
    sol16(la si4) la16-+(sol) fad16(sol la4) sol16-+(fad)
    sol(la) sol(la) si8 do16(si) la(sol) fad-+(mi) re8 fad-+

    %45
    sol8.[la16 fad8. sol16] sol4 r8 sol8.[la16 fad8. sol16] sol2

}

Ivcn = \relative do {

    r8
    r4 r8 re sol,4 r
    r r8 re' sol, sol' si sol
    re'4 sol, re sol,

    %4
    re' sol, re8 re' fad re
    sol8 sol, r8 sol' re re, r8 re'\dolce
    sol sol, r8 sol' re re, r8 re'\f\mbreak

    %7
    sol la si sol la4 r
    re, r la'\dolce r
    re, r la'\f r

    %10
    re,8 re' fad,[mi16-+ re] la'8 la, dod la
    re,16 re' fad re re, re' dod re la la' dod la la, la' dod la
    re,, re' fad re re, re' dod re la la' dod la la, la' dod la\mbreak

    %13
    re,,8 re' re, sol la la' dod la
    si sol la la, re4 r8 r
    r4 r8 la re,4 r\mbreak

    %16
    r r8 la' re,8 re' fad re
    la'4 re, la re,
    la' re la'8 la la16 sol fad mi

    %19
    red4-+ r\mbreak r16 fad la fad red fad si, red
    mi,4 r r16 si'' re si sold si mi, sold
    la,4 r r16 mi' sol? mi dod mi la, dod\mbreak

    %22
    re,4 r r16 la'' do! la fad la re, fad
    lad,4 r r16 mi' sol mi dod mi lad, dod
    re,4 r8 fad' si si, lad-+ si\mbreak

    %25
    fad' fad' mi re dod-+ si lad si
    fad fad mi re dod_+ si lad si
    mi4 re mi fad

    %28
    si,8 dod red dod si dod red si
    mi fad sold fad mi fad sold mi
    la, si dod si la si dod la\mbreak

    %31
    re mi fad mi re mi fad re
    sol, sol'16 la si8 sol do,8 do'~do16(si) do(la)
    re,8 re'~re16(do) re(si)\mbreak \clef tenor \key sol\major mi,8 mi'~mi16(re) mi(do)

    %34
    fad,8 fad'~fad16(mi) fad(re) sol,8 sol' fad-+ sol
    re sol, fad_+ sol re re' si-+ sol\mbreak
    \clef bass\key sol\major do8 do, r do' sol sol, r sol'\dolce

    %37
    do8 do, r do' sol sol, r sol'\f
    do,8 re mi do re4 r
    sol r re\dolce r

    %40
    sol r re\f r
    sol,8 sol' si, la16_+ sol re8 re' fad re
    sol,16 sol' si sol sol, sol' fad sol\mbreak re re' fad re re, re' fad re

    %43
    sol,, sol' si sol sol, sol' fad sol re re' fad re re, re' fad re\mbreak
    sol,8 sol, sol' do, re re fad re
    mi do re re, sol4 r8  mi' do re re, sol2






}

Ibcn = \relative do {

    r8
    r4 r8 re sol,4 r
    r r8 re' sol, sol' si sol
    re'4 sol, re sol,

    %4
    re' sol, re8 re' fad re
    sol4 r8 sol re4 r8 re\dolce
    sol4 r8 sol re4 r8 re\f\mbreak

    %7
    sol la si sol la4 r
    re, r la'\dolce r
    re, r la'\f r

    %10
    re,8 re' fad,[mi16-+ re] la'8 la, dod la
    re,4 re la' la
    re, re la' la

    %13
    re,8 re' re, sol la la' dod la\mbreak
    si sol la la, re4 r8 r
    re4 r8 la re,4 r

    %16
    r r8 la' re,8 re' fad re
    la'4 re, la re,
    la' re la'8 la la16 sol fad mi

    %19
    red4-+ r r8 fad red[si]
    mi,4 r\mbreak r8 si'' sold[mi]
    la,4 r r8 mi' dod[la]

    %22
    re,4 r r8 la'' fad[re]
    lad4 r r8 mi' dod[lad]
    re,4 r8 re' si' si, lad-+ si

    %25
    fad' fad' mi re dod-+ si lad si\mbreak
    fad fad mi re dod_+ si lad si
    mi4 re mi fad

    %28
    si,8 dod red dod si dod red si
    mi fad sold fad mi fad sold mi
    la, si dod si la si dod la\mbreak

    %31
    re mi fad mi re mi fad re
    sol, sol'16 la si8 sol do,4 r
    re r mi r

    %34
    fad r sol8\clef tenor \key sol\major sol' fad-+ sol
    re sol, fad-+ sol \clef bass \key sol\major re re' si-+ sol
    do4 r8 do sol4 r8 sol\dolce

    %37
    do4 r8 do sol4 r8 sol\f
    do,8 re mi do re4 r
    sol r re\dolce r

    %40
    sol r re\f r
    sol,8 sol' si, la16_+ sol re8 re' fad re
    sol,4 sol re' re\mbreak

    %43
    sol, sol re' re
    sol8 sol, sol' do, re re fad re
    mi do re re, sol4 r8  mi' do re re, sol2

}

Ibfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key sol\major
    \tempo 2 = 55
    \partial 8 s8
    s1*13
    s2 s4 s8\break
    \repeat volta 2 {
        s8
        s1*30
    }
    \alternative {{\set Score.measureLength = #(ly:make-moment 7 8) s2 s4 s8}{\set Score.measureLength = #(ly:make-moment 4 4) s1}}
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

Ivc = {
    \global
    \clef bass
    <<\Ivcn \forma>>

}

Ibc = {
    \global
    \clef bass
    <<\Ibcn \forma \Ibfn>>

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

   sol'4 fad-+
   sol sol, la fad_+
   sol re la' sib
   do re re, sol

   %4
   la2_+ sol'4 fad-+
   sol sol, la fad_+\mbreak
   sol re' mib4. \appoggiatura re16 do8

   %7
   re4(do8-+) sib la4._+ sol8
   sol2  sol re'4 do-+  %% fine rondeau
   sib re do-+ sib

   %10
   la-+ sol do re
   fad,_+ sol la sib\mbreak
   la2-+ re4 fa

   %13
   mi la la, re
   dod-+ \appoggiatura si?16 la4 sol' \appoggiatura fa16 mi4
   \appoggiatura re16 dod4-+ re re4.-+(dod8)

   %16
   re2 sol4 fad-+
   sol sol, la fad_+
   sol re la' sib

   %19
   do re re, sol
   la2_+ sol'4 fad-+
   sol sol, la fad-+\mbreak

   %22
   sol re' mib4. \appoggiatura re16 do8
   re4(do8-+) sib la4._+ sol8
   sol2 sib4 fa

   %25
   sib2 \appoggiatura {do16[re]} mib4 re\mbreak
   do2-+ fa4 \appoggiatura mib16 re4
   \appoggiatura do16 sib4 mib mib(re8-+) do

   %28
   do2-+ do4 re-+
   mib \appoggiatura re16 do4 re mib-+
   fa sib, mib4. \appoggiatura re16 do8

   %31
   re4 mib do4.-+ sib8\mbreak
   sib2 re4.(mib8)
   mib2 mi4.(fa8)

   %34
   fa2 fad4 sol-+
   la re do-+ sib
   la2-+ sol4 fad-+

   %37
   sol sol, la fad_+
   sol re la' sib
   do re re, sol

   %40
   la2_+ sol'4 fad-+
   sol sol, la fad-+\mbreak
   sol re' mib4. \appoggiatura re16 do8

   %43
   re4(do8-+) sib la4._+ sol8
   sol2

}

IIvlIIn = \relative do'' {

   sib,16 re sol sib do, [mib fad la]
   re, sol sib re mib, [sol la do] re, fad la do do, [re fad la]
   sib, re sol sib sol, [sib re sol]\mbreak do, mib sol la sib, [re mib sol]
   la, do mib fad sol, [sib re sol] la, do re fad sol, [sib re sol]

   %4
   fad re fad la re [la fad re] sib re sol sib do, [mib fad la]\mbreak
   re, sol sib re mib, [sol la do] re, fad la do do, [re fad la]
   sib, re sol sib sol, [sib re sol] la, do mib fad do [mib fad la]

   %7
   sib, re sol sib do, [mib sol la]\mbreak re, re fad la re [la re, re']
   sib sol sib re sol [re sib sol] sib2 sib,16 re sol sib la,[do re fad]  %% Fine rondeau
   sol, sib mib sol sib,[re sol sib] la, do mib sol sol,[sib do mib]\mbreak  %% fin qui

   %10
   re fad la re sol,,[sib re sol] la, do mib sol sib,[re mib sol]
   la, do mib fad sol,[sib re sol] la, do re fad sol,[sib re sol]
   re re fad la re[la fad re]\mbreak la re fa la re, [fa la re]

   %13
   dod, mi? sol la re, [fa la re] sol,, la dod mi re[fa la re]
   la[la dod mi] la mi dod la dod, mi sol sib dod,[mi sol sib]\mbreak
   sol, la dod mi re[fa la re] la, dod mi la la,[dod mi la]  %% fin qui battuta 15

   %16
   re, re fad la re[la fad re] sib re sol sib do, [mib fad la]
   re, sol sib re mib, [sol la do] re, fad la do do, [re fad la]
   sib, re sol sib sol, [sib re sol]\mbreak do, mib sol la sib, [re mib sol]

   %19
   la, do mib fad sol, [sib re sol] la, do re fad sol, [sib re sol]
   fad re fad la re [la fad re] sib re sol sib do, [mib fad la]\mbreak
   re, sol sib re mib, [sol la do] re, fad la do do, [re fad la]

   %22
   sib, re sol sib sol, [sib re sol] la, do mib fad do [mib fad la]
   sib, re sol sib do, [mib sol la]\mbreak re, re fad la re [la re, re']
   sib2  sib,16 re fa! sib la,[do mib fa]

   %25
   sib, re fa sib sol, [sib mib sol]\mbreak la, do mib sol sib,[re fa sib]
   la, do fa la do,[fa la do] sib, re fa lab sib,[fa' sib re]
   re, sol sib re mib,[fa la! do] do, fa sib do sib,[re fa sib]\mbreak

   %28
   la, do fa la fa'[do la fa] lab, do fa lab lab,[si re fa]
   sol, do mib sol la,! [do fa la] sib,? re sol sib sib,[mib sol sib]
   sib, re fa sib sol,[sib mib sol]\mbreak la, do mib fa la,[do mib la]

   %31
   sib, re fa sib do,[mib sol sib] la, do fa la fa[la do mib]
   re fa, sib re fa[re sib fa] sol, si re fa si,[re fa sol]\mbreak
   sol, do mib sol sib,[do mib sol] la, dod mi sol dod,[mi sol la]

   %34
   la, fa' la re la,[fa' la re] mib, fad la do re,[sol sib re]
   do, re fad la sib,[re sol sib]\mbreak la, do re fad sib,[re sol sib]
   re, re fad la  re [la fad re] sib re sol sib do, [mib fad la]

   %37
   re, sol sib re mib, [sol la do] re, fad la do do, [re fad la]
   sib, re sol sib sol, [sib re sol]\mbreak do, mib sol la sib, [re mib sol]
   la, do mib fad sol, [sib re sol] la, do re fad sol, [sib re sol]

   %40
   fad re fad la re [la fad re] sib re sol sib do, [mib fad la]\mbreak
   re, sol sib re mib, [sol la do] re, fad la do do, [re fad la]
   sib, re sol sib sol, [sib re sol] la, do mib fad do [mib fad la]

   %43
   sib, re sol sib do, [mib sol la]\mbreak re, re fad la re [la re, re']
   sib2

}

IIvcn = \relative do {

   sib'4 do
   re mib re do
   sib-+ sol do sib
   la sol fad sol

   %4
   fad2_+ sib4 do
   re mib re do
   sib-+ sol la fad_+

   %7
   sol la8 sol fad4._+ sol8
   sol2 sol sib4 la %% fine rondeau OOKK
   sol sib la sol

   %10
   fad_+ sol la sib
   la sol fad sol
   fad2_+ la4 re

   %13
   dod re sol, fa?\mbreak
   mi2_+ mi'4 sib
   sol fa mi4._+ re8

   %16
   re2 sib'4 do
   re mib re do
   sib-+ sol do sib

   %19
   la sol fad sol
   fad2_+ sib4 do
   re mib re do

   %22
   sib-+ sol la fad_+
   sol la8 sol fad4._+ sol8
   sol2 sib4 la

   %25
   sib sol la sib
   la_+  fa re' fa~\mbreak
   fa do~do sib

   %28
   la2-+ lab4 lab
   sol la! sib sib
   sib sol la la

   %31
   sib do la4.-+ sib8\mbreak
   sib2 sol~
   sol4 sib! la2~

   %34
   la2. re4
   do sib la sol
   fad2_+ sib4 do

   %37
   re mib re do
   sib-+ sol do sib
   la sol fad sol

   %40
   fad2_+ sib4 do
   re mib re do
   sib-+ sol la fad_+

   %43
   sol la8 sol fad4._+ sol8
   sol2

}

IIbcn = \relative do {

   sol'4 la
   sib do fad, re
   sol sol, mib' re
   do sib la sol

   %4
   re'2 sol4 la
   sib do fad, re
   sol sol, do la\mbreak

   %7
   sib do re2
   sol,2 sol sol'4 re  %% fine rondeau
   mib sib do2

   %10
   re4 sol, mib' re
   do sib la sol
   re'2 fa!4 re

   %13 OOKK
   sol fa mi re
   la2 sib'4 sol\mbreak
   mi re la2

   %16
   re, sol'4 la
   sib do fad, re
   sol sol, mib' re

   %19
   do sib la sol
   re'2 sol4 la
   sib do fad, re

   %22
   sol sol, do la\mbreak
   sib do re2
   sol,2 sib4 do

   %25
   re mib do sib
   fa' fa, lab' lab
   sol la! sib sib,

   %28
   fa'2 fa4 fa
   do2 sol'4 sol
   re mib do fa\mbreak

   %31
   sib, mib fa2
   sib, si4 sol
   do2 dod4 la

   %34
   re re' do? sib?
   la sol fad-+ sol
   re2 sol4 la

   %37
   sib do fad, re
   sol sol, mib' re
   do sib la sol

   %40
   re'2 sol4 la
   sib do fad, re
   sol sol, do la\mbreak

   %43
   sib do re2
   sol,2

}

IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \key fa\major
    \tempo 2 = 52
    \repeat volta 2 {\partial 2 s2
    s1*7}
    \alternative {{ s2 }{s}} \break
    \mark\markup\italic\small "[Ier Couplet]"
    s
    \set Score.currentBarNumber = #9
    s1*7
    s2%\break
  \once \override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup\italic \small"[Reprise]"
    s
    s1*7
    s2%\break
  \once \override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup\italic \small"[2e Couplet]"
    s
    s1*11
    s2%\break
  \once \override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup\italic \small"[Reprise]"
    s
    s1*7
    s2
    \bar "|."

}

IIvlI = {
    \global
    <<\IIvlIn \forma>>

}

IIvlII = {
    \global
    <<\IIvlIIn \forma>>

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

IIIvlIn = \relative do'' {

    re4 sol, sol'8 la si4
    \appoggiatura si16 la2.\prall si4-+
    do8(re,) si'(re,) la'(sol) fad(mi)

    %4
    re(do) si-+(la) sol4 sol,
    re''\dolce sol, sol'8 la si4
    \appoggiatura si16 la2.\prall si4-+

    %7
    do8(re,) si'(re,)\mbreak la'(re,) sol(re)
    fad sol la4 re, r
    la8\f sol fad4 si sol

    %10
    la8\dolce sol fad4 si sol
    la4 la,\f re re'
    dod8 re mi4 la, r

    %13
    r re la' re,
    re8-+ (dod) re4 si sol\mbreak
    r4 mi' si' mi,

    %16
    mi8-+ (re) mi4 dod la
    r fad8(la) mi(sol) re(fad)
    dod re mi4 la, r

    %19
    r mi'8\dolce(sol) re(fad) dod(mi)
    re fad la4 re, r
    r la'8\f(fad)sol(mi) fad(re)\mbreak

    %22
    mi(fad) sol(la) dod(la) mi'(sol,)
    fad(sol) la(fad) re'(la) fad'(re)
    dod(re) mi(re) dod(re) mi4\upl

    %25
    dod,8(mi la dod) mi4(re8-+) dod
    re4 re, fad mi-+
    re2 re

    %28 OOKK
    la'4 re, re'8 mi fad4
    \appoggiatura fad16 mi2.\prall fad4-+
    sol8(la,) fad'(la,) mi'(re) dod(si)

    %31
    la(sol) fad_+(mi) re4 re'\prall\mbreak
    la4\dolce re, re'8 mi fad4
    \appoggiatura fad16 mi2.\prall fad4-+

    %34
    sol8(la,) fad'(la,) mi'(la,) re(la)
    dod re mi4 la, r
    r2 r4 la\f \mbreak

    %37
    la8_+(sold) la4 la red,_+
    mi mi' sol,! fad_+
    mi8 sol si4 mi, r

    %40
    r2 r4 sol\dolce
    sol8_+(fad) sol4 sol dod,_+\mbreak
    re re' fad, mi_+

    %43
    re8 fad la4 re, r
    r si'\f fad' si,
    si8-+(lad) si4 sol mi

    %46
    r  dod'\dolce sol' dod,\mbreak
    dod8-+(si) dod4 fad, dod'
    fad fad, re' dod-+

    %49
    si2 si,
    re'4\f sol, sol'8 la si4
    \appoggiatura si16 la2.\prall si4-+

    %52
    do8(re,) si'(re,) la'(sol) fad(mi)
    re(do) si-+(la) sol4 sol,
    re''\dolce sol, sol'8 la si4

    %55
    \appoggiatura si16 la2.\prall si4-+
    do8(re,) si'(re,)\mbreak la'(re,) sol(re)
    fad sol la4 re, r

    %58
    r sol,\f re' sol,
    sol8_+(fad) sol4 mi do\mbreak
    r la' mi' la,

    %61
    la8_+ (sol) la4 fad re
    r si'8(re) la(do) sol(si)
    fad sol la4 re, r\mbreak

    %64
    r la'8\dolce(do) sol(si) fad(la)
    sol si re4 sol, r
    r re'8\f(si) do(la) si(sol)

    %67
    la(si) do(re) fad(re) la'(do,)\mbreak
    si(do) re(si) sol'(re) si'(sol)
    fad(sol) la(sol) fad(sol) la4\upl

    %70
    fad,8(la re fad) la4(sol8-+) fad
    sol4 sol, si la_+
    sol2 sol,

}

IIIvlIIn = \relative do'' {

    si8 do re4 re, sol
    \appoggiatura sol16 fad2._+ sol4
    la si do la

    %4
    si8_+(la) sol(fad) sol(la) si(do)
    si\dolce do re4 re, sol
    \appoggiatura sol16 fad2._+ sol4

    %7
    la si do si
    la8(sol) fad-+(mi) re4 re'\f
    re8-+(dod) re4 re8-+(dod) re4

    %10
    re8-+\dolce(dod) re4 re8-+(dod) re4
    sol2\f fad-+
    mi8(re) dod(si) la4 la'

    %13
    fad8 sol la4 re, fad
    si,2 r4 si'\mbreak
    sol8 la si4 mi, sol

    %16
    dod,2-+ \appoggiatura si16 la2
    r4 la8 (la,) sol'(la,) fad'(la,)
    mi'2 r

    %19
    r4 sol8\dolce la, fad' la, mi' la,
    re2 r
    r4 fad8\f la, mi' la, re la

    %22
    dod re mi4 mi la\mbreak
    re,8 mi fad4 fad la
    mi8 fad sol4 sol sol'

    %25
    sol2. fad8-+(mi)
    fad sol la4 la, dod-+
    re2 re,

    %28
    fad'8 sol la4 la, re
    \appoggiatura re16 dod2.-+ re4
    mi fad sol mi

    %31
    mi8-+(re) dod(si) \mbreak re8(mi) fad(sol)
    fad8\dolce sol la4 la, re
    \appoggiatura re16 dod2.-+ re4

    %34
    mi fad sol fad
    mi8(re) dod-+(si) la4 la'\f
    la8-+(sold) la4 la8-+(sold) la4

    %37
    si, red fad la
    sol8 la si4 si, red-+\mbreak
    mi2 mi,4 sol'\dolce

    %40
    sol8-+(fad) sol4  sol8-+(fad) sol4
    la, dod mi sol
    fad8 sol la4 la, dod-+

    %43
    re2 re,4 fad'\f
    re8 mi fad4 si, re
    sol,2 r4 sol'\dolce

    %46
    mi8 fad sol4 dod, mi
    lad,_+ fad si mi\mbreak
    re8 mi fad4 fad, lad_+

    %49
    si2 si,
    si'8\f do? re4 re, sol
    \appoggiatura sol16 fad2._+ sol4

    %52
    la si do la
    si8-+(la) sol(fad) sol(la) si(do)
    si8\dolce do? re4 re, sol

    %55
    \appoggiatura sol16 fad2._+ sol4
    la si do si\mbreak
    la8(sol) fad(mi) re4 re'\f

    %58
    si8 do re4 sol, si
    mi,2 r4 mi'
    do8 re mi4 la, do

    %61
    fad,2-+ \appoggiatura mi16 re2
    r4 re'8(re,) do'(re,) si'(re,)
    la'2 r

    %64
    r4 do8\dolce(re,) si'(re,) la'(re,)\mbreak
    sol2 r
    r4 si8\f(re,) la'(re,) sol(re)

    %67
    fad sol la4 la re
    sol,8 la si4 si re
    la8 si do4 do do'

    %70
    do,2. si8-+ (la)
    si do re4 re, fad_+
    sol2 sol,

}

IIIvcn = \relative do {

    sol'8 la si4 si, do
    re re' do8(si) la(sol)
    fad re' sol, re' fad, re' re, re'\mbreak

    %4
    sol,4 re si sol
    sol'8\dolce la si4 si, do
    re re' do8(si) la(sol)

    %7
    fad re' sol, re' fad, re' sol, re'\mbreak
    re,4 la fad re
    fad'8\f re' fad, re' sol, mi' sol, mi'

    %10
    fad,\dolce re' fad, re' sol, mi' sol, mi'
    mi,\f dod' mi, dod' re, re' re, re'\mbreak
    la4 mi dod la

    %13
    \clef tenor\key sol\major re8 re' fad re fad, re' re, re'
    sol, sol' re si sol si re sol
    mi, mi' sol mi sol, mi' mi, mi'

    %16
    \clef bass \key sol\major la,4 sol8-+(fad) mi(re) dod(si)
    la2 r
    r8 la' sol la mi la dod, la'

    %19
    la,2 r
    r8 re\dolce dod re la re fad, re'\mbreak
    re,2 r

    %22
    la''\f la
    la la
    la la

    %25
    la,8 la' mi la dod, la' la, la'
    re, mi fad sol la4 la,
    re2 re,

    %28
    \clef tenor \key sol\major re''8 mi fad4 fad, sol\mbreak
    la4 la' sol8(fad) mi(re)
    dod la' re, la' dod, la' la, la'

    %31
    re,4 la fad re
    re'8\dolce mi fad4 fad, sol\mbreak
    la4 la' sol8 (fad) mi (re)

    %34
    dod la' re, la' dod, la' re, la'
    \clef bass\key sol\major la,4 mi dod la'\f\mbreak
    fad8 la do la fad do' mi, do'

    %37
    red, si' la si red, si' si, si'
    mi, fad sol la si4 si,
    mi8 si sol si mi,4 r\mbreak

    %40
    mi'8\dolce sol si sol mi si' re, si'
    dod, la' sol la dod, la' la, la'
    re, mi fad sol la4 la,

    %43
    re la fad re\mbreak
    si'8\f si' re si re, si' si, si'
    mi, mi' si sol mi sol si mi

    %46
    dod, dod'\dolce mi dod mi, dod' dod, dod'\mbreak
    fad, dod' mi, dod' re, fad lad, fad'
    si, dod re mi fad4 fad,

    %49
    si2 si,
    sol''8\f  la si4 si, do
    re re' do8 (si) la (sol)

    %52
    fad re' sol, re' fad, re' re, re'
    sol,4 re si sol
    sol'8\dolce  la si4 si, do\mbreak

    %55
    re re' do8 (si) la (sol)
    fad re' sol, re' fad, re' sol, re'
    re,4 la fad re

    %58
    sol8 sol'\f si sol si, sol' sol, sol'\mbreak
    do, do' sol mi do mi sol do
    la, la' do la do, la' la, la'

    %61
    re,4 dod8_+(si) la(sol) fad(mi)
    re2 r\mbreak
    r8 re'' do re la re fad, re'

    %64
    re,2 r
    r8 sol\dolce fad sol re sol si, sol'
    sol,2 r

    %67
    re'\f re
    re re
    re re

    %70
    re,8 re' la re fad, re' re, re'
    sol, la si do re4 re,
    sol2 sol

}

IIIbcn = \relative do {

    sol'8 la si4 si, do
    re re' do8(si) la(sol)
    fad4 sol fad re

    %4
    sol re si sol
    sol'8\dolce la si4 si, do
    re re' do8(si) la(sol)

    %7
    fad4 sol fad sol
    re la fad re
    fad'\f fad sol sol

    %10
    fad\dolce fad sol sol
    mi\f mi re re
    la' mi dod la

    %13
    re r fad re\mbreak
    sol r sol si
    mi, r sol mi

    %16
    la sol8-+(fad) mi(re) dod(si)
    la2 r
    r4 la' mi dod

    %19
    la2 r
    r4 re\dolce la fad\mbreak
    re2 r

    %22
    la''\f la
    la la
    la la

    %25
    la,4 mi' dod la
    re8 mi fad sol la4 la,
    re2 re,

    %28
    \clef tenor \key sol\major re''8 mi fad4 fad, sol\mbreak
    la4 la' sol8(fad) mi(re)
    dod4 re dod la

    %31
    re la fad re
    re'8\dolce mi fad4 fad, sol\mbreak
    la4 la' sol8 (fad) mi (re)

    %34
    \clef bass \key sol\major dod4 re dod re
    la mi\mbreak dod la'\f
    fad8 la do? la fad4 mi

    %37
    red8 si' la si red,4 si
    mi8 fad sol la si4 si,
    mi8 si sol si mi,4 r

    %40
    mi'8\dolce sol si sol mi4 re\mbreak
    dod8 la' sol la dod,4 la
    re8 mi fad sol la4 la,

    %43
    re la fad re
    si'\f r re si
    mi r mi sol

    %46
    dod, r mi\dolce dod
    fad mi re lad\mbreak
    si8 dod re mi fad4 fad,

    %49
    si2 si,
    sol''8\f  la si4 si, do
    re re' do8 (si) la (sol)

    %52
    fad4 sol fad re
    sol re si sol
    sol'8\dolce  la si4 si, do

    %55
    re re' do8 (si) la (sol)
    fad4 sol fad sol
    re la fad re

    %58
    sol\f r si sol
    do r do mi
    la, r do la\mbreak

    %61
    re do8_+(si) la(sol) fad(mi)
    re2 r
    r4 re'' la fad

    %64
    re2 r
    r4 sol\dolce re si
    sol2 r

    %67
    re'\f re
    re re\mbreak
    re re

    %70
    re,4 la' fad re
    sol8 la si do re4 re,
    sol2 sol

}

IIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/2
    \override Staff.TimeSignature.style = #'single-digit
    \key sol\major
    \tempo 1 = 50
    s1*27
    \bar":..:"\break
    s1*45
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

IIIvc = {
    \global
    \clef bass
    <<\IIIvcn \forma>>

}

IIIbc = {
    \global
    \clef bass
    <<\IIIbcn \forma \IIIbfn>>

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

IVobn = \relative do'' {

    la4 mi la r16 mi fad sold
    la sold la sold la8 mi la4 r8 la
    sold8_+ fad16 mi re'8 mi dod4-+ si8 la

    %4
    sold8_+ fad16 mi re'8 mi \mbreak dod4-+ si8 dod16 (re)
    mi (dod) si-+ (la) fad'8 la, \appoggiatura la16 sold4-+ r8 mi'
    mi1-+~

    %7
    mi1-+~
    mi1-+~
    mi16-+ mi,(fad mi) dod'\upl mi,(fad mi) re'\upl mi,(fad mi) dod'\upl mi,(fad mi)\mbreak

    %10
    si'16 sold la si dod8 si la8.[si16 sold8.-+ la16]
    la4 r fad'8. mi16 re dod si la
    sold2-+ re'4.(dod16-+) si

    %13
    mi,8 la16 si sold8._+ la16 la4\fermata r
    R1*11
    mi'4 si mi, r16 si' dod red

    %26
    mi (red) mi (red)mi8 si mi,4 r8 mi'
    red-+ dod16 si la'8 si sold4-+ fad8 mi\mbreak
    red-+ dod16 si la'8 si sold4-+ fad8 sold16(la)

    %29
    si(sold) fad-+ (mi) red8 mi fad4-+ r8 si~
    si1-+~
    si1-+~

    %32
    si1-+~\dolce
    si16 sib,16(dod si) sold'\upl si,(dod si)\mbreak la'\upl si,(dod si) sold'\upl si,(dod si)
    fad' red mi fad sold8 fad mi8.[fad16 red8.-+ mi16]

    %35
    mi4 r r2
    R1*13\mbreak
    fad4 dod fad, r16 fad sold lad

    %50
    si lad si lad si8 fad si4 r
    mi si mi, r16 mi fad sold\mbreak
    la sold la sold la8 mi la4 r

    %53
    la'1
    si
    dod

    %56
    re
    mi2. r8 mi,
    mi1-+~

    %59
    mi1-+~
    mi1-+~\mbreak
    mi1-+

    %62
    mi16\upl dod(si-+ la) mi'\upl dod(si-+la) fad'8. mi16 re dod si la
    sold8_+ fad16 mi la8 re dod8.-+[si16 si8.-+ la16]

}

IVvlIn = \relative do'' {

    la4 mi  dod16_+(si) la8 r16 mi' fad sold
    la(sold) la(sold) la8 mi dod16_+(si) la8 r la'
    sold8_+ fad16 mi re'8 mi dod4-+ si8 la

    %4
    sold8_+ fad16 mi re'8 mi \mbreak dod4-+ si8 dod16 (re)
    mi (dod) si-+ (la) fad'8 la, \appoggiatura la16 sold4-+ r
    <<{mi'8-2 s mi s  mi4. re16 dod

       %7
       re8 s re s re4. dod16 si
       dod8 s dod s dod4.}\\{dod8-4 mi, dod'[mi,] dod'4. si16 la
                                si8 mi, si'[mi,] si'4. la16 sold
                                la8 la, la'[la,] la'4.}>> re16 dod
    si\upl mi,(fad mi) dod'\upl mi,(fad mi) re'\upl mi,(fad mi) dod'\upl mi, (fad mi)

    %10
    si' sold la si dod (mi,) si' (mi,)\mbreak mi'(mi,) la(si) sold8._+ la16
    la4\upl r fad'8. mi16 re dod si la
    sold(si mi sold) si (mi,) mi' (mi,) re4. (dod16-+) si

    %13
    mi,8 la16 si sold8._+ la16 la4\fermata r
    la'4-+ la-+ la16 mi dod(mi la) dod mi dod
    si4-+ si-+ si16\prall mi, sold,(mi' si') mi, re' si\mbreak

    %16
    dod4-+ dod-+ dod16 la la,(la' dod) mi la, dod
    si8 mi, r si' dod16(la) mi(la) dod(la) mi'(la,)
    si\upl mi,(red mi) si'(mi,) re'(mi,) dod'(la) mi(la) dod(la) mi'(la,)

    %19
    si8 mi, r si'-+ \appoggiatura si16 dod8. si16 la sold fad mi
    red-+ dod si8 r si' \terzine \tuplet 3/2 { si16 la si si,[la si] } \once\stemUp si,8 si''\mbreak
    si-+ la r la \tuplet 3/2 { la16 sold la si,[la si] } \once\stemUp si,8  la''

    %22
    la-+ sold r si dod16 (mi,) si'(mi,) dod'(mi,) si' (mi,)
    dod'(mi,) si' (mi,) dod'(mi,) red'(si) mi(red) dod(si) la(sold) fad(mi)
    red si dod red mi fad sold la si8 mi-+ sold,8.-+ fad32(mi)\mbreak

    %25
    mi4 si sold16_+(fad) mi8 r16 si' dod red
    mi (red) mi (red) mi8 si sold16_+(fad) mi8 r mi'
    red-+ dod16 si la'8 si sold4-+ fad8 mi\mbreak

    %28
    red-+ dod16 si la'8 si sold4-+ fad8 sold16(la)
    si(sold) fad (mi) red8-+ mi fad4-+ r\mbreak
    <<{si8-2 s si s si4. la16 sold

       %31
       la8 s la s la4. sold16 fad
       sold8 s sold s sold4.}\\{sold8-4 si, sold' si, sold'4. fad16 mi
                                fad8 si, fad' si, fad'4. mi16 red
                                mi8 mi, mi' mi, mi'4.}>> la16 sold
    fad\upl si,(dod si) sold'\upl si,(dod si) la'\upl si,(dod si) sold'\upl si,(dod si)

    %34
    fad' red mi fad sold(si,) fad'(si,)\mbreak si' (si,) mi(fad) red8.-+ mi16
    <<mi4\\mi>> r r16 mi si sold mi4~
    mi16 mi' si sold mi sold si mi red si' fad red si4~

    %37
    si16 si' fad red si red fad red mi mi si sold mi4~
    mi16 mi' si sold mi sold si mi mi8-+ red r la
    la la, r fad' \once\stemUp fad sol' r sol,

    %40
    la la, r fad' \once\stemUp mi sol' r si,
    si si, r sold' \once\stemUp  fad la' r fad,
    si si, r sold' \once\stemUp  fad la' r4

    %43
    fad si, sold16_+(fad) mi8 r4
    mi' la, fad16_+(mi) re8 r4\mbreak
    re'4 sold, mid16_+ red dod8 r4

    %46
    dod' fad, sold16(la) si4 dod16(si)
    la(si) dod4 re16(dod) si(dod) re4 dod16(si)
    dod(red) mid(fad) sold8 si mid, fad16 sold mid8.-+ fad16

    %49
    fad dod dod8-+ mid,16 dod' dod8_+\mbreak fad,16(dod') dod8_+ fad16(dod) mi!(dod)
    red fad, fad8_+ red16(fad) dod(fad) si, fad' fad8_+ si16(dod) la!(si)
    sold si si8_+ fad16 si si8_+ mi,16(fad sold la) si(dod re! mi)

    %52
    dod mi mi8-+ dod16(mi) si(mi) la, mi dod (mi) la dod mi8~\mbreak
    mi16 re dod si la sol fad mi fad(re) la'(fad) re'(la) fad'8~
    fad16 mi re dod si la sold fad  sold(mi) si'(sold) mi'(si) sold'8~

    %55
    sold16 fad mi re dod si la sold la(fad) dod'(la) fad'(dod) la'8~\mbreak
    la16 sold fad mi re dod si la si(sold) mi'(si) sold'(mi) si'8~
    si16 la sold fad mi re dod  si dod-+(si) la8 r <<{mi'-2

                                                       %58
                                                       mi8.-+ (re16) r8 re re8.-+ (dod16) r8 dod
                                                       si dod re dod dod-+ [si] }\\{dod8
                                                                                dod8.-+(si16) r8 si si8.-+ (la16) r8 la
                                                                                sold la sold-4 la la [mi]}>> r4\mbreak
    r16 mi' si sold mi4 r16 mi' dod mi la,8 mi'

    %61
    mi, mi' mi, mi' mi,16 mi' si sold mi8 mi'
    la16\upl dod,(si-+ la) mi'\upl dod(si-+ la) fad'8. mi16 re dod si la
    sold8_+ fad16 mi la8 re dod8.-+[si16 si8.-+ la16]

}

IVvlIIn = \relative do'' {

     la4 mi  dod16_+(si) la8 r16 mi' fad sold
    la(sold) la(sold) la8 mi dod16_+(si) la8 r la'
    sold8_+ fad16 mi re'8 mi dod4-+ si8 la

    %4
    sold8_+ fad16 mi re'8 mi \mbreak dod4-+ si8 dod16 (re)
    mi (dod) si-+ (la) fad'8 la, \appoggiatura la16 sold4-+ r
    la16(dod mi dod) la(dod mi dod) mi_\upl dod_\upl la_\upl mi_\upl mi'_\upl dod_\upl la_\upl mi_\upl

    %7
    sold(si mi si) sold(si mi si) mi_\upl si_\upl sold_\upl mi_\upl mi'_\upl si_\upl sold_\upl mi_\upl\mbreak
    la16(dod mi dod) la(dod mi dod) mi_\upl dod_\upl la_\upl mi_\upl mi'_\upl dod_\upl la_\upl mi_\upl
    sold si (mi si) la dod (mi dod) si re (mi re) la dod (mi dod)

    %10
    sold mi fad sold la8 re dod8.-+[si16 si8.-+ la16]
    la4 r <<{la si
             si4.}\\{<fad re>4 <fad re>
                     <sold mi>4.}>> fad16_+ mi\mbreak la8 sold16 fad mi8 re

    %13
    dod8._+[si16 si8._+ la16] la4\fermata r
    r16 la''(mi dod) la4~la16 la(mi dod) la4
    r16 mi''(si sold) mi4~mi16 mi(si sold) mi'4~

    %16
    mi16 la'(mi dod) la4~la16 la(mi dod) la dod mi la\mbreak
    sold mi si sold mi'4 r16 mi' dod la mi8 la
    sold16 mi' si sold mi8 sold_+ la16 mi' dod la mi8 la

    %19
    sold16 mi' si sold mi8 sold_+ \appoggiatura sold16 la8. si16 dod si la sold
    fad4_+ r r16 sold' fad sold sold, si mi sold\mbreak
    sold8-+ fad r4 r16 fad mi fad fad, si red fad

    %22
    fad8-+ mi r mi mi2-+~
    mi4. fad8 si, mi16 red dod si la sold
    fad8 fad' si,8. red16 mi8.[fad16 red8.-+ mi16]

    %25
    mi4 si sold16_+(fad) mi8 r16 si' dod red
    mi (red) mi (red) mi8 si sold16_+(fad) mi8 r mi'
    red-+ dod16 si la'8 si sold4-+ fad8 mi\mbreak

    %28
    red-+ dod16 si la'8 si sold4-+ fad8 sold16(la)
    si(sold) fad (mi) red8-+ mi fad4-+ r\mbreak
    mi16(sold si sold) mi(sold si sold) si\upl sold\upl mi\upl si\upl si'\upl sold\upl mi\upl si\upl

    %31  %% fine quarta riga
    red(fad si fad) red(fad si fad) si\upl fad\upl red\upl si\upl si'\upl fad\upl red\upl si\upl
    mi16(sold si sold) mi(sold si sold) si\upl sold\upl mi\upl si\upl si'\upl sold\upl mi\upl si\upl
    red(fad si fad) mi(sold si sold) fad (la si la) mi(sold si sold)

    %34
    red si dod red mi8 la\mbreak sold8.-+[fad16 fad8.-+ mi16]
    <<mi4\\mi>> r mi-+ mi-+
    mi16 si sold si mi sold si sold fad4-+ fad-+

    %37
    fad16 red si red fad si, la' fad sold4-+ sold-+
    sold16 mi si mi sold si mi, sold sold8-+ fad r fad
    fad16\upl si,(do si) do(si) do(si)\mbreak sold'\upl si,(do si) do(si) do(si)
    fad'\upl si,(do si) do(si) do(si) sol'-+(fad) mi8 r sold

    %41
    sold16\upl dod,!(re dod) re(dod) re(dod) la'\upl dod,(re dod) re(dod) re(dod)
    sold'\upl dod,!(re dod) re(dod) re(dod) la'-+(sold) fad8 r dod\mbreak
    re16 fad re si fad' re fad si si la sold fad mi re dod-+ si

    %44
    dod mi dod la mi' dod mi la la sold fad mi re dod si-+ la
    si re si sold re' si re sold sold fad mid red dod si la_+ sold
    la8 fad r fad'\mbreak fad-+ mid r sold

    %47
    sold-+ fad r la la-+ sold r si
    si4. la16 -+ sold la8. si16 sold8.-+ fad16
    fad4 dod lad16_+ (sold) fad8 r16 fad sold lad

    %50
    si(lad) si(lad) si8 fad red16_+(dod) si8 r4\mbreak
    mi'4 si sold16_+ (fad) mi8 r16 mi fad sold
    la(sold) la(sold) la8 mi dod16_+ (si) la8 r4

    %53
    r8 mi'' dod[la] r la fad[re]
    r fad' re[si] r si sold[mi]
    r sold' mi[dod] r dod la[fad]\mbreak

    %56
    r la' fad[re] r re si[sold]
    r si' sold[mi] r mi dod[la]
    r16 mi'(si sold) mi4~mi16 mi' dod mi la,8 mi'

    %59
    mi, mi' mi, mi' mi,16 mi'(si sold) <<{s8 mi'-2
                                          mi8.-+(re16) r8 re re8.-+(dod16) r8 dod
                                          si dod re dod dod-+[si]}\\{mi,8 dod'
                                                                     dod8.-+(si16) r8 si si8.-+(la16) r8 la\mbreak
                                                                     sold la sold-4 la la [mi]}>> r8 dod'16 re

    %62
    mi\upl la(sold la) la,\upl la' (sold la) la,8 la'16 sold fad mi re dod
    si sold la si dod mi si mi mi,8 la16 si sold8._+ la16

}

IVfgn = \relative do {

    la'4 mi dod16_+(si) la8 r16 mi' fad sold
    la(sold) la(sold) la8 mi dod16_+(si) la8 r dod'
    re dod si sold la16 si dod re mi8 \once\stemUp dod,\mbreak

    %4
    re dod si sold la16 si dod re mi8 la
    dod,4 re-+ mi8 mi16 fad mi re dod si
    la la' dod la mi' la, dod la la,4 r

    %7
    r16 mi' sold mi si' mi, sold mi mi,4 r
    r16 la' dod la mi' la, dod la la,4 r\mbreak
    r16 mi'' re mi mi, mi' re mi mi, mi' re mi mi, mi' re mi

    %10
    mi,8 re dod sold la fad'16 re mi8 mi,
    la4 r re re
    mi2 fad4 sold-+

    %13
    la8 re, mi mi, la4\fermata r
    r4  r16 la(dod mi) la4~la16 la, dod la
    mi'4~mi16 mi,(sold si) mi4~mi16 mi, sold mi

    %16
    la4~la16 la(dod mi) la4~la16 la, dod la
    mi'4~mi16 mi, sold mi la8 la la' la\mbreak
    mi mi mi mi la la la la

    %19
    mi mi mi mi la la la la
    si,16 si' red si fad' si, red si si,4 r
    r16 si' red si fad' si, red si si,4 r

    %22
    r16 mi sold mi si' mi, sold mi\mbreak la dod sold si la dod sold si
    la dod sold si la dod fad, la sold8 la la, la'
    si16 sold la fad sold red mi fad sold8 la si si,

    %25
    mi'4 si sold16-+(fad) mi8 r16 si' dod red
    mi(red) mi(red) mi8 si sold16-+(fad) mi8 r sold\mbreak
    la sold fad red mi16 fad sold la si8 sold

    %28
    la sold fad red mi16 fad sold la si8 mi
    sold, la si mi, si si'16 dod si la sold fad
    mi mi sold mi si' mi, sold mi mi,4 r\mbreak

    %31
    r16 si'' red si fad' si, red si si,4 r
    r16 mi sold mi si' mi, sold mi mi,4 r
    r16 si'' la si si, si' la si\mbreak si, si' la si si, si' la si

    %34
    si8 la sold red mi dod'16 la si8[si,]
    mi4 r r r16 mi sold si
    mi4~mi16 mi, sold mi\mbreak si'4 r16 si, red fad

    %37
    si4~si16 si, red si mi4 r16 mi sold si
    mi4~mi16 mi, sold mi si8 si' la16 sold fad mi
    red8 red red red, r mi' mi8[mi,]

    %40
    r red' red[red,]\mbreak r mi' mi[mi,]
    r mid' mid[mid,] r fad' fad[fad,]
    r mid' mid[mid,] r fad' la fad

    %43
    si si, re si mi mi sold mi
    la la, dod la\mbreak re re fad re
    sold sold, si sold dod dod mid dod

    %46
    fad16 mid fad sold la sold la fad dod'8 dod,16 red mid red mid dod
    fad mid fad sold la sold la fad sold la si la sold la fad sold\mbreak
    mid fad mid red dod dod mid sold re8 si dod dod,

    %49
    fad''4 dod lad16-+(sold) fad8 r16 fad sold lad
    si(lad) si(lad) si8 fad red16-+(dod) si8 r4
    mi' si sold16-+ (fad) mi8 r16 mi fad sold

    %52
    la(sold) la(sold) la8 mi dod16_+(si) la8 r la'
    dod, dod dod dod re re re re
    re re re re mi mi mi mi\mbreak

    %55
    mi mi mi mi fad fad fad fad
    fad fad fad fad sold sold sold sold
    sold sold sold sold la la la16 mi (dod la)

    %58
    mi'4~mi16 mi(si sold) mi4~mi16 la dod la
    re8 dod si la\mbreak mi4~mi16 la dod la
    mi'4~mi16 mi(si sold) mi4~mi16 la dod la

    %61
    re mi dod mi si mi la, mi' mi,4 r8 la'
    dod, mi dod la re,4 re'-+
    mi8 re dod sold la fad'16 re mi8[mi,]

}

IVbcn = \relative do {

    la'4 mi dod16_+(si) la8 r16 mi' fad sold
    la(sold) la(sold) la8 mi dod16_+(si) la8 r dod'
    re dod si sold la16 si dod re mi8 \once\stemUp dod,\mbreak

    %4
    re dod si sold la16 si dod re mi8 la
    dod,4 re-+ mi8 mi16 fad mi (re) dod (si)
    la4 la la r

    %7
    mi mi mi r
    la la la r\mbreak
    mi' mi mi mi

    %10
    mi8 re dod sold la fad'16 re mi8 mi,
    la4 r re re
    mi2 fad4 sold-+

    %13
    la8 re, mi mi, la4\fermata r
    r4  r16 la(dod mi) la4~la16 la, dod la
    mi'4~mi16 mi,(sold si) mi4~mi16 mi, sold mi

    %16
    la4~la16 la(dod mi) la4~la16 la, dod la
    mi'4~mi16 mi, sold mi la8 la la' la\mbreak
    mi mi mi mi la la la la

    %19
    mi mi mi mi la la la la
    si,4 si si r
    si si si r

    %22
    mi, mi la8 sold la sold
    la' sold la fad\mbreak sold la la,[la']
    si16 sold la fad sold red mi fad sold8 la si si,

    %25
    mi'4 si sold16-+(fad) mi8 r16 si' dod red
    mi(red) mi(red) mi8 si sold16-+(fad) mi8 r sold\mbreak
    la sold fad red mi16 fad sold la si8 sold

    %28
    la sold fad red mi16 fad sold la si8 mi
    sold, la si mi, si si'16 dod si la sold fad
    mi4 mi mi r\mbreak

    %31
    si si si r
    mi mi mi r
    si si si si

    %34
    si'8 la sold red mi dod'16 la si8[si,]
    mi4 r r r16 mi sold si
    mi4~mi16 mi, sold mi\mbreak si'4 r16 si, red fad

    %37
    si4~si16 si, red si mi4 r16 mi sold si
    mi4~mi16 mi, sold mi si8 si' la16 sold fad mi
    red8 red red red, r mi' mi8[mi,]

    %40
    r red' red[red,]\mbreak r mi' mi[mi,]
    r mid' mid[mid,] r fad' fad[fad,]
    r mid' mid[mid,] r fad' la fad

    %43
    si si, re si mi mi sold mi
    la la, dod la\mbreak re re fad re
    sold sold, si sold dod dod mid dod

    %46
    fad16 mid fad sold la sold la fad dod'8 dod,16 red mid red mid dod
    fad mid fad sold la sold la fad sold la si la sold la fad sold\mbreak
    mid fad mid red dod dod mid sold re8 si dod dod,

    %49
    fad''4 dod lad16-+(sold) fad8 r16 fad sold lad
    si(lad) si(lad) si8 fad red16-+(dod) si8 r4
    mi' si sold16-+ (fad) mi8 r16 mi fad sold

    %52
    la(sold) la(sold) la8 mi dod16_+(si) la8 r la'
    dod, dod dod dod re re re re
    re re re re mi mi mi mi\mbreak

    %55
    mi mi mi mi fad fad fad fad
    fad fad fad fad sold sold sold sold
    sold sold sold sold la la la16 mi (dod la)

    %58
    mi'4~mi16 mi(si sold) mi4~mi16 la dod la
    re8 dod si la\mbreak mi4~mi16 la dod la
    mi'4~mi16 mi(si sold) mi4~mi16 la dod la

    %61
    re8 dod si la mi4 r8 la'
    dod, mi dod la re,4 re'-+
    mi8 re dod sold la fad'16 re mi8[mi,]

}

IVbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 4/4
    \key la\major
    \tempo 2 = 60
    s1*13
    \bar"|."
    \mark\markup "Fin"
    s1*50
    \bar "||"
    \mark\markup\center-column{"D.C."}

}

IVob = {
    \global
    <<\IVobn \forma>>

}


IVvlI = {
    \global
    <<\IVvlIn \forma>>

}

IVvlII = {
    \global
    <<\IVvlIIn \forma>>

}

IVfg = {
    \global
    \clef bass
    <<\IVfgn \forma>>

}

IVbc = {
    \global
    \clef bass
    <<\IVbcn \forma \IVbfn>>

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
    \terzine
}

VvlIn = \relative do'' {

    la8 la \tuplet 3/2 { la16(do si) la[(si do)] }\senza
    si8 si \tuplet 3/2 { si16(re do) si[(do re)]
    do-+(si la) la[(do mi)]} la8 la

    %4
    la4 sold-+
    \tuplet 3/2 { la16(mi re) do[(si la)] } la8 mi'-+
    fa8 fa \tuplet 3/2 { fa16(mi re) re[(do si)] }

    %7
    mi8 mi \tuplet 3/2 { mi16(re do) do[(si la)] }
    re8 re \tuplet 3/2 { re16(si do) re[(do si)] }
    do8-+\appoggiatura si16 la8 r mi'

    %10
    do' do \tuplet 3/2 { do16(si la) sol[(fad mi)]\mbreak
    red(si dod) red[(dod si)] la'(fad sol) la[(sol fad)]
    sol(si la) sol-+[(fad mi)]} sol8 fad-+

    %13
    mi mi, r mi'
    sol sol \tuplet 3/2 { sol16(sib la) sol-+[(fa? mi)] }
    fa8\appoggiatura mi16 re8 r re\mbreak  %% fine 3a riga

    %16
    fa fa \tuplet 3/2 { fa16(la sol) fa[(mi re)] }
    mi8 \appoggiatura re16 do8 r mi
    si si \tuplet 3/2 { si16(do re) do-+[(si la)]

    %19
    sold mi'(red) mi[(red mi)]} mi,8 mi~
    \tuplet 3/2 { mi16 re'? dod re[(dod re)] }\mbreak mi,8 mi~
    \tuplet 3/2 { mi16 do'! si do[(si do)] } mi,8 mi~

    %22
    \tuplet 3/2 { mi16 sib' la sib[(la sib)] fa'(mi re) do-+[(si la)]
    sold(mi fad) sold[(fad mi)] re'(si do) re[(do si)]\mbreak
    do(mi re) do[(si la)]} do8 si-+

    %25
    \tuplet 3/2 { la16(mi re) do_+[(si la)] } la8 \once\stemDown mi''
    la4 la
    la8. si16 sold4-+

    %28
    la8 la, r mi'
    re8.-+ do16 si8 la\mbreak
    sold8_+\appoggiatura fad16 mi8 r mi'

    %31
    la[mi la, la']
    fa re r sol
    re[mi si8.-+ do16]

    %34
    re8 sol, r sol'-+
    \tuplet 3/2 { la16(si do) do[(si do)] sol(la si) do[(si do)] }\mbreak
    fa,8 fa \tuplet 3/2 { fa16(re mi) fa[(mi re)]

    %37
    mi(fa sol) la[(si do)]} mi,8 re-+
    \tuplet 3/2 { do16(sol fa) mi[(re do)] } do8 do'
    do8. re16 si4-+

    %40
    do8 do \tuplet 3/2 { do16(mi re) do[(re mi)] }\mbreak
    re8 re \tuplet 3/2 { re16(fa mi) re[(mi fa)]
    mi sol,(fa) mi_+[(re do)]} do8 do'

    %43
    \tuplet 3/2 { r16 re(do) si-+[(la sol)]} sol8 sol'
    \tuplet 3/2 { r16 sol,(fa) mi_+[(re do)] } do8 la'
    \tuplet 3/2 { fa16(sol fa) mi[(fa mi)]\mbreak re(mi re) do[(re do)]

    %46
    si si'(la) sold[(fad mi)] mi mi'(re) do[(si la)]
    la(sold la) la_+[(sold la)] si(la si) si_+[(la si)]
    do(mi re) mi[(re mi)] mi,(fad sold) la_+[(sold la)]\mbreak

    %49
    la(sold la) la_+[(sold la)] la(fa! mi) re[(mi do)]
    si si'(la) sold_+[(fad mi)]} mi8 mi'
    \tuplet 3/2 { r16 la,(sold) la[(sold la)]} re,8 re'

    %52
    \tuplet 3/2 { r16 mi,(re) mi_+[(re mi)] mi(fad sold) sold_+[(fad sold)]
    la(sold la) la_+[(sold la)]} sold8._+ la16
    la8 la \tuplet 3/2 { la16(do si) la[(si do)] }

    %55
    si8 si \tuplet 3/2 { si16(re do) si[(do re)]
    do-+(si la) la[(do mi)]} la8 la
    la4 sold-+

    %58
    \tuplet 3/2 { la16(mi re) do[(si la)] } la8 mi'-+
    fa8 fa \tuplet 3/2 { fa16(mi re) re[(do si)] }
    mi8 mi \tuplet 3/2 { mi16(re do) do[(si la)] }

    %61
    re8 re \tuplet 3/2 { re16(si do) re[(do si)] }
    do8-+\appoggiatura si16 la8 r mi'
    do' do \tuplet 3/2 { do16(si la) sol[(fad mi)]\mbreak

    %64
    red(si dod) red[(dod si)] la'(fad sol) la[(sol fad)]
    sol(si la) sol-+[(fad mi)]} sol8 fad-+
    mi mi, r mi'

    %67
    sol sol \tuplet 3/2 { sol16(sib la) sol-+[(fa? mi)] }
    fa8\appoggiatura mi16 re8 r re\mbreak  %% fine 3a riga
    fa fa \tuplet 3/2 { fa16(la sol) fa[(mi re)] }

    %70
    mi8\appoggiatura re16 do8 r mi
    si si \tuplet 3/2 { si16(do re) do-+[(si la)]
    sold mi'(red) mi[(red mi)]} mi,8 mi~

    %73
    \tuplet 3/2 { mi16 re'! dod re[(dod re)] }\mbreak mi,8 mi~
    \tuplet 3/2 { mi16 do'! si do[(si do)] } mi,8 mi~
    \tuplet 3/2 { mi16 sib' la sib[(la sib)] fa'(mi re) do-+[(si la)]

    %76
    sold(mi fad) sold[(fad mi)] re'(si do) re[(do si)]\mbreak
    do(mi re) do[(si la)]} do8 si-+
    \tuplet 3/2 { la16(mi re) do_+[(si la)] } la8 r

}

VvlIIn = \relative do'' {

    R2*2
    la8 la \tuplet 3/2 { la16(do si) la[(si do)] }\senza
    si8 si \tuplet 3/2 { si16(re do) si[(do re)] }

    %5
    do8-+ \appoggiatura si16 la8 do4~
    \tuplet 3/2 { do16 fa, (sol) la[(si do)] } si8 si~\mbreak
    \tuplet 3/2 { si16 mi, (fad) sold[(la si)] } la8 la~

    %8
    \tuplet 3/2 { la16 re,(mi) fad[(sold la)] sold sold(la) si[(la sold)]
    la(mi re) do_+[(si la)]} \once\stemUp la8 do'
    mi mi \tuplet 3/2 { mi16(re do) si[(la sol?)] }

    %11
    fad8-+ fad'~\tuplet 3/2 { fad16 red(mi) fad[(mi-+ red)] }
    mi8 mi,4 red8_+
    \tuplet 3/2 { mi16(si' la) sol_+[(fad mi)] } mi8 r

    %14
    \tuplet 3/2 { mi'16_\upl mi,(re) dod_+[(si la)] }  la8 \once\stemDown mi''~\mbreak
    \tuplet 3/2 { mi16 la,(sol) fad_+[(mi re)] } re8 r
    \tuplet 3/2 { re'16_\upl re,(do) si_+[(la sol)] } sol8 \once\stemDown re''~

    %17
    \tuplet 3/2 { re16 sol,(fa) mi_+[(re do)] do la'(si) do[(si la)]
    fa'(mi fa) fa[(mi fa)]\mbreak fa(mi fa) mi-+[(re do)]}
    si8 mi,~\tuplet 3/2 { mi16 mi'(red) mi[(red mi)] }

    %20
    mi,8 mi~\tuplet 3/2 { mi16 re'!(dod) re[(dod re)] }
    mi,8 mi~\tuplet 3/2 { mi16 do'!(si) do[(si do)]}
    fa,8 fa~\mbreak \tuplet 3/2 { fa16 sol(fa) mi_+[(re do)]}

    %23
    si8 si'~\tuplet 3/2 { si16 sold(la) si[(la sold)] }
    la8 la4 sold8_+
    \tuplet 3/2 { la16 (mi re) do_+[(si la)] } la8 r

    %26
    la'8 la \tuplet 3/2 { la16(do si) la[(si do)] }
    si8 si \tuplet 3/2 { si16 (re do) si[(do re)]
    do-+(si la) la[(do mi)] mi(re do) si[(do si)]

    %29
    la(sold la) la'[(sold la)] la,(sold la) fa[(mi fa)]
    si, si'(la) sold_+[(fad mi)]}\mbreak mi8 r
    \tuplet 3/2 { r16 mi' re dod-+[(si la)] la mi(re) dod_+[(si la)]

    %32
    la la'(sol) fa_+[(mi re) ] re(dod re) mi_+[(re mi)]
    fa(sol fa) mi[(fa mi)] re(mi re) do![(re do)]
    \once\stemUp si re'(do) si-+[(la sol)] sol(do re) mi[(re do)]

    %35
    r fa, sol la[(sol fa)] r do re mi[(re do)]
    \once\stemUp si re'(do) si[(do re)] \once\stemDown re si,(do) re_+[(do si)]} \mbreak
    do8 do'4 si8-+

    %38
    do do \tuplet 3/2 { do16 (mi re) do[(re mi)]}
    re8 re \tuplet 3/2 { re16(fa mi) re[(mi fa)]
    mi(re do) do[(mi sol)]} do4

    %41
    do8. re16 si4
    do8 do,~do16 re mi fa\mbreak
    sol8 re fa8. \appoggiatura mi16 re

    %44
    mi8-+ \appoggiatura re16 do8 r mi
    si do \appoggiatura la16 sold8._+ la16
    si4-+ r8 mi,

    %47
    fa[(fad) sol_+(sold)]
    la[si-+ do re]\mbreak
    mi8.(re32-+ do) si8 do16(la)

    %50
    sold8_+ \appoggiatura fad?16 mi8  r si'
    re8. do16 si8.(la32-+ sold)
    la8[re do fa]

    %53
    mi la \appoggiatura do,16 si8.-+ la16
    la2~
    la4 sold_+\mbreak  %%% fine pagina

    %56
    la8 la \tuplet 3/2 { la16(do si) la[(si do)] }
    si8 si \tuplet 3/2 { si16 (re do) si[(do re)]}
    do8-+ \appoggiatura si16 la8 do4~

    %59
    \tuplet 3/2 { do16 fa, (sol) la[(si do)] } si8 si~\mbreak
    \tuplet 3/2 { si16 mi, (fad) sold[(la si)] } la8 la~
    \tuplet 3/2 { la16 re,(mi) fad[(sold la)] sold sold(la) si[(la sold)]

    %62
    la(mi re) do_+[(si la)]} \once\stemUp la8 do'
    mi mi \tuplet 3/2 { mi16(re do) si[(la sol?)] }
    fad8-+ fad'~\tuplet 3/2 { fad16 red(mi) fad[(mi-+ red)] }

    %65
    mi8 mi,4 red8_+
    \tuplet 3/2 { mi16(si' la) sol_+[(fad mi)] } mi8 r
    \tuplet 3/2 { mi'16_\upl mi,(re) dod_+[(si la)] }  la8 \once\stemDown mi''~\mbreak

    %68
    \tuplet 3/2 { mi16 la,(sol) fad_+[(mi re)] } re8 r
    \tuplet 3/2 { re'16_\upl re,(do) si_+[(la sol)] }  sol8 \once\stemDown re''~
    \tuplet 3/2 { re16 sol,(fa) mi_+[(re do)] do la'(si) do[(si la)]

    %71
    fa'(mi fa) fa[(mi fa)]\mbreak fa(mi fa) mi-+[(re do)]}
    si8 mi,~\tuplet 3/2 { mi16 mi'(red) mi[(red mi)] }
    mi,8 mi~\tuplet 3/2 { mi16 re'!(dod) re[(dod re)] }

    %74
    mi,8 mi~\tuplet 3/2 { mi16 do'!(si) do[(si do)]}
    fa,8 fa~\mbreak \tuplet 3/2 { fa16 sol(fa) mi_+[(re do)]}
    si8 si'~\tuplet 3/2 { si16 sold(la) si[(la sold)] }

    %77
    la8 la4 sold8_+
    \tuplet 3/2 { la16 (mi re) do_+[(si la)] } la8 r

}

Vfgn = \relative do {

    la'8[la fa fa]
    re[re mi mi]
    la[la fa fa]

    %4
    re[re mi mi]
    la[la la la]
    re[re sol, sol]

    %7
    do[do fa, fa]\mbreak
    si[si mi, mi]
    la[la la la]

    %10
    la[la la la]
    si[si red si]
    mi[la, si si]

    %13
    mi[mi mi re!]
    dod[dod dod dod]
    re[re re do!]

    %16
    si[si si si]
    do[do la la]
    re,[re re re]

    %19
    mi[mi mi mi]
    mi[mi mi mi]
    mi[mi mi mi]

    %22
    re[re re re]
    mi[mi sold mi]
    la [re, mi mi]

    %25
    \tuplet 3/2 { la16(mi re) do[(si la)] } la8 r  %% si ripete alla fine
    la'[la fa fa]
    re[re mi mi]

    %28
    la[la la la]
    fa[mi fa re]
    mi[mi mi' re]

    %31
    dod[dod dod dod]
    re[re re do!]
    si[do sol do,]

    %34
    sol'[sol mi mi]\mbreak
    fa[fa mi mi]
    re[re sol sol]

    %37
    do[fa, sol sol]
    do[do la la]
    fa[fa sol sol]

    %40
    do[do la la]
    fa[fa sol sol]
    do,[do do do']

    %43
    si[si si si]\mbreak
    do[do do, do']
    re[do si la]

    %46
    mi[mi mi la]
    re[do si mi]
    do[sold la fa!]

    %49
    do[do re re]
    mi[mi mi mi]
    fa[fa fa fa]

    %52
    do[sold' la si]
    do[re mi mi]
    la,[la fa fa]

    %55
    re[re mi mi]
    la[la fa fa]
    re[re mi mi]

    %58
    la[la la la]
    re[re sol, sol]
    do[do fa, fa]\mbreak

    %61
    si[si mi, mi]
    la[la la la]
    la[la la la]

    %64
    si[si red si]
    mi[la, si si]
    mi[mi mi re!]

    %67
    dod[dod dod dod]
    re[re re do!]
    si[si si si]

    %70
    do[do la la]
    re,[re re re]
    mi[mi mi mi]

    %73
    mi[mi mi mi]
    mi[mi mi mi]
    re[re re re]

    %76
    mi[mi sold mi]
    la [re, mi mi]
    \tuplet 3/2 { la16(mi re) do[(si la)] } la8 r

}

Vbcn = \relative do {

    la'8[la fa fa]
    re[re mi mi]
    la[la fa fa]

    %4
    re[re mi mi]
    la[la la la]
    re[re sol, sol]

    %7
    do[do fa, fa]\mbreak
    si[si mi, mi]
    la[la la la]

    %10
    la[la la la]
    si[si red si]
    mi[la, si si]

    %13
    mi[mi mi re!]
    dod[dod dod dod]
    re[re re do!]

    %16
    si[si si si]
    do[do la la]
    re,[re re re]

    %19
    mi[mi mi mi]
    mi[mi mi mi]
    mi[mi mi mi]

    %22
    re[re re re]
    mi[mi sold mi]
    la [re, mi mi]

    %25
    \tuplet 3/2 { la16(mi re) do[(si la)] } la8 r  %% si ripete alla fine
    la'[la fa fa]
    re[re mi mi]

    %28
    la[la la la]
    fa[mi fa re]
    mi[mi mi' re]

    %31
    dod[dod dod dod]
    re[re re do!]
    si[do sol do,]

    %34
    sol'[sol mi mi]\mbreak
    fa[fa mi mi]
    re[re sol sol]

    %37
    do[fa, sol sol]
    do[do la la]
    fa[fa sol sol]

    %40
    do[do la la]
    fa[fa sol sol]
    do,[do do do']

    %43
    si[si si si]\mbreak
    do[do do, do']
    re[do si la]

    %46
    mi[mi mi la]
    re[do si mi]
    do[sold la fa!]

    %49
    do[do re re]
    mi[mi mi mi]
    fa[fa fa fa]

    %52
    do[sold' la si]
    do[re mi mi]
    la,[la fa fa]

    %55
    re[re mi mi]
    la[la fa fa]
    re[re mi mi]

    %58
    la[la la la]
    re[re sol, sol]
    do[do fa, fa]\mbreak

    %61
    si[si mi, mi]
    la[la la la]
    la[la la la]

    %64
    si[si red si]
    mi[la, si si]
    mi[mi mi re!]

    %67
    dod[dod dod dod]
    re[re re do!]
    si[si si si]

    %70
    do[do la la]
    re,[re re re]
    mi[mi mi mi]

    %73
    mi[mi mi mi]
    mi[mi mi mi]
    re[re re re]

    %76
    mi[mi sold mi]
    la [re, mi mi]
    \tuplet 3/2 { la16(mi re) do[(si la)] } la8 r

}

Vbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 2/4
    \key la\minor
    \tempo 4 = 40
    s2*78
    \bar "|."

}


VvlI = {
    \global
    <<\VvlIn \forma>>

}

VvlII = {
    \global
    <<\VvlIIn \forma>>

}

Vfg = {
    \global
    \clef bass
    <<\Vfgn \forma>>

}

Vbc = {
    \global
    \clef bass
    <<\Vbcn \forma \Vbfn>>

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

VIobn = \relative do'' {

    dod8\p\footnote #' (-1 . 2) \markup\column\smaller {"  "\vspace #-0.2"Aria en rondeau, taken from the Pieces for harpsichord with voice or violin op. 5, and arranged for orchestra, "\vspace #-0.2"is intended to replace the Larghetto.""  "} (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %4
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %7
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %10
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %13
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %16
    la2.  %%% fine rondeau
    mi'8(la) sold(fad) mi(re)
    dod(si) la_+(sold) \appoggiatura sold8 la4

    %19
    si8\p(mi) re(dod) si(la)
    sold(fad) mi_+(red) \appoggiatura red8 mi4
    si'\f mi re\mbreak

    %22
    re-+ dod2
    dod4 fad mi
    mi-+ red2

    %25
    si2.\p~
    si~
    si2 (la8_+) sold

    %28
    fad2.-+
    si4.\f (dod8) si-+(la)
    dod4.(red8) dod-+(si)\mbreak

    %31
    dod (fad) mi4. (red8)
    \appoggiatura red8 mi2.
    si8\p (dod) re!(si) dod(la)

    %34
    sold(si) la(sold) fad_+(mi)
    la4\f si mi
    re4.\prall (dod16-+ si) si4-+

    %37
    dod8\p (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %40
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %43
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %46
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %49
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %52
    la2.  %%% fine rondeau
    fad8(sold) la(dod) si(re)
    dod(si) la_+(sold) fad4

    %55
    dod' re8[(si) dod(fad)]
    mid2-+ \appoggiatura re8 dod4
    fad mi8(re) dod(si)

    %58
    la(mid) fad(la) sold(si)\mbreak
    la(si) si4.-+(la16 si)
    \appoggiatura si8 dod2.

    %61
    dod8\p(re) mi(sol) fad(mi)
    re(dod) si(lad) \appoggiatura lad8 si4
    si8(dod) re(fad) mi(re)

    %64
    dod(si) la_+(sold) \appoggiatura sold8  la4\mbreak
    fad'8(mi) red(dod) fad(red)
    sid2-+ \appoggiatura lad8 sold4

    %67
    sold2.\p~
    sold
    sold'2(fad8-+) mi

    %70
    red2.-+
    dod4.(red8) dod-+(sid)
    red4.(mi8) red-+(dod)

    %73
    fad(la) red,4.-+ (dod8)\mbreak
    dod2.
    mi8\p(re!) dod(si) la-+(sold)

    %76
    fad(sold) la(si) dod(la)
    re\f(dod) si_+(la) sold(fad)
    \appoggiatura {fad16[sold]} sold2-+ \appoggiatura fad8 mi4

    %79
    dod'8\p (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %82
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %85
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %88
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %91
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %94
    la2.  %%% fine rondeau

}

VIvlIn = \relative do'' {

    dod8\p (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %4
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %7
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %10
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %13
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %16
    la2.  %%% fine rondeau
    mi'8(la) sold(fad) mi(re)
    dod(si) la_+(sold) \appoggiatura sold8 la4

    %19
    si8\p(mi) re(dod) si(la)
    sold(fad) mi_+(red) \appoggiatura red8 mi4
    si'\f mi re\mbreak

    %22
    re-+ dod2
    dod4 fad mi
    mi-+ red2

    %25
    si2.\p~
    si~
    si2 (la8_+) sold

    %28
    fad2.-+
    si4.\f (dod8) si-+(la)
    dod4.(red8) dod-+(si)\mbreak

    %31
    dod (fad) mi4. (red8)
    \appoggiatura red8 mi2.
    si8\p (dod) re!(si) dod(la)

    %34
    sold(si) la(sold) fad_+(mi)
    la4\f si mi
    re4.\prall (dod16-+ si) si4-+

    %37
    dod8\p (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %40
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %43
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %46
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %49
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %52
    la2.  %%% fine rondeau
    fad8(sold) la(dod) si(re)
    dod(si) la_+(sold) fad4

    %55
    dod' re8[(si) dod(fad)]
    mid2-+ \appoggiatura re8 dod4
    fad mi8(re) dod(si)

    %58
    la(mid) fad(la) sold(si)\mbreak
    la(si) si4.-+(la16 si)
    \appoggiatura si8 dod2.

    %61
    dod8\p(re) mi(sol) fad(mi)
    re(dod) si(lad) \appoggiatura lad8 si4
    si8(dod) re(fad) mi(re)

    %64
    dod(si) la_+(sold) \appoggiatura sold8 la4\mbreak
    fad'8(mi) red(dod) fad(red)
    sid2-+ \appoggiatura lad8 sold4

    %67
    sold2.\p~
    sold
    sold'2(fad8-+) mi

    %70
    red2.-+
    dod4.(red8) dod-+(sid)
    red4.(mi8) red-+(dod)

    %73
    fad(la) red,4.-+ (dod8)\mbreak
    dod2.
    mi8\p(re!) dod(si) la-+(sold)

    %76
    fad(sold) la(si) dod(la)
    re\f(dod) si_+(la) sold(fad)
    \appoggiatura {fad16[sold]} sold2-+ \appoggiatura fad8 mi4

    %79
    dod'8\p (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %82
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %85
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %88
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %91
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %94
    la2.  %%% fine rondeau

}

VIvlIIn = \relative do'' {

    dod8\p (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %4
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %7
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %10
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %13
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %16
    la2.  %%% fine rondeau
    la8(dod) mi (re) dod(si)\mbreak
    la(fad) mi_+ (re) dod4

    %19
    mi8\p(sold) si(la) sold(fad)
    mi(dod) si_+(la) sold4
    si'8\f re sold si mi, re

    %22
    re4-+ dod2
    dod8 mi lad dod fad, mi
    mi4-+ red2

    %25
    sold8\p(fad) la(sold) si(mi,)\mbreak
    \appoggiatura mi8 fad2.
    sold8\f(fad) la(sold) si(mi,)

    %28
    red2-+ \appoggiatura dod8 si4
    mi4.(fad8) mi-+(red)
    fad4.(sold8) fad-+(mi)

    %31
    la dod fad,2-+
    mi2.
    r4 r mi,\p\mbreak

    %34
    mi2.~
    mi~
    mi4 la sold_+

    %37
    dod8\p (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %40
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %43
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %46
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %49
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %52
    la2.  %%% fine rondeau
    fad8(dod) fad(la) sold(si)
    la(si) la(sold) fad4

    %55
    dod' fad,8(sold) la(si)
    sold2_+ r4\mbreak
    fad' mi8(re) dod(si)

    %58
    la(mid) fad(la) sold(si)
    la si si4.-+(la16 si)
    \appoggiatura si8 dod2.

    %61
    r4 r8 mi\p(re dod)
    si(sol) fad(mi) re4
    r r8 re'(dod si)\mbreak

    %64
    la(fad) mi_+(re) dod4
    la''8(sold) fad(mi) red(fad)
    sid,2-+ \appoggiatura lad8 sold4

    %67
    mi'8\p(red) fad(mi) sold(dod,)
    \appoggiatura dod8 red2.
    mi8(red) fad(mi) sold(dod,)

    %70
    sid2-+ \appoggiatura la8 sold4\mbreak
    dod4.(red8) dod(sid)
    red4.(mi8) red-+(dod)

    %73
    fad la red,4.-+ (dod8)
    dod2.
    mi8\p(re!) dod(si) la-+(sold)

    %76
    fad(sold) fad(sold) la(fad)\mbreak
    re'\f(dod) si_+(la) sold(fad)
    \appoggiatura {fad16[sold]} sold2_+ \appoggiatura fad8 mi4

    %79
    dod'8\p (si) re(dod) mi(la,)
    \appoggiatura la8 si2.
    dod8(si) re(dod) mi(la,)

    %82
    sold2-+ \appoggiatura fad8 mi4\mbreak
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)

    %85
    re(mi) re4.(dod16-+ si)
    si2.-+
    dod8\p (si) re(dod) mi(la,)

    %88
    \appoggiatura la8 si2.\mbreak
    dod8 (si) re(dod) mi(la,)
    sold2-+ \appoggiatura fad8 mi4

    %91
    la4.\f(si8) la_+(sold)
    si4.(dod8) si-+(la)
    re fad si,4.-+ la8

    %94
    la2.  %%% fine rondeau

}

VIfgn = \relative do {

    la'2.\p
    sold8 mi sold si sold mi
    la2.

    %4
    mi8 si' mi si sold mi
    dod4.\f  fad8(mi-+ re)
    re4.  sold8(fad-+ mi)

    %7
    sold mi la sold la re,
    mi mi, mi'8 re dod_+ si
    la2\p la'4

    %10
    sold8 mi sold si sold mi\mbreak
    la2.
    mi8 si' mi si sold mi

    %13
    dod4.\f  fad8(mi-+ re)
    re4.  sold8(fad-+ mi)
    fad re' mi4 re

    %16
    dod2.  %% fine rondeau
    R2.
    r8 re,(dod_+ si) la4

    %19
    R2.
    r8 la\p(sold_+ fad) mi4\mbreak
    mi'4. mi8 sold si

    %22
    la mi la mi dod la
    fad4. fad'8 lad dod
    si fad si fad red si

    %25
    mi2.\p
    red8 si red fad red si
    mi2.

    %28
    si8 fad' si fad red si
    \once\stemUp sold si'\f mi la, (sold-+ fad)\mbreak
    la dod fad si, (la-+ sold)

    %31
    fad4 si si,
    mi8 mi sold si sold mi
    mi,2\p r4

    %34
    \clef tenor \key la\major r r8 si''(la-+ sold)
    dod\f mi sold, mi' mi, mi'
    \clef bass\key la\major la,4 la, mi

    %37
    la'2.\p
    sold8 mi sold si sold mi
    la2.

    %40
    mi8 si' mi si sold mi
    dod4.\f  fad8(mi-+ re)
    re4.  sold8(fad-+ mi)

    %43
    sold mi la sold la re,
    mi mi, mi'8 re dod_+ si
    la2\p la'4

    %46
    sold8 mi sold si sold mi\mbreak
    la2.
    mi8 si' mi si sold mi

    %49
    dod4.\f  fad8(mi-+ re)
    re4.  sold8(fad-+ mi)
    fad re' mi4 re

    %52
    dod2.  %% fine rondeau
    fad,2 si,4
    fad8 re'(dod_+ si) la4\mbreak

    %55
    la' si fad
    dod'2 r4
    r r dod

    %58
    dod2.~
    dod4 sold fad
    mid dod'8-+ (re) dod (si)

    %61
    lad4-+ r r
    r8 mi\p(re-+ dod) si4\mbreak
    R2.

    %64
    r8 re(dod_+ si) la4
    fad'8\f (sold) la (sold) fad (la)
    sold sold sid red sid sold

    %67
    \clef tenor\key la\major  dod2.
    sid8 sold sid red sid sold
    dod2.

    %70
    sold8\p red' sold red sid sold\mbreak
    \clef bass\key la\major mi4.\f la8(sold-+ fad)
    fad4. dod'8(si-+ la)

    %73
    la4 si la
    sold2-+ r4
    r mi'8\p re dod-+ si

    %76
    la2.
    r4 re8\f(dod) si-+(la)
    mi si' mi si sold mi

    %79
    la2.\p
    sold8 mi sold si sold mi
    la2.

    %82
    mi8 si' mi si sold mi
    dod4.\f  fad8(mi-+ re)
    re4.  sold8(fad-+ mi)

    %85
    sold mi la sold la re,
    mi mi, mi'8 re dod_+ si
    la2\p la'4

    %88
    sold8 mi sold si sold mi\mbreak
    la2.
    mi8 si' mi si sold mi

    %91
    dod4.\f  fad8(mi-+ re)
    re4.  sold8(fad-+ mi)
    fad re' mi4 re

    %94
    dod2.  %% fine rondeau

}

VIbcn = \relative do {

    la'2.\p
    sold8 mi sold si sold mi
    la2.

    %4
    mi8 si' mi si sold mi
    dod\f mi la re,(dod-+   si)
    re fad si mi,(re-+ dod)

    %7
    sold' mi la sold la re,
    mi mi, mi'8 re dod_+ si
    la2\p la'4

    %10
    sold8 mi sold si sold mi\mbreak
    la2.
    mi8 si' mi si sold mi

    %13
    dod\f mi la re,(dod-+   si)
    re fad si mi,(re-+ dod)
    si4 mi mi,

    %16
    la2.  %% fine rondeau
    R2.
    r8 re(dod_+ si) la4

    %19
    R2.
    r8 la\p(sold_+ fad) mi4\mbreak
    mi'4. mi8 sold si

    %22
    la mi la mi dod la
    fad4. fad'8 lad dod
    si fad si fad red si

    %25
    mi2.\p
    red8 si red fad red si
    mi2.

    %28
    si8 fad' si fad red si
    \once\stemUp sold si'\f mi la, (sold-+ fad)\mbreak
    la dod fad si, (la-+ sold)

    %31
    fad4 si si,
    mi8 mi sold si sold mi
    mi,2\p r4

    %34
    r r8 si''(la-+ sold)
    dod4 sold mi
    la la, mi

    %37
    la'2.\p
    sold8 mi sold si sold mi
    la2.

    %40
    mi8 si' mi si sold mi
    dod\f mi la re,(dod-+   si)
    re fad si mi,(re-+ dod)

    %43
    sold' mi la sold la re,
    mi mi, mi'8 re dod_+ si
    la2\p la'4

    %46
    sold8 mi sold si sold mi\mbreak
    la2.
    mi8 si' mi si sold mi

    %49
    dod\f mi la re,(dod-+   si)
    re fad si mi,(re-+ dod)
    si4 mi mi,

    %52
    la2.  %% fine rondeau
    fad'2 si,4
    fad8 re'(dod_+ si) la4\mbreak

    %55
    la' si fad
    dod' dod8 si(la-+ sold)
    la4 sold8 fad mid4

    %58
    fad8 sold la(fad) mid(dod)
    fad4 mi re-+
    dod dod'8-+(re) dod(si)

    %61
    lad4-+ r r
    r8 mi\p(re-+ dod) si4\mbreak
    R2.

    %64
    r8 re(dod_+ si) la4
    fad'8\f (sold) la (sold) fad (la)
    sold sold sid red sid sold

    %67
    dod2.
    \clef tenor\key la\major sid8 sold sid red sid sold
    dod2.

    %70
    sold8\p red' sold red sid sold\mbreak
    \clef bass\key la\major mi\f sold dod fad, (mi-+ red)
    fad la red sold,(fad-+ mi)

    %73
    red4 sold sold,
    dod8 mi sold dod sold mi
    dod2.\p
    re2 dod4

    %77
    si2.\f
    mi8 si' mi si sold mi
    la2.\p

    %80
    sold8 mi sold si sold mi
    la2.
    mi8 si' mi si sold mi

    %83
    dod\f mi la re,(dod-+   si)
    re fad si mi,(re-+ dod)
    sold' mi la sold la re,

    %86
    mi mi, mi'8 re dod_+ si
    la2\p la'4
    sold8 mi sold si sold mi\mbreak

    %89
    la2.
    mi8 si' mi si sold mi
    dod\f mi la re,(dod-+   si)

    %92
    re fad si mi,(re-+ dod)
    si4 mi mi,
    la2.  %% fine rondeau

}

VIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 3/4
    \override Staff.TimeSignature.style = #'single-digit
    \key la\major
    \tempo 2 = 45
    s2.*16
    \bar":|."\break
    \mark\markup\italic\small {I \super er Couplet}
    s2.*20
  \once \override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup\italic \small"[Reprise]"
    s2.*16
  \once \override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup\italic \small{ 2\super e Couplet}
    s2.*26
  \once \override Score.RehearsalMark.extra-offset = #'(+5 . +1)
    \mark\markup\italic \small"[Reprise]"
   s2.*16
    \bar "|."

}

VIob = {
    \global
    <<\VIobn \forma>>

}


VIvlI = {
    \global
    <<\VIvlIn \forma>>

}

VIvlII = {
    \global
    <<\VIvlIIn \forma>>

}

VIfg = {
    \global
    \clef bass
    <<\VIfgn \forma>>

}

VIbc = {
    \global
    \clef bass
    <<\VIbcn \forma \VIbfn>>

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

VIIobn = \relative do'' {

    la'4 la,8 la'4 la,8 la'4 r8 r4 r8
    mi4 mi,8 mi'4 mi,8 mi'4 r8 r4 r8
    la,4 la8 la4 la8 la4 r8 r4 r8

    %4
    sold(si mi) la,(dod mi) sold,4_+ r8 r4 si'8\mbreak
    si4.-+~si la4 r8 r4 la8
    la4.-+~la sold4 r8 r4 sold8

    %7
    sold4.-+~sold fad4 r8 r4 si8
    mi,1.~
    mi2.~mi4. mi4 la8

    %10
    sold-+(fad mi) mi4 la8 la,4. sold_+
    la4 la8 la4 la8 la si dod re dod si
    dod4 la'8 si,4 sold'8-+ la4.\fermata r4 r8

    %13
    R1.*4
    mi4. mi mi2.-+~
    mi1.-+

    %19
    fad4. fad\mbreak fad2.-+
    \parenthesize ~ fad1.-+
    mi4. mi mi2.-+~

    %22
    mi1.-+
    red8-+(dod si) mi4 fad8 sold4. fad-+
    mi4 mi,8 mi'4 mi,8 mi'4 r8 r4 r8

    %25
    si'4 si,8 si'4 si,8 si'4 r8 r4 r8\mbreak
    mi,4 mi,8 mi'4 mi,8 mi'4 r8 r4 r8
    red(fad si) mi,(sold si) red,4-+ r8 r4 fad8

    %28
    fad4.-+~fad mi4 r8 r4 mi8
    mi4.-+~mi red4 r8 r4 red8\mbreak
    red4.-+~red dod4 r8 r4 fad8

    %31
    si,1.~
    si2. si4.~si4 mi8
    fad(mi red) mi4 mi8 mi4. red-+

    %34
    mi4 mi,8 mi'4 mi,8 mi fad sold la sold fad
    sold4 mi'8 fad,4 red'8-+ mi4. r4 r8
    R1.*4

    %40
    fad4. fad-+ sold4 r8 r4 r8
    fad4. fad-+ sold4 r8 r4 r8
    sold4. sold-+ la4 r8 r4 r8\mbreak

    %43
    sold4. sold-+ la4 r8 r4 la8
    la4.-+~la sold4 r8 r4 sold8
    sold4.-+~sold fad4 r8 r4 fad8

    %46
    fad4.-+~fad mid4-+ r8 r4  dod8
    dod1.~\mbreak
    dod4.~dod4 fad8 fad4. mid-+

    %49
    fad4 r8 r4 r8 r2.
    R1.*4
    la,4. la la2.-+~

    %55
    la1.
    si4. si si2.-+~
    si1.-+

    %58
    la4. la la2.-+~
    la1.-+
    sold8_+(fad mi) la4 si8 dod4. si-+

}

VIIvlIn = \relative do'' {

    la'4 la,8 la'4 la,8 la' mi re dod-+ si la
    mi'4 mi,8 mi'4 mi,8 mi' si la sold_+ fad mi
    la4 la,8 la'4 la,8 la' mi re dod_+ si la\mbreak

    %4
    sold'(si mi) la,(dod mi) sold,4_+ mi'8 sold4 si8
    si(la sold) sold(fad-+ mi) la4 la,8 la'4 la8
    la(sold fad) fad(mi-+ re) sold4 sold,8 sold'4 sold8

    %7
    sold(fad mi) mi(re-+ dod)\mbreak fad4 fad,8 fad'4 si8
    sold(la sold) la(si la) si(dod si) la(si la)
    sold(la sold) la(si la) si(dod si) la(si la)\mbreak

    %10
    sold-+(fad mi) mi4 la8 la,4. sold_+
    la4 la,8 la'4 la,8 la' si dod re dod si
    dod4 la'8 si,4 sold'8-+ la4.\fermata r4 r8

    %13
    la4 la,8 la'4 la,8\mbreak la' mi re dod-+ si la
    mi'4 mi,8 mi'4 mi,8 mi' si la sold_+ fad mi
    la4 r8 re,4 r8 la'4 r8 re,4 r8

    %16
    la4 la'8 sold4_+ la8 mi'4. r4 r8\mbreak
    mi4. sold-+ la8 mi re dod-+ si la
    mi4. sold_+ la8 mi re dod_+ si la

    %19
    fad''4. lad-+ si8 fad mi red-+ dod si
    fad4. lad_+\mbreak si8 fad' mi red-+ dod si
    si'(la sold) dod(si la) sold(fad mi) la(sold fad)

    %22
    si(la sold) dod(si la) sold(fad mi) la(sold fad)
    si4. si,4 mi8\mbreak mi4. red-+
    mi4 mi,8 mi'4 mi,8 mi' si la sold_+  fad mi

    %25
    si''4 si,8 si'4 si,8 si' fad mi red-+ dod si
    mi4 mi,8 mi'4 mi,8\mbreak mi' si la sold_+ fad mi
    red'(fad si) mi,(sold si) red,4-+ si8 red4 fad8

    %28
    fad(mi red) red(dod-+ si) mi4 mi,8 mi'4 mi8
    mi(red dod) dod(si-+ la)\mbreak red4 red,8 red'4 red8
    red(dod si) si(la_+ sold) dod4 dod,8 dod'4 fad8

    %31
    red(mi red) mi(fad mi) fad(sold fad) mi(fad mi)
    red(mi red) mi(fad mi) fad(sold fad) mi(fad mi)
    red4 fad8 si,4 mi8 mi4. red-+

    %34
    mi4 mi,8 mi'4 mi,8 mi fad sold la sold fad
    sold4 mi'8 fad,4 red'8-+ mi4. r4 r8\mbreak
    <<{si mi si dod(si dod) si4.-+ r4 r8

       %37
       fad' si fad sold(fad sold) fad4.-+ r4 r8
       si, mi si dod(si dod) si mi si dod(si dod)\mbreak
       si(dod si) la4 sold8 fad4.-+ r4 r8}\\{sold4. (la8)(sold la)  sold4._+ r4 r8
                                           red'4. (mi8)(red mi) red4. r4 r8
                                           sold,4. (la8)(sold la) sold4. (la8)(sold la)
                                           sold(la sold) fad4 mi8 si4. r4 r8}>>

    %40
    si'8 (red fad) si\upl la\upl si\upl si,(mi sold) si\upl la\upl si\upl
    si, (red fad) si\upl la\upl si\upl si,(mi sold) si\upl la\upl si\upl\mbreak
    dod,(mid sold) dod\upl si\upl dod\upl dod,(fad la) dod\upl si\upl dod\upl

    %43
    dod,(mid sold) dod\upl si\upl dod\upl dod,(fad la) dod\upl si\upl dod\upl
    re4 re,8 re'4 re8\mbreak re(dod si) si(la-+ sold)
    dod4 dod,8 dod'4 dod8 dod(si la) la(sold-+ fad)

    %46
    si4 si,8 si'4 si8 si(la sold) la(sold-+ fad)\mbreak
    mid(fad mid) fad(sold fad) sold(la sold) fad(sold fad)
    mid4 sold8 dod,4 fad8 fad4. mid-+

    %49
    fad4-4 fad,8 fad'4 fad,8 fad' dod si lad_+ sold fad\mbreak
    <<{fad' si fad sold(fad sold) fad2.-+}\\{red4. (mi8)(red mi) red2.-+}>>
    mi4 mi,8 mi'4 mi8 mi si la sold_+ fad mi

    %52
    <<{mi' la mi fad(mi fad) mi la mi fad(mi fad)
       mi(fad mi) re4 dod8 si4.-+ r4 r8}\\{dod4. (re8)(dod re) dod4. (re8)(dod re)
                                           dod(re dod) si4 la8 mi4. r4 r8}>>
    la4. dod-+ re8 la sol fad_+ mi re

    %55
    la4. dod_+ re8 la' sol fad_+ mi re\mbreak
    si'4. red-+ mi8 si la sold!_+ fad mi
    si4. red mi8 si' la sold_+  fad mi

    %58
    mi'(re dod) fad(mi re) dod(si la) re(dod si)
    mi(re dod) fad(mi re) dod(si la) re(dod si)
    mi4 mi'8 mi,4 la8 la4. sold-+

}

VIIvlIIn = \relative do'' {

    la'4 la,8 la'4 la,8 la' mi re dod-+ si la
    mi'4 mi,8 mi'4 mi,8 mi' si la sold_+ fad mi
    la4 la,8 la'4 la,8 la' mi re dod_+ si la

    %4
    mi' mi' mi, mi mi' mi, mi(sold la) si(dod re)\mbreak
    mi4 mi,8 mi'4 mi8 mi(re dod) dod(si-+ la)
    re4 re,8 re'4 re8 re(dod si) si(la_+ sold)

    %7
    dod4 dod,8 dod'4 dod8 dod(si la) la(sold_+ fad)
    si(dod si) dod(re dod) re(mi re) dod( re dod)
    si(dod si) dod(re dod) re(mi re) dod( re dod)

    %10
    si_+(la sold) la4 si8 dod4. si-+
    la4 la,8 la'4 la,8 la' si dod re dod si
    dod4 la'8 si,4 sold'8-+ la4.\fermata r4 r8

    %13
    <<{mi8(la mi) fad (mi fad) mi4.-+}\\{dod8(mi dod) re(dod re) dod4.-+}>> r4 r8\mbreak
    <<{si8 (mi si) dod(si dod) si4.-+}\\{sold8(dod sold) la(sold la) sold4.-+}>> r4 r8
    <<{mi'8(la mi) fad (mi fad) mi(la mi) fad (mi fad)

       %16
       mi(fad mi) re4-+ dod8 si4.}\\{dod8(mi dod) re(dod re) dod(mi dod) re(dod re)
                                     dod(re dod) si4-+ la8 sold4.}>> r4 r8
    si sold mi si' sold mi dod dod'(re) mi(re dod)
    si sold mi si' sold mi dod dod'(re) mi(re dod)

    %19
    dod lad fad dod' lad fad red red'(mi) fad(mi red)
    dod lad fad dod' lad fad red red'(mi) fad(mi red)
    mi4. mi mi2.-+~

    %22
    mi1.-+
    red8-+(dod si) mi4 fad8 sold4. fad-+
    mi4 mi,8 mi'4 mi,8 mi' si la sold_+ fad mi

    %25
    si''4 si,8 si'4 si,8 si' fad mi red-+ dod si
    mi4 mi,8 mi'4 mi,8 mi' si la sold_+ fad mi
    si' si' si, si si' si, si(red mi) fad(sold la)

    %28
    si4 si,8 si'4 si8 si(la sold) sold(fad-+ mi)\mbreak
    la4 la,8 la'4 la8 la(sold fad) fad(mi-+ red)
    sold4 sold,8 sold'4 sold8 sold(fad mi) mi(red-+ dod)

    %31
    fad(sold fad) sold(la sold) la(si la) sold(la sold)
    fad(sold fad) sold(la sold) la(si la) sold(la sold)
    fad-+(mi red) mi4 fad8 sold4. fad-+\mbreak

    %34
    mi4 mi,8 mi'4 mi,8 mi fad sold la sold fad
    sold4 mi'8 fad,4 red'8-+ mi4. r4 r8
    mi4 mi,8 mi'4 mi,8 mi' si la sold_+ fad mi

    %37
    si'4 si,8 si'4 si,8 si' fad mi red_+ dod si
    mi'4 mi,8 mi'4 mi,8 mi'2.-+
    si4 si,8 si'4 si8 si2.-+\mbreak

    %40
    si8(fad mi) red_+(dod si) r2.
    si'8(fad mi) red_+(dod si) r2.
    dod'8(sold fad) mid_+(red dod) r2.

    %43
    dod'8(sold fad) mid_+(red dod) r4 r8 fad'4 fad,8
    fad'(sold la) la(sold fad) sold4 sold,8 sold'4 sold8
    sold(fad mi) mi(re-+ dod)\mbreak fad4 fad,8 fad'4 fad8


    %46
    fad(mi re) re(dod-+ si) dod4 dod,8 dod'(si-+ la)
    sold( la sold) la(si la) si(dod si) la(si la)
    sold(fad_+ mid) fad4 sold8 la4. sold_+

    %49
    <<{dod8(fad dod) red(dod red) dod2.-+}\\{lad8(dod lad) si(lad si) lad2.-+}>>
    si4 si,8 si'4 si,8\mbreak si'(fad mi) red_+(dod si)
    <<{si'(mi si) dod(si dod) si2.-+}\\{sold8(si sold) la(sold la) sold2.-+}>>

    %52
    la'4 la,8 la'4 la8 la2.-+
    mi4 mi,8 mi'4 la8 sold4.-+ r4 r8
    mi, dod la mi' dod la fad' fad(sol) la(sol fad)

    %55
    mi dod la mi' dod la fad' fad(sol) la(sol fad)\mbreak
    fad red si fad' red si sold'! sold(la) si(la sold)
    fad red si fad' red si sold' sold(la) si(la sold)

    %58
    la4. la la2._+~
    la1._+
    sold8_+(fad mi) la4 si8 dod4. si-+

}

VIIfgn = \relative do {

    \clef tenor\key la\major la''4 la,8 la'4 la,8 la' mi re dod-+ si la
    \clef bass\key la\major mi'4 mi,8 mi'4 mi,8 mi' si la sold-+ fad mi
    la4 la,8 la'4 la,8 la' mi re dod_+ si la\mbreak

    %4
    mi'4 r8 la4 r8 mi4 mi8 re mi re
    dod4 re8 mi4 dod8 fad4 sold8 la4 fad8
    si,4 dod8 re4 si8 mi4 fad8 sold4 mi8

    %7
    la,4 si8 dod4 la8 re4 mi8 fad4 re8\mbreak
    mi4 r8 la4 r8 sold4 r8 la4 r8
    mi'4 r8 la,4 r8 sold4 r8 la4 r8

    %10
    re,4. dod4 re8 mi4. mi,
    la'4 la,8 la'4 la,8 la' si dod re dod si\mbreak
    dod4 mi,8 mi'4 mi,8 la4.\fermata r4 r8

    %13
    R1.*3
    r2. r8 mi' re dod-+ si la
    sold4. mi la la,

    %18
    sold' mi la la,
    lad' fad si si,\mbreak
    lad' fad si4 si,8 si'4 la!8

    %21
    sold(fad mi) la(sold fad)  si(la sold) dod(si la)
    sold(fad mi) la(sold fad)  si(la sold) dod(si la)
    la,4 la'8 sold4-+ la8 si4. si,\mbreak

    %24
    mi'4 mi,8 mi'4 mi,8 mi' si la sold-+ fad mi
    si'4 si,8 si'4 si,8 si' fad mi red_+ dod si
    mi4 mi,8 mi'4 mi,8 mi' si la sold_+ fad mi

    %27
    si'4 r8 mi,4 r8 si'4 si'8 la si la\mbreak
    sold4 la8 si4 sold8 dod,4 red8 mi4 dod8
    fad4 sold8 la4 fad8 si,4 dod8 red4 si8

    %30
    mi4 fad8 sold4 mi8 la,4 si8 dod4 la8
    si4 r8 mi4 r8 red4 r8 mi4 r8\mbreak
    si'4 r8 mi,4 r8 red4 r8 mi4 r8

    %33
    la,4 la'8 sold4 la8 si4. si,
    mi'4 mi,8 mi'4 mi,8 mi fad sold la sold fad
    sold4 mi8 si'4 si,8 mi4. r4 r8\mbreak

    %36
    mi4. la, mi' r4 r8
    si4. mi, si' r4 r8
    mi4. la, mi la

    %39
    mi4 mi'8 red4 mi8 si red fad si fad red
    si4. r4 r8 mi(si la) sold_+(fad mi)
    r2. mi'8(si la) sold_+(fad mi)

    %42
    r2. fad'8(dod si) la_+(sold fad)
    r2. fad'8(dod si) la_+(sold fad)
    si4 dod8 re?4 si8 mi?4 fad8 sold4 mi8

    %45
    la4 si8 dod4 la8 re,4 mi8 fad4 re8
    sold4 la8 si4 sold8\mbreak mid4-+ dod8 fad4 fad,8
    dod'4 r8 fad4 r8 mid4 r8 fad4 r8

    %48
    si,4 si'8 la4 si8 dod4. dod,
    fad'2. fad
    si,4 si,8 si'4 si,8 si' fad mi red dod si\mbreak

    %51
    mi'2. mi
    la,4. re, la re,
    la'4 la'8 sold4-+ la8 mi' si la sold-+ fad mi

    %54
    dod4. la re re,
    dod' la re re,\mbreak
    red' si mi mi,

    %57
    red' si mi mi'4 re8
    dod8(si la) re(dod si) mi(re dod) fad(mi re)
    dod8(si la) re(dod si) mi(re dod) fad(mi re)

    %60
    re,4 re'8 dod4-+ re8 mi4. mi,

}

VIIbcn = \relative do {

    \clef tenor\key la\major la''4 la,8 la'4 la,8 la' mi re dod-+ si la
    \clef bass\key la\major mi'4 mi,8 mi'4 mi,8 mi' si la sold-+ fad mi
    la4 la,8 la'4 la,8 la' mi re dod_+ si la\mbreak

    %4
    mi'4 r8 la4 r8 mi4 mi8 re mi re
    dod4 re8 mi4 dod8 fad4 sold8 la4 fad8
    si,4 dod8 re4 si8 mi4 fad8 sold4 mi8

    %7
    la,4 si8 dod4 la8 re4 mi8 fad4 re8\mbreak
    mi4 r8 la4 r8 sold4 r8 la4 r8
    mi'4 r8 la,4 r8 sold4 r8 la4 r8

    %10
    re,4. dod4 re8 mi4. mi,
    la'4 la,8 la'4 la,8 la' si dod re dod si\mbreak
    dod4 mi,8 mi'4 mi,8 la4.\fermata r4 r8

    %13
    R1.*3
    r2. r8 mi' re dod-+ si la
    sold4. mi la la,

    %18
    sold' mi la la,
    lad' fad si si,\mbreak
    lad' fad si4 si,8 si'4 la!8

    %21
    sold(fad mi) la(sold fad)  si(la sold) dod(si la)
    sold(fad mi) la(sold fad)  si(la sold) dod(si la)
    la,4 la'8 sold4-+ la8 si4. si,\mbreak

    %24
    mi'4 mi,8 mi'4 mi,8 mi' si la sold-+ fad mi
    si'4 si,8 si'4 si,8 si' fad mi red-+ dod si
    mi4 mi,8 mi'4 mi,8 mi' si la sold_+ fad mi

    %27
    si'4 r8 mi,4 r8 si'4 si'8 la si la\mbreak
    sold4 la8 si4 sold8 dod,4 red8 mi4 dod8
    fad4 sold8 la4 fad8 si,4 dod8 red4 si8

    %30
    mi4 fad8 sold4 mi8 la,4 si8 dod4 la8
    si4 r8 mi4 r8 red4 r8 mi4 r8\mbreak
    si'4 r8 mi,4 r8 red4 r8 mi4 r8

    %33
    la,4 la'8 sold4 la8 si4. si,
    mi'4 mi,8 mi'4 mi,8 mi fad sold la sold fad
    sold4 mi8 si'4 si,8 mi4. r4 r8\mbreak

    %36
    mi4. la, mi' r4 r8
    si4. mi, si' r4 r8
    mi4. la, mi la

    %39
    mi4 mi'8 red4 mi8 si4. si
    si r4 r8 mi4. mi,
    r2. mi'4. mi,

    %42
    r2. fad'4. fad,
    r2. fad'4. fad,
    si4 dod8 re?4 si8 mi?4 fad8 sold4 mi8

    %45
    la4 si8 dod4 la8 re,4 mi8 fad4 re8
    sold4 la8 si4 sold8\mbreak mid4-+ dod8 fad4 fad,8
    dod'4 r8 fad4 r8 mid4 r8 fad4 r8

    %48
    si,4 si'8 la4 si8 dod4. dod,
    fad'2. fad
    si,4 si,8 si'4 si,8 si' fad mi red dod si\mbreak

    %51
    mi'2. mi
    la,4. re, la re,
    la'4 la'8 sold4-+ la8 mi' si la sold-+ fad mi

    %54
    dod4. la re re,
    dod' la re re,\mbreak
    red' si mi mi,

    %57
    red' si mi mi'4 re8
    dod8(si la) re(dod si) mi(re dod) fad(mi re)
    dod8(si la) re(dod si) mi(re dod) fad(mi re)

    %60
    re,4 re'8 dod4-+ re8 mi4. mi,

}

VIIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown



}

forma = {

    \time 12/8
    \key la\major
    \tempo 2. = 70
    s1.*12
    \bar"|."
    \mark\markup "Fin"
    s1.*48
    \bar "||"
    \mark\markup\center-column{"D.C."\vspace #+0.2"al Fine"}

}

VIIob = {
    \global
    <<\VIIobn \forma>>

}


VIIvlI = {
    \global
    <<\VIIvlIn \forma>>

}

VIIvlII = {
    \global
    <<\VIIvlIIn \forma>>

}

VIIfg = {
    \global
    \clef bass
    <<\VIIfgn \forma>>

}

VIIbc = {
    \global
    \clef bass
    <<\VIIbcn \forma \VIIbfn>>

}


%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 17)


\pointAndClickOff

\paper {

    print-first-page-number = ##t
    first-page-number = #2

}

\bookpart {

    \paper {

        systems-per-page = #4

    }

    \header {
        title = \markup {Sonata 5\super a a quattro [Op. 3/5]}
        composer = \markup \center-column{\vspace #+0.5"J.-J. Cassaneà de Mondonville (1711 - 1772)"}
    }

    \markup \huge {[I.1] Allegro}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.3"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \Ivc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Ibc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \markup \huge {[I.2] Aria - Grazioso}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.3"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \IIvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \markup \huge {[I.3] Allegretto}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.3"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \IIIvc
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IIIbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \paper {

    systems-per-page = #3

}

    \header {
        title = \markup {Sonata 6\super a a quattro con Oboe [Op. 3/6]}
        composer = \markup \center-column{\vspace #+0.5"J.-J. Cassaneà de Mondonville (1711 - 1772)"}
    }

    \markup \huge {[II.1] Allegro}

    \score {

        \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {Oboe}
                    \set Staff.shortInstrumentName = "ob"
                    \set Staff.midiInstrument = #"oboe"
                    \IVob
                >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \IVvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \IVvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.3"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \IVfg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \IVbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

    \paper {

        systems-per-page = #4

    }

    \markup \huge {[II.2] Larghetto}

    \score {

        \new ChoirStaff <<

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \VvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \VvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.3"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \Vfg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \Vbc
            >>
        >>

        \layout {

            #(layout-set-staff-size 17.5)
            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #2
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
                \override StaffGrouper.staff-staff-spacing.padding = #1.5
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

    \paper {

    systems-per-page = #3

}

    \markup \huge {[II.3] Rondeau amoroso}

    \score {

        \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {Oboe}
                    \set Staff.shortInstrumentName = "ob"
                    \set Staff.midiInstrument = #"oboe"
                    \VIob
                >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \VIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \VIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.3"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \VIfg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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

    \markup \huge {[II.4] Giga allegro}

    \score {

        \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup \center-column {Oboe}
                    \set Staff.shortInstrumentName = "ob"
                    \set Staff.midiInstrument = #"oboe"
                    \VIIob
                >>

            \new ChoirStaff <<

                \new Staff <<
                    \set Staff.instrumentName = \markup  {Violino I\super o}
                    \set Staff.shortInstrumentName = "vl1"
                    \set Staff.midiInstrument = #"violin"
                    \VIIvlI
                >>

                \new Staff <<
                    \set Staff.instrumentName = \markup {Violino 2\super o}
                    \set Staff.shortInstrumentName = "vl2"
                    \set Staff.midiInstrument = #"violin"
                    \VIIvlII
                >>
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Violoncello"\vspace #-0.3"Fagotto"}
                \set Staff.midiInstrument = #"bassoon"
                \set Staff.shortInstrumentName = "fg"
                \VIIfg
            >>

            \new Staff <<
                \set Staff.instrumentName = \markup \center-column{"Basso"}
                \set Staff.shortInstrumentName = "bc"
                \set Staff.midiInstrument = #"contrabass"
                \VIIbc
            >>
        >>

        \layout {

            indent = 2\cm

            \context	{
                \Score
                \override StaffGrouper.staffgroup-staff-spacing.padding = #3
                \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
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


