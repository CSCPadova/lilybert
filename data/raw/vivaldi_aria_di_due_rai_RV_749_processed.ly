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


global = 	{
   \override Score.MetronomeMark.transparent = ##t
   \override Score.BarNumber.font-size = #0.5
   \override Score.BarNumber.padding = #1.3
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \terzine\con

}

sopranon = \relative do'' {

   \autoBeamOff
   r8
   R1*10
   fa,8[sol] la[sib] do4 r8 fa
   mi[re] do sib la[sol] fa4

   %13
   la4. do8 sol4. do8
   fa,4. re'8 mi,[do'16 sib] do[sib la sol]
   fa8[re'16 do] re[do si la]sol8[mi'16 re mi re do si]

   %16
   la8[fa'16 mi fa mi re do] si8[sol16 la si do re mi]
   fa8 mi16 re mi8 re16[do]\mbreak re2\tr
   do4 r r2

   %19
   R1*2
   do4. re8 si4 r8 do
   re[si] sol fa fa4 mi\mbreak

   %23
   fa8[sol] la[sib] do2\tr~
   do~do~
   do r8 do16[sib la8 sol16 fad]

   %26
   re'1\tr~
   re
   r8 re16[do si8 la16 sold] mi'2~\tr

   %29
   mi1~\mbreak
   mi2 r8 mi16[re do8 sib!16 la]
   fa'8 fa, r do' do[fa] fa[mib]

   %32
   re[fa16 mib re8 do16 sib] sol' [la sol fa] mi? [fa mi re]
   do8[mi16 re do8 sib16 la] fa'[sol fa mi] re[mi re do]
   sib8[re16 do sib8 la16 sol] mi' [fa mi re] do [re do sib]

   %35
   la4 r8 fa16[sol] la[sib la sib] do8\tr[sib16 la]\mbreak
   sib[do sib do] re8\tr [do16 sib] do[re do re] mi8\tr [re16 do]
   re[mi re mi] fa8\tr [mi16 re] mi8 re16 do fa8 fa,

   %38
   sol2 fa4 r8 fa
   fa[la] do[la] fa[la do la]
   fa16[sol la sib] do8 sib la sol16[fa] sol4\tr

   %41
   fa r r2\mbreak
   R1*5
   r2 la4(re8) fa

   %48
   mi4 la, r8 sib la sol
   sol fa r4 la8[re] re do
   sib[sol] sol fa mi[do'] do[sib]

   %51
   la[fa'] fa[mi] re[sib] sib la
   sol[mi'] mi re\mbreak dod[la] la[sol]
   fa4 r8 re' dod[mi16 re dod8 si16 la]

   %54
   sol4. mi'8 dod[si16 la sol8 fa16 mi]
   fa8 la re fa dod2
   re4 r la8[re] fa la,

   %57
   sold[mi] do' la sold2
   \parenthesize la1\fermata

}

testo = \lyricmode {

    Di due rai langui - re costan - te par piace - re_ed è tor -- men - - - - - -  - to ed è tor -- men -- to.

    Di due rai langui - re al lu -- me par piace -  - - - -  - - re ed è tor -- men - - - - - - - - - - - - - - - - - - - to ed è tor -- men -- to  ed è

    tormen - - to  ed è tormen - to.

    Deh mi rendi _ arcie - ro Nume _ meno _  a -- mante _ e più conten - to meno _ a -- mante _ e più

    conten - - - - - - - - to  con -- ten -- to e più con -- tento _ con -- ten -- to.





}

flIn = \relative do'' {

    do8
    fa16 la do8~do16 la sol fa sol fa mi re do8 sol'
    \tuplet 3/2 { la16(sol fa) do'[(sib la)] }  fa'8 la, \tuplet 3/2 { sol16 fa mi fa[mi re] } do4
    R1

    %4
    r2 r4 r16 do' re mi
    fa do re  mi fa mi re do re4\tr r16 sib do re
    mi sib do re mi re do sib\mbreak do4\tr r16 la sib do

    %7
    re la sib do re do sib la sib4\tr r16 sol la sib
    do mi, sol do do mi, sol do do fa, la do do fa, la do
    do mi, sol do do mi, sol do do fa, la do do fa, la do

    %10
    do fa, sol do do fa, sol do do mi, sol do do mi, sol do\mbreak
    la4 r r2
    R1*6

    %18
    mi16 sol sol do do sol sol mi mi do' sol do mi, do' sol do
    re, sol sol do do sol sol re re do' sol do re, do' sol do
    re, sol sol si si sol sol re re si' sol si re, si' sol si

    %21
    do4 r r2
    R1
    r2 r16 la sol la sib? la sol la

    %24
    do, fa mi fa sol fa mi fa do la' sol la sib la sol la
    do, fa mi fa sol fa mi fa do4 r
    r16 sib' la sib do sib la sib re, sol fad sol la sol fad sol

    %27
    re sib' la sib do sib la sib re, sol fad sol la sol fad sol
    re4 r r16 do' si do re do si do
    mi, la sold la si la sold la mi do' si do re do si do\mbreak

    %30
    mi, la sold la si la sold  la mi4 r
    R1*4
    r16 la sol? la do la sol la fa4 r\mbreak

    %36
    R1*2
    r2 la16 sol la8 r la
    la16 sol la8 r la la16 sol la8 r la

    %40
    la16 sol la8 r4 r r16 do re mi
    fa do re mi fa mi re do re4\tr r16 sib do re\mbreak
    mi sib do re mi re do sib do4\tr r16 la sib do

    %43
    re la sib do re do sib la sib4\tr r16 sol la sib
    do mi, sol do do mi, sol do do fa, la do do fa, la do
    do mi, sol do do mi, sol do do fa, la do do fa, la do

    %46
    do fa, sol do do fa, sol do do mi, sol do do mi, sol do\mbreak
    la4\fermata r r2
    R1

    %49
    r2 re,16 la' fa la re, re'8 do16
    sib re sib re sol, sol8 fa16 mi sol mi sol do, do'8 sib16
    la do la do fa, fa8 mi16 re fa re fa sib, sib'8 la16

    %52
    sol sib sol sib mi, mi8 re16\mbreak dod mi dod mi la, la'8 sol16
    fa la fa la re,8 fa mi16 sol sib sol dod, sol' sib sol
    la, sol' sib sol dod, sol' sib sol la, sol' sib sol dod, mi sol mi

    %55
    re4 r r2
    re16 la' fa la re, re'8 la16 re, la' fa la re, re'8 la16
    si4 r r2

    %58
    R1

}

flIIn = \relative do'' {

    r8
    R1
    r2 r4 r8 do
    fa16 la do8~do16 la sol fa sol fa mi re do8 sol'

    %4
    \tuplet 3/2 { la16 sol fa do'[sib la] }  fa'8 la, \tuplet 3/2 { sol16 fa mi fa[mi re] } do4
    r4 r16 fa sol la sib fa sol la sib la sol fa
    sol4\tr r16 mi fa sol\mbreak la mi fa sol la sol fa mi

    %7
    fa4\tr r16 re mi fa sol re mi fa sol fa mi re
    mi do mi sol sol do, mi sol la do, fa la la do, fa la
    sol do, mi sol sol do, mi sol la do, fa la la do, fa la

    %10
    sol do, fa sol sol do, fa sol sol do, mi sol sol do, mi sol\mbreak
    fa4 r r2
    R1*6

    %18
    do16 mi mi sol sol mi mi do do sol' mi sol do, sol' mi sol
    do, re re sol sol re re do do sol' re sol do, sol' re sol
    si, re re sol sol re re si si sol' re sol si, sol' re sol

    %21
    mi4 r r2
    R1
    r2 r16 fa  mi fa sol fa mi fa

    %24
    do la' sol la sib la sol la do, fa mi fa sol fa mi fa
    do la' sol la sib la sol la do,4 r
    r16 sol' fad sol la sol fad sol re sib' la sib do sib la sib

    %27
    re, sol fad sol la sol fad sol re sib' la sib do sib la sib
    re,4 r r16 la' sold la si la sold la
    mi do' si do re do si do mi, la sold la si la sold la\mbreak

    %30
    mi do' si do re do si do mi,4 r
    R1*4
    r16 fa mi fa la fa mi fa do4 r\mbreak

    %36
    R1*2
    r2 fa16 mi fa8 r fa
    fa16 mi fa8 r fa fa16 mi fa8 r fa

    %40
    fa16 mi fa8 r4 r2
    r4 r16 fa sol la sib fa sol la sib la sol fa\mbreak
    sol4\tr r16 mi fa sol la mi fa sol la sol fa mi

    %43
    fa4\tr r16 re mi fa sol re mi fa sol fa mi re
    mi do mi sol sol do, mi sol la do, fa la la do, fa la
    sol do, mi sol sol do, mi sol la do, fa la la do, fa la

    %46
    sol do, fa sol sol do, fa sol sol do, mi sol sol do, mi sol\mbreak
    fa4\fermata r r2
    R1

    %49
    r2 la,16 fa' re fa la, la'8 fa16
    sol sib sol sib re, sib'8 re,16 do mi do mi sol, sol'8 mi16
    fa la fa la do, la'8 do,16  sib re sib re fa, fa'8 re16

    %52
    mi sol mi sol sib, sol'8 sib,16\mbreak  la dod la dod mi, mi'8 dod16
    re fa re fa la,8 re dod16 mi sol mi la, mi' sol mi
    dod mi sol mi la, mi' sol mi dod mi sol mi la, sol' sib sol

    %55
    fa4 r r2
    la,16 fa' re fa la, la'8 fa16 la, fa' re fa la, la'8 fa16
    mi4 r r2

    %58
    R1

}

vlIn = \relative do'' {

    fa8
    la la4 la8 sol sol4 sol8
    la la4 la8 sol mi r fa
    la la4 la8 sol sol4 sol8

    %4
    la la4 la8 sol4 r
    r r8 fa sib sib4 la8
    sol sol4 sol8\mbreak la la4 sol8

    %7
    fa fa4 fa8 sol sol4 fa8
    mi do r sol' la fa r la
    sol mi r sol la fa r la

    %10
    sol fa r sol sol mi r sol\mbreak
    fa4 r r2
    R1*6

    %18
    do'8 do4 do8 do do4 do8
    do do4 do8 do do4 do8
    si si4 si8 si si4 si8

    %21
    do4 r r2
    R1
    r2 la8 r sol r

    %24
    la r sol r la r sol r
    la r sol r la4 r
    sib8 r la r sib r la r

    %27
    sib8 r la r sib r la r
    sib4 r do8 r si r
    do r si r do r si r\mbreak

    %30
    do r si r do4 r
    r2 r4 r8 fa,
    sib sib4 la8 sol sol4 sol8

    %33
    la la4 sol8 fa fa4 fa8
    sol sol4 fa8 mi mi4 mi8
    fa4 r r2\mbreak

    %36
    R1*5
    r4 r8 fa sib sib4 la8\mbreak
    sol sol4 sol8 la la4 sol8

    %43
    fa fa4 fa8 sol sol4 fa8
    mi do r sol' la fa r la
    sol mi r sol la fa r la

    %46
    sol fa r  sol sol mi r sol\mbreak
    la4\fermata r r2
    R1*11

}

vlIIn = \relative do'' {

    do8
    fa fa4 fa8 mi mi4 mi8
    fa fa4 fa8 mi do r do
    fa fa4 fa8 mi8 mi4 mi8

    %4
    fa fa4 fa8 mi4 r8 do
    fa fa4 mib8 re re4 re8
    mi? mi4 re8\mbreak do do4 do8

    %7
    re re4 do8 sib sib4 sib8
    do sol r mi' fa do r fa
    mi do r mi fa do r fa

    %10
    fa do r fa mi do r mi\mbreak
    fa4 r r2
    R1*6

    %18
    mi8 mi4 mi8 mi mi4 mi8
    re re4 re8 re re4 re8
    re re4 re8 re re4 re8

    %21
    mi4 r r2
    R1
    r2 fa8 r mi r

    %24
    fa r mi r fa r mi r
    fa r mi r fa4 r
    sol8 r fad r sol r fad r

    %27
    sol r fad r sol r fad r
    sol4 r la8 r sold r
    la r sold r la r sold r\mbreak

    %30
    la r sold r la4 r
    r r8 do, fa fa4 mib8
    re re4 re8 mi mi4 re8

    %33
    do do4 do8 re re4 do8
    sib sib4 sib8 do do4 sib8
    la4 r r2\mbreak

    %36
    R1*4
    r2 r4 r8 do
    fa fa4 mib8 re re4 re8\mbreak

    %42
    mi? mi4 re8 do do4 do8
    re re4 do8 sib sib4  sib8
    do sol r mi' fa do r fa

    %45
    mi do r mi fa do r fa
    fa do r fa mi do r mi\mbreak
    fa4\fermata r r2

    %48
    R1*11

}

vlan = \relative do' {

    fa8_\markup\italic"Violette pizzicate"
    fa fa fa fa do' do, do do
    fa fa fa fa do4 r8 fa
    fa fa fa fa do' do, do do

    %4
    fa fa fa fa do do' do sib
    la la la la sib sib sib sib
    mi, mi mi mi\mbreak la la la la

    %7
    re, re re re sol sol sol sol
    do, do do do fa fa fa fa
    do do do do fa fa fa fa

    %10
    do' do do do do, do do do\mbreak
    fa4 r r2
    R1*6
    do8 do do do do do do do

    %19
    sol' sol sol sol sol, sol sol sol
    sol' sol sol sol sol, sol sol sol
    do re mi fa sol fa mi do

    %22
    sol la si sol do re mi do\mbreak
    fa,4 r fa'8 fa, r do'
    fa fa, r do' fa fa, r do'

    %25
    fa fa, r do' fa la fad re
    sol sol, r re' sol sol, r re'
    sol sol, r re' sol sol, r re'

    %28
    sol re' sold, mi la la, r mi'
    la la, r mi' la la, r mi'\mbreak
    la la, r mi' la sib! la sol

    %31
    fa fa fa fa fa la la la
    sib sib sib sib mi, mi mi mi
    la la la la re, re re re

    %34
    sol sol sol sol do, do do do
    fa fa fa fa fa fa la fa\mbreak
    r sol sib sol r la do la

    %37
    r sib re sib do sib la fa
    do' sib do do, fa fa fa fa
    fa fa fa fa fa fa fa fa

    %40
    fa fa mi do fa fa do4
    fa,8 la' la la sib sib sib sib\mbreak
    mi, mi mi mi la la la la

    %43
    re, re re re sol sol sol sol
    do, do do do fa fa fa fa
    do do do do fa fa fa fa

    %46
    do' do do do do, do do do\mbreak
    fa,4\fermata r re'8 mi fa re
    la si dod la re sol dod, la

    %49
    re mi fa mi re4 re
    sol sol do, do
    fa fa sib, sib

    %52
    mi mi\mbreak la, la
    re re la la
    la la la la

    %55
    re re la' la,
    re re re re
    mi la, mi' mi,

    %58
    la1\fermata

}

bcn = \relative do {

    fa8_\markup\italic"Senza Cembali ma Violoni e Violoncello pizzicati"
    fa fa fa fa do' do, do do
    fa fa fa fa do4 r8 fa
    fa fa fa fa do' do, do do

    %4
    fa fa fa fa do do' do sib
    la la la la sib sib sib sib
    mi, mi mi mi\mbreak la la la la

    %7
    re, re re re sol sol sol sol
    do, do do do fa fa fa fa
    do do do do fa fa fa fa

    %10
    do' do do do do, do do do\mbreak
    fa_\markup\italic"[Con] Cembali, e Bassi pizzicati" mi fa sol la sol la fa
    do re mi do fa sol la sol

    %13
    fa mi fa re mi re mi do
    re do re sol, do re mi do
    re mi fa re mi fa sol mi

    %16
    fa sol la fa sol, sol' sol, sol'
    sol, sol' sol, sol'\mbreak sol, sol' sol, sol'
    do,_\markup\italic"Senza Cembali" do do do do do do do

    %19
    sol' sol sol sol sol, sol sol sol
    sol' sol sol sol sol, sol sol sol
    do re mi fa sol fa mi do

    %22
    sol la si sol do re mi do\mbreak
    fa,4 r fa'8 fa, r do'
    fa fa, r do' fa fa, r do'

    %25
    fa fa, r do' fa la fad re
    sol sol, r re' sol sol, r re'
    sol sol, r re' sol sol, r re'

    %28
    sol re' sold, mi la la, r mi'
    la la, r mi' la la, r mi'\mbreak
    la la, r mi' la sib! la sol

    %31
    fa fa fa fa fa la la la
    sib sib sib sib mi, mi mi mi
    la la la la re, re re re

    %34
    sol sol sol sol do, do do do
    fa fa fa fa fa fa la fa\mbreak
    r sol sib sol r la do la

    %37
    r sib re sib do sib la fa
    do' sib do do, fa fa fa fa
    fa fa fa fa fa fa fa fa

    %40
    fa fa mi do fa fa do4
    fa,8_\markup\italic"Con Cembali" la' la la sib sib sib sib\mbreak
    mi, mi mi mi la la la la

    %43
    re, re re re sol sol sol sol
    do, do do do fa fa fa fa
    do do do do fa fa fa fa

    %46
    do' do do do do, do do do\mbreak
    fa,4\fermata r_\markup\italic"Senza Cembali" re'8 mi fa re
    la si dod la re sol dod, la

    %49
    re mi fa mi re4 re
    sol sol do, do
    fa fa sib, sib

    %52
    mi mi\mbreak la, la
    re re la la
    la la la la

    %55
    re re la' la,
    re re re re
    mi la, mi' mi,

    %58
    la1\fermata

}

bfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}

forma = {

   \key fa\major
   \time 4/4
   \tempo 2 = 40
   \partial 8 s8
   s1*58
   \bar "||"
   \mark\markup\smaller "D.C."

}

soprano = {
   \new Voice = "rai"
   \global
   %\notypeset
   <<\sopranon\forma>>
}


flI = {
   \global
   \clef violin
   <<\flIn \forma>>
}


flII = {
   \global
   \clef violin
   <<\flIIn \forma>>
}


vlI = {
   \global
   \clef violin
   <<\vlIn \forma>>
}


vlII = {
   \global
   \clef violin
   <<\vlIIn \forma>>
}


vla = {
   \global
   \clef alto
   <<\vlan \forma>>
}


bc = {
   \global
   \clef bass
   <<\bcn \forma \bfn>>
   \typeset
}



%{
convert-ly (GNU LilyPond) 2.20.0  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49,
2.19.80, 2.20.0
%}
#(set-global-staff-size 16)


\pointAndClickOff

\paper {

   systems-per-page = #3
   print-first-page-number = ##t
   first-page-number = #2

}

\header {
   title = \markup\huge"”Di due rai languire costante” [RV 749 / Rinaldi Op. 312/9]"
   composer = \markup \center-column{"   ""A. Vivaldi (1678 -1741)"}
}

\markup \huge {Allegro non molto }

\score {

    \new ChoirStaff <<

        \new PianoStaff   <<

            \new Staff <<
                \set PianoStaff.instrumentName =  \markup \center-column{"2 Flasolet""[Flageolets]"}
                \set Staff.midiInstrument = #"recorder"
                \flI
            >>

            \new Staff <<
                \set Staff.midiInstrument = #"recorder"
                \flII
            >>
        >>

        \new PianoStaff    <<

            \new Staff <<
                \set Staff.midiInstrument = #"violin"
                \set PianoStaff.instrumentName =  \markup \center-column{"Violini""Sordini"}
                \vlI
            >>

        \new Staff <<
            \set Staff.midiInstrument = #"violin"
            \vlII
        >>
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef bass \key fa\major\time 4/4  fa8^\markup \right-align"Violette"}
            \clef alto
            \set Staff.midiInstrument = #"pizzicato strings"
            \vla
        >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef soprano \key fa\major\time 4/4  r8^\markup \right-align"[Soprano]"}
            \clef violin
            \set Staff.midiInstrument = #"voice oohs"
            \soprano
            \new Lyrics \lyricsto "rai" \testo
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"pizzicato strings"
            \set Staff.instrumentName = \markup \center-column{"Cembalo"\vspace #-0.2"Violone"\vspace #-0.2"Violoncello"}
            \bc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #4
            \override StaffGrouper.staff-staff-spacing.basic-distance = #6
            \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)
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
