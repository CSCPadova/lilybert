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
   \override TupletNumber.transparent = ##t
   \override TupletBracket.bracket-visibility = ##f
   \terzine\con

}

Ivlgn = \relative do {
  
  <<re'2\\\stemUp\override Stem #'transparent = ##t la\\\stemUp\override Stem #'transparent = ##t fa\\\stemUp\override Stem #'transparent = ##t re\\\stemUp\override Stem #'transparent = ##t la\\\stemDown re,>> <<{la''~la}\\{\stemUp\override Stem #'transparent = ##t mi  mi}\\{\stemUp\override Stem #'transparent = ##t dod dod}\\{\stemDown\override Stem #'transparent = ##f sol la}>>
  
  <<{re'2~re}\\{\stemUp\override Stem #'transparent = ##t la la}\\{\stemUp\override Stem #'transparent = ##t fa fa}\\{\stemUp\override Stem #'transparent = ##t re re}\\{\stemUp\override Stem #'transparent = ##t la la}\\{\stemDown re, re}>>
  
  <<mi''4\\\stemUp\override Stem #'transparent = ##t si\\{\stemDown\override Stem #'transparent = ##f  sold}>> 
  
  <<{la4~la2}\\{\stemUp\override Stem #'transparent = ##t mi4 mi2}\\{\stemUp\override Stem #'transparent = ##t do?4 do2}\\{\stemDown la4 la2}>>
  
  <<{re'2~re1}\\{\stemUp\override Stem #'transparent = ##t la2 la1}\\{\stemUp\override Stem #'transparent = ##t fad2 fad1}\\{\stemUp\override Stem #'transparent = ##t do2 do1}\\{\stemUp\override Stem #'transparent = ##t la2 la1}\\{\stemDown re,2 re1}>>
  
   <<{re''1~re~re2}\\{\stemUp\override Stem #'transparent = ##t sib!1 sib sib2}\\{\stemUp\override Stem #'transparent = ##t sol1 sol sol2}\\{\stemUp\override Stem #'transparent = ##t re1 re re2}\\{\stemUp\override Stem #'transparent = ##t sol,1 sol sol2}\\{\stemDown re1 re re2}>>
   
   <<{mi''2~mi}\\{\stemUp\override Stem #'transparent = ##t do do}\\{\stemUp\override Stem #'transparent = ##t mi, mi}\\{\stemUp\override Stem #'transparent = ##t do do}\\{\stemDown \override Stem #'transparent = ##f sol sol}>>
   
   <<{la'2~la}\\{\stemUp\override Stem #'transparent = ##t fa fa}\\{\stemUp\override Stem #'transparent = ##t do do}\\{\stemDown\override Stem #'transparent = ##f la la}>>
   
   <<{mi''2~mi}\\{\stemUp\override Stem #'transparent = ##t do do}\\{\stemUp\override Stem #'transparent = ##t mi, mi}\\{\stemUp\override Stem #'transparent = ##t do do}\\{\stemDown\override Stem #'transparent = ##f sol sol}>>
   
   <<{la'2~la}\\{\stemUp\override Stem #'transparent = ##t mi mi}\\{\stemUp\override Stem #'transparent = ##t dod dod}\\{\stemDown\override Stem #'transparent = ##f sol sol}>>
   
   <<{re''2~re}\\{\stemUp\override Stem #'transparent = ##t la la}\\{\stemUp\override Stem #'transparent = ##t fa fa}\\{\stemUp\override Stem #'transparent = ##t re re}\\{\stemUp\override Stem #'transparent = ##t la la}\\{\stemDown re, re}>>
   
   <<re''2\\\stemUp\override Stem #'transparent = ##t la\\\stemUp\override Stem #'transparent = ##t fad\\\stemUp\override Stem #'transparent = ##t do\\\stemUp\override Stem #'transparent = ##t la\\\stemDown re,>>
   
    <<re''4\\\stemUp\override Stem #'transparent = ##t sib!\\\stemUp\override Stem #'transparent = ##t sol\\\stemUp\override Stem #'transparent = ##t re\\\stemUp\override Stem #'transparent = ##t sol,\\\stemDown re>>
    
     <<re''\\\stemUp\override Stem #'transparent = ##t la\\\stemUp\override Stem #'transparent = ##t fad\\\stemUp\override Stem #'transparent = ##t do\\\stemUp\override Stem #'transparent = ##t la\\\stemDown re,>>
     
     <<re''2\fermata \\\stemUp\override Stem #'transparent = ##t sib!\\\stemUp\override Stem #'transparent = ##t sol\\\stemUp\override Stem #'transparent = ##t re\\\stemUp\override Stem #'transparent = ##t sol,\\\stemDown re>>
  
}

Ialton = \relative do' {

   \autoBeamOff
   
   fa8 la fa mi16 re dod8 dod r16 mi mi fa
   sol8 sol r16 sol sib sol fa8 fa r4
   fa8 fa16 fa sold8 la mi mi r4\mbreak 
   
   %4
   la8 la do la16 la fad8 fad fad sol16 la
   do,8 do r4 la'8 la16 la do8 sib!
   sol8 sol r4 re8 re re re16 re
   
   %7
   sol8 sol r4\mbreak sol8 sol16 sol sol8 la
   sib sib r16 sib do re mi,!8 mi r4
   sib'8 sib16 sib sib8 la fa fa r4
   
   %10
   do'16 fa, fa8 r fa16 mi\mbreak sol4 r
   sol8 sol16 sol sib8 la la la r mi
   sol sol sol fa fa4 r
   
   %13
   la8 la16 la re8 la\mbreak fad8 fad r16 la do sib
   sol4 r r2
   
}

Itesto = \lyricmode {
  
  Ardo _ taci - to_a -- mante _ e_il foco _  mio _ celar _  non posso, _
  
  e pale - sar non oso. _
  
  Dell'as -- costa _  mia _  fiamma _  raggio _ non spunta, _ e non traspar _ fa -- villa; _
  
  con guardi - gna pu -- pilla, _ con taci - turno _ labro _ v'espri - mo_il foco, _
  
  e lo riman - do_al core _ mise - ro, che sa -- rà?
  
  Pianger _ per chi nol crede, _ pe --  nar per chi nol sa,
  
  doglia _ maggior _ di questa _  amor _ non ha.
  
}

Ibcn = \relative do {
  
  re2 la~
  la re~
  re mi4 la,~
  la2 re2~
  re1
  sol,~
  sol~
  sol 2do~
  do fa,~
  fa\mbreak do'~
  do dod~
  dod re~
  re do
  re sol,\fermata
  
}

Ibfn = \figuremode {

   \bassFigureExtendersOff
   \bassFigureStaffAlignmentDown




}

forma = {

   \key fa\major
   \time 4/4
   \tempo 4 = 55
   s1*14
   \bar "||"

}

Ialto = {
   \new Voice = "ardo"
   \Iglobal
   %\notypeset
   <<\Ialton\forma>>
}

Ivlg = {
   \Iglobal
   \clef bass
   <<\Ivlgn \forma>>
}


Ibc = {
   \Iglobal
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


IIglobal = 	{
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletNumber.transparent = ##t
  \override TupletBracket.bracket-visibility = ##f
  \terzine\con

}

IIvlgn = \relative do {

  <<
    {
      re'16
      re8.[mi16 mi8. fa16] fa8.[sol16 sol8. la16]
      la8 sol16 fa mi32[fa sol mi] fa si, dod re dod8.[si16 la8. re16]
    }\\{
      la
      la8.[la16 la8. la16] la8.[la16 la8. la16]
      la4
  }>>
    sib?16. do32 re16. fa,32 mi16. re'32 do16. sib32 la8.[sol16 fa8 do']

    %4
    \tuplet 3/2 { re16 (sib la sib[do re)] mi(do sib do[re mi)] fa(re do re[mi fa)] sol(mi re mi[fa sol)]}\mbreak
    \senza \tuplet 3/2 { la sol fa sol[fa mi] re do sib la[sol fa] \clef bass \key fa\major mi re do } fa[la] sol8(sol16\tr) fa
    fa8.\clef tenor la16 la32[re re re] la re re re si[re re re] si re re re si[mi mi mi] si mi mi mi

    %7
    dod mi mi mi dod[mi mi mi] dod fa fa fa dod[fa fa fa] re fa fa fa re[fa fa fa]\mbreak re sol sol sol re[sol sol sol]  %%% inizio ultimo sistema p 3
    dod, la la la re[la la la] mi' la, la la fa'[la, la la] sol' la, la la la'[la, la la] sib' la, la la do'[la, la la]
    re'4 \clef bass \key fa\major \tuplet 4/3 {re,16 [do32 sib la sol fa mi] re re' do sib la sol fa mi re [re do sib la sol fa mi] re[re' do sib la sol fa mi]}

    %10
    \con \tuplet 3/2 { \once\stemUp re16(\clef tenor \key fa\major fa'' mi) fa[(mi re)] la (fa' mi) fa[(mi re)] } la la(sib!) si(do) dod(re) mi(
    fa) fad(sol) sold(la) dod, re mi <<{mi4.-+ re8}\\la2>>
    <<re4\\\stemUp\override Stem #'transparent = ##t la\\\stemUp\override Stem #'transparent = ##t fa\\\stemDown re>> r \clef bass \key fa\major re8 mi fa re

    %13
    la' la, la[la'] sol sib dod, la
    re re, re re'\mbreak re fa re fa
    mi fad sold mi la re, mi[mi,]
    
    %16
    \clef tenor \key fa\major la'32 mi mi mi la[mi mi mi] si'[mi, mi mi] do' mi, mi mi re' [mi, mi mi] mi' [mi, mi mi] fad' mi, mi mi sold'[mi, mi mi]
    la'16 mi re do <<{si8.\tr la16}\\mi4>>\mbreak la4 \clef bass \key fa\major la8 do
    la fad re fad sol sol, sib'?[sol]
    
    %19
    do mi, do mi fa mi fa re
    \tuplet 3/2 { sol16(la si) si[(do re)] } sol,8 sol, \tuplet 3/2 { la'16[(si dod)] dod[(re mi)] } la,8 la,
    \tuplet 3/2 { sib'?16(do? re) sib[(do la)] } sol8 sol,\mbreak sol2
    
    %22
    la8 si dod la re sol la[la,]
    re mi fa re \clef tenor  \key fa\major fa'16 sol fa sol mi fa mi fa  %%% ripresa
    re8 re, r re'16 mi fa sol fa sol mi fa mi fa
    
    %25
    \tuplet 3/2 { re mi re mi[re dod] re mi re mi[re dod] } re8 r16 re re8(dod16\tr) re
    \clef bass \key fa\major re,8 mi fa re \clef tenor  \key fa\major fa'16 sol fa sol mi fa mi fa  %%% ripresa
    re8 re, r re'16 mi fa sol fa sol mi fa mi fa
    
    %28
    \tuplet 3/2 { re mi re mi[re dod] re mi re mi[re dod] } re8 r16 re re8(dod16\tr) re
    re1\fermata^\markup\italic\right-align {"Nota autografa di Vivaldi: ”Segue Cadenza con Viola all'Inglese”"}

  }

  IIalton = \relative do' {

    \autoBeamOff
    r16
    R1*11
    r4 re8 fa la fa re fa
    fa mi mi sol sib sol mi sol
    
    %14
    sol fa sib re,\mbreak sib' re sib la
    sold4. si16 re do8 si16[la] sold8. la16
    la4 r r2
    
    %17
    r r4 mi8 la
    do la fad la sib16[la] sol8 sib re
    mi, sol do, sib' sib la la la,
    
    %20
    si4~\con \tuplet 3/2 { si16 [sol' fa] mi[fa re] } dod4~\tuplet 3/2 { dod16 [la' sol] fa[sol mi] }
    re4~\tuplet 3/2 { re16 [sib' la] sol[la fa] mi [sol fa] mi[fa re] dod [mi re] dod[re si] }
    la[sol] la8 r la'16 sol fa8 mi16[re] dod8.[re16]
    
    %23
    re4 r8 fa16 sol la[sib la sib] sol[la sol la]
    fa4 r8 fa16[sol] la[sib la sib] sol[la sol la]
    \con \tuplet 3/2 { fa[sol fa] sol[fa mi] fa[sol fa] sol[fa mi]} fa[la re] re, fa8[mi16] re
    
    %26
    re4 r8 fa16 sol la[sib la sib] sol[la sol la]
    fa4 r8 fa16[sol] la[sib la sib] sol[la sol la]
    \con \tuplet 3/2 { fa[sol fa] sol[fa mi] fa[sol fa] sol[fa mi]} fa[la re] re, fa8[mi16] re
    
    %29
    re1

  }

  IItesto = \lyricmode {
    
    L'ado -  rar beltà _ che pia -- ce, e celar _ del cor la face _
    
    è_il mag -- gior d'ogni _ mar -- tir è_il mag -- gior d'ogni _ mar -- tir.
    
    Chi non sco -- pre_il suo tor --  mento _  nel suo duol vive _ con -- tento,  _ 
    
    e non mer - - - - - - - - - - ta, e non merta _ di_gio -- ir 
    
    e non mer - - - - - - - - - - ta di gio -- ir, e non mer - - - - - - - - - - ta di gio -- ir.

  }

  IIbcn = \relative do {
    
    r16
    re4 dod re mi
    fa sol la fa
    sol do, fa8 sol la fa
    
    %4
    sib,4 do re mi\mbreak
    fa8 do sib[fa'] do re do do,
    fa' fa fa[fa] sol sol sol[sol]
    
    %7
    la la la[la] sib sib sib,[sib]
    la1~
    la~
    
    %10
    la~
    la
    re4 r re8 mi fa re
    
    %13
    la' la, la4 sol'8 sib dod, la
    re re, re4\mbreak re'8 fa re fa
    mi fad sold mi la re, mi mi,
    
    %16
    la4 sold8 la si do re[mi]
    do re mi mi,\mbreak la4 la'8 do
    la fad re fad sol sol, sib' sol
    
    %19
    do mi, do mi fa mi fa re
    sol,4 r la r
    sib r\mbreak sol2
    
    %22
    la8 si dod la re sol la[la,]
    re mi fa re re4 r
    re r re r
    
    %25
    re r re la
    re8 mi fa re re4 r
    re r re r
    
    %28
    re r re la
    re1\fermata
    
  }

  IIbfn = \figuremode {

    \bassFigureExtendersOff
    \bassFigureStaffAlignmentDown




  }

  forma = {

    \key fa\major
    \time 4/4
    \tempo 4 = 50
    \partial 16 s16
    s1*29
    \bar "|."

  }

  IIalto = {
    \new Voice = "beltà"
    \IIglobal
    %\notypeset
    <<\IIalton\forma>>
  }

  IIvlg = {
    \IIglobal
    \clef tenor
    <<\IIvlgn \forma>>
  }


  IIbc = {
    \IIglobal
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
#(set-global-staff-size 17)


\pointAndClickOff

\paper {

   systems-per-page = #5
   print-first-page-number = ##t
   first-page-number = #2

}

\header {
   title = \markup {"Cantata in Scena con Viola all'Inglese" "[RV 719]"}
   composer = \markup \center-column{"   ""A. Vivaldi (1678 -1741)"}
}

\markup \huge {[1. Recitativo]}

\score {

    \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \set Staff.instrumentName =  \markup \center-column{"Viola"\vspace #-0.2"all'Inglese"}
                \Ivlg
            >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key fa\major\time 4/4  fa'8^\markup \center-align"[Contralto]"}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \Ialto
            \new Lyrics \lyricsto "ardo" \Itesto
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \set Staff.instrumentName = \markup \center-column{"[Basso]"}
            \Ibc
        >>
    >>

    \layout {

        indent = 2\cm
        incipit-width = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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

\pageBreak

\markup \huge {[2.] Largo}

\score {

    \new ChoirStaff <<

            \new Staff <<
                \set Staff.midiInstrument = #"viola"
                \IIvlg
            >>

        \new Staff <<
            \set Staff.instrumentName = \markup \center-column{""}
            \incipit { \clef alto \key fa\major\time 4/4  r16}
            \clef "treble_8"
            \set Staff.midiInstrument = #"voice oohs"
            \IIalto
            \new Lyrics \lyricsto "beltà" \IItesto
        >>

        \new Staff <<
            \set Staff.midiInstrument = #"contrabass"
            \IIbc
        >>
    >>

    \layout {

        indent = 1.5\cm
        incipit-width = 1.5\cm

        \context	{
            \Score
            \override StaffGrouper.staff-staff-spacing.basic-distance = #3
            \override StaffGrouper.staff-staff-spacing.basic-distance = #8
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
