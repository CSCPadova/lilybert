\language "italiano"
	%********************************** VARIABILI
\version "2.18.0"

acc = \once \override Stem.stroke-style = #"grace"

tr = \trill

su = \change Staff = up

giu = \change Staff = down

tremb = ^\markup {\musicglyph #"scripts.trill_element"}

dolce = _\markup\italic"dolce"

ten = _\markup \italic \center-align "ten"

arco = _\markup \italic "con l'arco"

noarco = _\markup \italic "senz'arco"

pizz = _\markup \italic "pizzicato"

soli = ^\markup \italic { Soli }

solo = ^\markup \italic { Solo }

tu = _\markup \italic "Tutti"

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
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza
}


IvlIn =  \relative do'' {

  r8
  sol,32(mi' si') mi, sol,[(mi' si') mi,] sol,32(mi' si') mi, sol,[(mi' si') mi,] <<
    {
      la,(mi' do') mi, la,[(mi' do') mi,] la,(mi' do') mi, la,[(mi' do') mi,] si(red la') red,
      si[(red la') red,] si(red la') red, si[(red la') red,] sol,(mi' si') mi, sol,[(mi' si') mi,] sol,(mi' si') mi, sol,[(mi' si') mi,]
      mi(si'sol') si, mi,[(si' sol') si,] mi,(si'sol') si, mi,[(si' sol') si,] mi,(do' sol') do, mi,[(do' sol') do,] mi,(do' sol') do, mi,[(do' sol') do,]

      %4
      mi,(do' la') do, mi,[(do' la') do,] mi,(do' la') do, mi,[(do' la') do,] fad,(red' la') red, fad,[(red' la') red,] fad,(red' la') red, fad,[(red' la') red,]
      mi,(si' sol') si, mi,[(si' sol') si,] mi,(si' sol') si, mi,[(si' sol') si,]
    }

    \new Staff \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0.5) (padding . +0.0))
      \remove "Time_signature_engraver"
      alignAboveContext = #"main" fontSize = #-3
      \override StaffSymbol #'staff-space = #(magstep -3)
      \override StaffSymbol #'thickness = #(magstep -3)
    }
    {
      \set Staff.midiInstrument = #"violin"

      <<
        {
          \key mi\minor do2^\markup\italic\smaller"Manoscritto"
          la si
          sol' sol
          la la
          sol
        }\\{
          \stemUp \override Stem #'transparent = ##t mi,
          red mi
          si' do
          do red
          si
        }\\{
          \stemDown la,
          si sol
          mi' mi
          mi fad
          mi
        }
      >>
    }
  >>

  <<sol'8\\\stemUp\override Stem #'transparent = ##t si,\\\stemDown mi,>> r r32 fad'\p[mi re] dod16-. si-.\mbreak
  lad8-. sol!-. fad-. mi-. re-. si-. r4

  %7
  fad''8\f r r32 mi\p[re dod] si16-. la?-. sol8-. fad-. mi-. re-.
  do! la r4 mi''8\f r r32 re\p[do si] la16-. sol-.
  fad8-. mi-. red-. do!-. si-. sol-. r4

  %10
  <<
    {sol32\f(mi' si') mi, sol,[(mi' si') mi,] sol,32(mi' si') mi, sol,[(mi' si') mi,] la,(mi' do') mi, la,[(mi' do') mi,] la,(mi' do') mi, la,[(mi' do') mi,]}

    \new Staff \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0.5) (padding . +0.0))
      \remove "Time_signature_engraver"
      alignAboveContext = #"main" fontSize = #-3
      \override StaffSymbol #'staff-space = #(magstep -3)
      \override StaffSymbol #'thickness = #(magstep -3)
    }
    {
      \set Staff.midiInstrument = #"violin"

      <<
        {
          \key mi\minor si'2 do
        }\\{\stemUp\override Stem #'transparent = ##t mi, mi}\\{\stemDown sol, la}
      >>
    }
  >>

  <<si'8\\\stemUp\override Stem #'transparent = ##t mi,\\\stemDown sol,>> r r32 mi''[re do] si16 la sol8-. sol,-. la-. si-.
  mi4 r32 mi'\p[re do] si16 la\mbreak sol8 sol, la si

  %13
  mi4 r r2
  r mi32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]
  mi4 r mi32 la do la mi[la do la] mi la do la mi[la do la]

  %16
  red,4 r mi32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]\mbreak
  mi4 r r2
  R1*7

  %25
  re32 si' fa' si, re,[si' fa' si,] re, si' fa' si, re,[si' fa' si,] <<
    {
      mi, si' sol' si, mi,[si' sol' si,] mi, si' sol' si, mi,[si' sol' si,]\mbreak
      fad lad mi' lad, fad[lad mi' lad,] fad lad mi' lad, fad[lad mi' lad,] re, si' fa' si, re,[si' fa' si,] re, si' fa' si, re,[si' fa' si,]
    }

    \new Staff \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0.5) (padding . +0.0))
      \remove "Time_signature_engraver"
      alignAboveContext = #"main" fontSize = #-3
      \override StaffSymbol #'staff-space = #(magstep -3)
      \override StaffSymbol #'thickness = #(magstep -3)
    }
    {
      \set Staff.midiInstrument = #"violin"

      <<
        {
          \key mi\minor sol'2
          mi fad
        }\\{
          \stemUp\override Stem #'transparent = ##t si,
          lad si
        }\\{
          \stemDown mi,
          fad re
        }
      >>
    }
  >>

  <<sol'8\\\stemUp\override Stem #'transparent = ##t si,\\\stemDown mi,>> \parenthesize r8 r32 fad'?[mi re?] dod16 si lad8-. si-. mi,-. fad-.

  %28
  si,4 r r2
  R1*9
  r2 <<
    {
      la'32(do mi) do la[(do mi) do] la32(do mi) do la[(do mi) do]

      %39
      la(re fa) re la[(re fa) re] la(re fa) re la[(re fa) re] sold,( si mi) si sold[(si mi) si] sold( si mi) si sold[(si mi) si]\mbreak
      la(do mi) do la[(do mi) do] la(do mi) do la[(do mi) do] si,(red la') red, si[(red la') red,] si(red la') red, si[(red la') red,]
    }

    \new Staff \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0.5) (padding . +0.0))
      \remove "Time_signature_engraver"
      alignAboveContext = #"main" fontSize = #-3
      \override StaffSymbol #'staff-space = #(magstep -3)
      \override StaffSymbol #'thickness = #(magstep -3)
    }
    {
      \set Staff.midiInstrument = #"violin"

      <<
        {
          \key mi\minor mi'2
          fa mi
          mi la,
        }\\{
          \stemUp\override Stem #'transparent = ##t do
          re si
          do red,
        }\\{
          \stemDown la'
          la sold
          la si,
        }
      >>
    }
  >>

  <<sol''8\\\stemUp\override Stem #'transparent = ##t si,\\\stemDown mi,>> r8 r32 fad'\p[mi re] do16 si la8-. sol-. fad-. mi-.

  %42
  red-. si-. r4 fad''8\f r r32 mi\p[re dod] si16 la
  sol8-. fad-. mi-. re-. do-. la-. r4

  <<
    { sol32(mi' si') mi, sol,[(mi' si') mi,] sol,(mi' si') mi, sol,[(mi' si') mi,] la,(mi' do') mi, la,[(mi' do') mi,] la,(mi' do') mi, la,[(mi' do') mi,] }

    \new Staff \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0.5) (padding . +0.0))
      \remove "Time_signature_engraver"
      alignAboveContext = #"main" fontSize = #-3
      \override StaffSymbol #'staff-space = #(magstep -3)
      \override StaffSymbol #'thickness = #(magstep -3)
    }
    {
      \set Staff.midiInstrument = #"violin"

      <<
        {
          \key mi\minor si'2 do
        }\\{\stemUp\override Stem #'transparent = ##t mi, mi}\\{\stemDown sol, la}
      >>
    }
  >>


  %45
  <<si'8\\\stemUp\override Stem #'transparent = ##t mi,\\\stemDown sol,>> r r32 mi''[re do] si16 la sol8 sol, la si
  mi4 r r2
  R1*3

  %50
  si'32 red fad red si[red fad red] si red fad red si[red fad red] si4 r\mbreak
  R1*2
  r2 mi,32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]

  %54
  mi4 r r8 fad' fad fad
  fad2\tr \mbreak r8 mi mi mi
  mi2\tr r8 red red red

  %57
  si32 mi sol mi si[mi sol mi] si32 mi sol mi si[mi sol mi] si4 r
  R1*3   %%%%%% inizio p.8
  mi,32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] mi4 r

  %62
  R1*2

  <<
    {sol,32(mi' si') mi, sol,[(mi' si') mi,] sol,32(mi' si') mi, sol,[(mi' si') mi,] la,(mi' do') mi, la,[(mi' do') mi,] la,(mi' do') mi, la,[(mi' do') mi,]}

    \new Staff \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 0.5) (padding . +0.0))
      \remove "Time_signature_engraver"
      alignAboveContext = #"main" fontSize = #-3
      \override StaffSymbol #'staff-space = #(magstep -3)
      \override StaffSymbol #'thickness = #(magstep -3)
    }
    {
      \set Staff.midiInstrument = #"violin"

      <<
        {
          \key mi\minor si'2 do
        }\\{\stemUp\override Stem #'transparent = ##t mi, mi}\\{\stemDown sol, la}
      >>
    }
  >>


  %65
  <<si'8\\\stemUp\override Stem #'transparent = ##t mi,\\\stemDown sol,>> r r32 mi''[re do] si16 la sol8-. sol,-. la-. si-.
  mi4 r32 mi'\p[re do] si16 la\mbreak sol8 sol, la si
  mi4\fermopz r r2

}

IvlIIn = \relative do'' {

  mi8
  si' \appoggiatura la sol \appoggiatura fad mi si' do16. si32 la8 r la,
  la'32 (sol16.) fad32(mi16.) red32(do16.) si32(la16.) sol16. fad32 mi8 r mi'
  si' \appoggiatura la sol \appoggiatura fad mi si' do2

  %4
  mi,8 \appoggiatura re do \appoggiatura si la la' red,4. mi16 fad
  \tuplet 3/2 { sol mi(fad sol[fad mi)] si' mi,(fad sol[fad mi)] } si'4 r32 fad\p[mi re] dod16-. si-.\mbreak
  lad8-. sol!-. fad-. mi-. re-. si-. r4

  %7
  fad''8\f r r32 mi\p[re dod] si16-. la?-. sol8-. fad-. mi-. re-.
  do! la r4 mi''8\f r r32 re\p[do si] la16-. sol-.
  fad8-. mi-. red-. do!-. si-. sol-. r mi''\f

  %10
  si' \appoggiatura la sol \appoggiatura fad mi si' do,4. la'8
  sol mi r32 mi[re do] si16 la sol8-. sol,-. la-. si-.
  mi4 r32 mi'\p[re do] si16 la\mbreak sol8 sol, la si

  %13
  mi4 r r2
  r si32 mi sol mi si [mi sol mi] si mi sol mi si[mi sol mi]
  si4 r do32 mi la mi do[mi la mi] do mi la mi do[mi la mi]

  %16
  si4 r si32 mi sol mi si [mi sol mi] si mi sol mi si[mi sol mi]\mbreak
  la,4 r r2
  R1*6

  %24
  r2 r4 r8 fad''
  fad \appoggiatura mi re \appoggiatura dod si fad' sol16. fad32 mi8 r mi,\mbreak
  mi'32(re16.) dod32(si16.) lad32(sold16.) fad32(mi16.) re16. dod32 si8 r16 red'(dod si)

  %27
  <<sol'8\\\stemUp\override Stem #'transparent = ##t si,\\\stemDown mi,>> \parenthesize r8 r32 fad'?[mi re?] dod16 si lad8-. si-. mi,-. fad-.
  si,4 r r2
  R1*9

  %38
  r4 r8 mi' mi\appoggiatura re do \appoggiatura si la mi'
  fa16. mi32 re8 r re, re'32(do16.) si32(la16.) sold32(fad?16.) mi32(re16.)\mbreak
  do8 la r la' la'32(sol16.) fad32(mi16.) red32(dod16.) si32(la16.)

  %41
  sol4 r32 fad'\p[mi re] do16 si la8-. sol-. fad-. mi-.

  %42
  red-. si-. r4 fad''8\f r r32 mi\p[re dod] si16 la
  sol8-. fad-. mi-. re-. do-. la-. r mi''
  si' \appoggiatura la sol \appoggiatura fad mi si' do,4. la'8

  %45
  sol mi r32 mi[re do] si16 la sol8-. sol,-. la-. si-.
  mi4 r\mbreak r2
  R1*3

  %50
  red'32 fad si fad red[fad si fad] red fad si fad red[fad si fad] sol4 r
  R1*2
  r2 sol,32 si mi si sol[si mi si] sol si mi si sol[si mi si]

  %54
  la8 la do[do] do2\tr
  r8 si si si\mbreak si2\tr
  r8 la la la la2\tr

  %57
  sol32 si mi si sol[si mi si] sol si mi si sol[si mi si] sol4 r
  R1*3
  sol32 si mi si sol[si mi si] sol si mi si sol[si mi si] sol4 r

  %62
  R1
  r2 r4 r8 mi'\f
  si' \appoggiatura la sol \appoggiatura fad mi si' do,4. la'8

  %65
  sol mi r32 mi[re do] si16 la sol8-. sol,-. la-. si-.
  mi4 r32 mi'\p[re do] si16 la\mbreak sol8 sol, la si
  mi4\fermopz r r2

}

Ivlan = \relative do'{


  r8
  sol sol sol sol mi' mi mi mi
  red red red red si si si si
  sol' sol sol sol sol sol sol sol

  %4
  la la mi mi fad fad fad red
  si si si si si4 r\mbreak
  lad'8 sol! fad mi re si r4

  %7
  re'\f r sol,8\p fad mi re
  do! la r4 do'\f r
  fad,8\p mi red do! si sol r4

  %10
  sol8\f sol sol sol mi' mi mi mi %ripresa
  mi r r32 mi' re do si16[la] sol8 sol, la si
  mi,4 r32 mi''\p re do si16[la]\mbreak sol8 sol, la si

  %13
  mi4 r r2
  R1*11
  re8 re re re si si si si\mbreak

  %26
  lad lad lad lad fad fad fad fad
  mi4 r8 r16 si'' lad8 si mi, fad

  %28
  si,4 r r2
  R1*9
  r2 do8 do do do

  %39
  la fa' fa fa si, si si sold\mbreak
  mi mi mi do' fad, fad fad red'
  si4 r la'8\p sol fad mi

  %42 OK
  red4 r red'\f r
  sol,8 fad mi re do la r4
  sol8 sol sol sol mi' mi mi mi

  %45
  mi8 r r32 mi'[re do] si16 la sol8 sol, la si
  mi4 r r2
  R1*17

  %64
  sol,8\f sol sol sol mi' mi mi mi %ripresa
  mi r r32 mi' re do si16[la] sol8 sol, la si
  mi,4 r32 mi''\p re do si16[la]\mbreak sol8 sol, la si

  %67
  mi4\fermopz r r2

}

Ifgn = \relative do{

  r8
  mi mi  mi mi la, la la la
  si si si si mi mi mi mi
  mi mi mi mi do do do do

  %4
  do do do do si si si si
  mi mi mi mi mi4 r\mbreak
  lad8\p sol8 fad mi re16 \f si re fad si fad re si

  %7
  si'4 r sol8\p fad mi re
  do!16 la do mi la mi do la la'4 \f r
  fad8\p mi red do! si16\f sol si mi sol mi si sol

  %10
  mi'8 mi mi mi la, la la la  %% ripresa
  mi' r r32 mi' re do si16[la] sol8 sol, la si
  mi,4 r32 mi''\p re do si16[la]\mbreak sol8 sol, la si

  %13
  mi32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol] mi la do la mi[la do la] mi la do la mi[la do la]
  si, red fad red si[red fad red] si red fad red si[red fad red] \once\stemDown sol8 \once\stemUp mi, r mi'
  si' \appoggiatura la sol \appoggiatura fad mi si' do16. si32 la8 r la,

  %16
  la'32(sol16.) fad32(mi16.) red32(do16.) si32(la16.) sol16. fad32 mi8 r si''\mbreak
  la32 do mi do la[do mi do] la do mi do la[do mi do] sol4(fad\tr)
  sol32 si re si sol[si re si] sol si re si sol[si re si] fad4(mi\tr)

  %19
  fad32 la do la fad[la do la] fad la do la fad[la do la] red,8 do' si16 la sol fad
  sol mi mi8\tr~mi16 mi'(dod si) lad8~lad32 sol fad mi \parenthesize re8[\parenthesize dod]
  re8 si r si'\mbreak si8. (do?16) dod8.(re16)

  %22
  red8.(mi16) lad,8.(si16) fad4~fad16 sold32 lad si16 si32 dod
  re16 si fad re mi4\tr re r32 si' la sol fad mi re dod
  si re fad re si[re fad re] si re fad re si[re fad re] si16 si' re, si' mi, si' fad lad

  %25
  si,8 si si si mi mi mi mi\mbreak
  fad fad fad fad si, si si si
  mi4 r8 r16 si' lad8 si mi, fad

  %28
  si,4 r32 si'[la sol] fad16 mi re4 r32 sol[fad mi] re16 dod
  si8 si' dod8.\tr(si32 dod) re8 si r32 re[dod si] la16 sol
  fad4 r32 si[la sol] fad16 mi re8 do' do8.\tr si32 la\mbreak

  %31
  sold8 re' re8.\tr do32 si do8 la, r32 mi''[do si] la do la sol?
  fa re' si la sol[si sol fa] mi do' la sol fa[la fa mi] re si' sold fa mi[sold mi re] do la' fa? mi re[do si la]
  mi'4 si'8.(do32 re) do8 mi sold,8. (la32 si)

  %34
  la8 do mi,8.(fa32 sol?) fa8 la dod,8.(re32 mi)
  re8 mi,4 mi''8\mbreak \appoggiatura re8 do32(si do8.) \appoggiatura mi8 re32(do re8.)
  mi16 re32 do si la sold fad! mi mi' re do si la sold fad mi8 la16. si32 si4\tr

  %37
  la r32 la[sol? fa] mi re do si \once\stemUp la16 \stemDown do'(si) re(do) mi(sold,) si(
  la)[sol?32 fa mi16 la]\stemNeutral si4\tr la la,8 la
  re re re re mi mi mi mi\mbreak

  %40
  la, la la la si si si si
  mi4 r la8\p sol fad mi
  red16\f si red fad si fad red si si'4 r

  %43
  sol8\p fad mi re do16\f la do mi la mi do la
  sol8 mi' mi mi la, la la la
  mi' r r32 mi'[re do] si16 la sol8 sol, la si

  %46
  mi,4 r8 mi'\mbreak si'16(do) si(do) si(do) si(do)
  la[fad32 mi fad16 si,] si[do'32 si do16 la] la[(si) la(si) la(si) la(si)]
  \stemDown sol[si32 la si16 \stemUp mi,,] mi [\stemDown si''32 la si16 mi]\stemNeutral sold,[(la) sold(la) sold(la) sold(la)]

  %49
  \stemDown si[re32 do re16 \stemUp mi,,] mi [\stemDown fa''(mi re)]\stemNeutral do[(re) do(si) la(sol) fad?(mi)]
  red8 si r si' mi,32 sol si sol mi[sol si sol] mi sol si sol mi[sol si sol]\mbreak
  do16 la mi la do, la' la, la' re,?32 fad la fad re[fad la fad] re fad la fad re[fad la fad]

  %52
  si16 sol re sol si, sol' sol, sol' do,32 mi sol mi do[mi sol mi] do mi sol mi do[mi sol mi]
  la16 fad red fad si, fad' la, fad' sol,8 mi r si''
  \tuplet 3/2 { do16 si la do[re mi] do si la do[re mi] fad, mi re fad[sol la] fad  mi re fad[sol la]

  %55
  si la sol si[do re] si la sol si[do re]\mbreak mi, re do mi[fad sol] mi re do mi[fad sol]
  la sol fad la[si do] la sol fad la[si do] red, dod si red[mi fad] red dod si red[mi fad]}
  sol4 r8 mi mi'32(re16.) do32(si16.) la32(sol16.) fad32(mi16.)

  %58
  red'8(mi) lad,(si) fad(sol) red(mi)
  mi'32(re?16.) do32(si16.) la32(sol16.) fad32(mi16.)\mbreak fa16(mi) fa(mi) fa(mi) fa(mi)
  mi'8~mi32 re do si do8~do32 si la64 sol fad? mi red8 mi fad4\tr

  %61
  mi r mi32 sol si sol mi[sol si sol] mi32 sol si sol mi[sol si sol]
  mi la do la mi[la do la] mi la do la mi[la do la] si, red fad red si[red fad red] si red fad red si[red fad red]
  sol16 mi sol, mi' la, mi' si red\mbreak mi, mi' sol, mi' la, mi' si red

  %64
  mi8\f mi mi mi la, la la la  %% ripresa
  mi' r r32 mi' re do si16[la] sol8 sol, la si
  mi,4 r32 mi''\p re do si16[la]\mbreak sol8 sol, la si

  %67
  mi,4\fermopz r r2

}

Ibcn = \relative do {

  r8
  mi mi  mi mi la, la la la
  si si si si mi mi mi mi
  mi mi mi mi do do do do

  %4
  do do do do si si si si
  mi mi mi mi mi4 r\mbreak
  lad8\p sol8 fad mi re16 \f si re fad si fad re si

  %7
  si'4 r sol8\p fad mi re
  do!16 la do mi la mi do la la'4 \f r
  fad8\p mi red do! si16\f sol si mi sol mi si sol

  %10
  mi'8 mi mi mi la, la la la  %% ripresa
  mi' r r32 mi' re do si16[la] sol8 sol, la si
  mi,4 r32 mi''\p re do si16[la]\mbreak sol8 sol, la si

  %13
  mi, mi' mi mi do do do do
  si si si si mi mi mi mi
  mi mi mi mi la, la la la

  %16
  si si si la sol mi mi mi\mbreak
  do' do do do re re re re
  si si si si do do do do

  %19
  la la la la si si si si
  mi mi mi mi fad fad, fad fad
  si si si mi\mbreak mi2~

  %22
  mi fad8 mi re dod
  si si dod lad si si si lad
  si si si si si re mi fad

  %25
  si, si si si mi mi mi mi\mbreak
  fad fad fad fad si, si si si
  mi4 r8 r16 si' lad8 si mi, fad

  %28
  si,4 r si r
  si8 si' lad fad si si, r4
  re r re8 la' fad red\mbreak

  %31
  mi fad sold mi la la, la r
  re r do r si r la r
  mi' fad? sold mi la la, mi'[re]

  %34
  do la dod[la] re re, la'[sol]
  fa mi sold mi\mbreak la la' fa?[re]
  mi r mi r mi8 do16. re32 mi8 mi,

  %37
  la si do si la mi' la[mi]
  la, do mi mi, la la la la
  re re re re mi mi mi mi\mbreak

  %40
  la, la la la si si si si
  mi4 r la8\p sol fad mi
  red16\f si red fad si fad red si si'4 r

  %43
  sol8\p fad mi re do16\f la do mi la mi do la
  sol8 mi' mi mi la, la la la
  mi' r r32 mi'[re do] si16 la sol8 sol, la si

  %46
  mi,4 r8 mi'\mbreak mi  mi mi mi
  fad si, si si si si si si
  mi mi, mi mi mi' mi mi mi

  %49
  sold, mi mi mi la la la lad
  si si si si mi mi mi mi\mbreak
  la, la la la re? re re re

  %52
  sol, sol sol sol do do do do
  fad, fad fad fad mi mi mi mi
  la la la la re re re re

  %55
  sol sol sol sol \mbreak do, do do do
  fad fad fad fad si, si si si
  mi mi mi mi mi mi mi mi

  %58
  fad(sol) fad(sol) red (mi) si[la]
  sol mi mi mi\mbreak la la la la
  sol sol la la si mi si si

  %61
  \parenthesize mi4 r mi8 mi mi mi
  la, la la la si si si si
  mi sol, la si\mbreak mi, sol la si

  %64
  mi\f mi mi mi la, la la la  %% ripresa
  mi' r r32 mi' re do si16[la] sol8 sol, la si
  mi,4 r32 mi''\p re do si16[la]\mbreak sol8 sol, la si

  %67
  mi,4\fermopz r r2

}

Ibfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key mi\minor
  \time 4/4
  \tempo 4 = 57
  \partial 8 s8
  s1*67
  \bar"|."


}

IvlI = {
  \Iglobal
  \notypeset
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

Ifg = {
  \Iglobal
  \clef bass
  <<\Ifgn \forma>>

}

Ibc = {
  \Iglobal
  \clef bass
  <<\Ibcn \forma \Ibfn>>
  \typeset

}


IIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza
}


IIvlIn =  \relative do'' {

  si2 fad
  si, re'
  dod si

  %4
  lad16(sol fad4.) sol'2
  fad mi
  re16(dod si4.) r8 re(mi fad) %% da metà battuta ripresa

  %7
  \appoggiatura la sol32(fad sol8.) \appoggiatura la8 sol32(fad sol8.) r8 dod, (re mi)
  \appoggiatura sol fad32(mi fad8.) \appoggiatura sol8 fad32(mi fad8.)\mbreak r8 sol(la si)
  r mi, (fad sol) r dod,(re mi)

  %10
  re4 si mid, fad
  si,4 r r2 %%%%%%fine ripresa con fermata
  R1*2

  %14
  r2 re'\mbreak
  fad sol~
  sol fad~

  %17
  fad mi~
  mi re
  sold la4 r\mbreak

  %20
  \parenthesize r2 fad
  dod fad,
  re'8[dod16 si dod8 dod,] fad4 r

  %23
  r2 mid'
  fad4 r r2
  lad, si4 r

  %26
  R1
  R2
  R1*5

  %33
  r2 r8 re(mi fad) %% da metà battuta ripresa
  \appoggiatura la sol32(fad sol8.) \appoggiatura la8 sol32(fad sol8.) r8 dod, (re mi)
  \appoggiatura sol fad32(mi fad8.) \appoggiatura sol8 fad32(mi fad8.)\mbreak r8 sol(la si)

  %36
  r mi, (fad sol) r dod,(re mi)
  re4 si mid, fad
  si,4\fermata r r2

}

IIvlIIn = \relative do'' {

  si2 fad
  si, fad'
  sol sold

  %4
  fad mi'
  re dod
  si8 fad4. r8 si(dod re)  %% metà ripresa

  %7
  \appoggiatura fad mi32(re mi8.) \appoggiatura fad8 mi32(re mi8.) r8 la,(si dod)
  \appoggiatura mi re32(dod re8.) \appoggiatura mi8 re32(dod re8.)\mbreak r8 mi(fad sol)
  r dod,(re mi) r lad,(si dod)

  %10
  re4 si mid, fad
  si, r r2 %fine r
  R1*2

  %14
  r2 si'\mbreak
  re mi~
  mi re~

  %17
  re dod~
  dod si
  mid dod4 r\mbreak

  %20
  r2 fad
  dod fad,
  re'8[dod16 si dod8 dod,] fad4 r

  %23
  r2 sold'
  la4 r r2
  dod, re4 r

  %26
  R1\mbreak
  R2
  R1*5

  %33
  r2 r8 si(dod re)  %% metà ripresa
  \appoggiatura fad mi32(re mi8.) \appoggiatura fad8 mi32(re mi8.) r8 la,(si dod)
  \appoggiatura mi re32(dod re8.) \appoggiatura mi8 re32(dod re8.)\mbreak r8 mi(fad sol)

  %36
  r dod,(re mi) r lad,(si dod)
  re4 si mid, fad
  si,\fermata r r2

}

IIvlan = \relative do'{

  si'4 si fad fad
  si, si re2
  mi dod

  %4
  dod dod'
  re lad
  fad4 re re r %% matà rip

  %7
  r8 si'8(la sol) mi4 r
  r8 la(sol fad)\mbreak si4 r
  sol r lad r

  %10
  fad si mid, fad
  si, r r2 % fine rip
  R1*4

  %16
  dod'2 la
  si sol
  lad re,

  %19
  si' la4 r\mbreak
  r2 fad'4 fad
  dod dod fad, fad

  %22
  re'8[dod16 si dod8 dod,] fad, fad' sold dod,
  fad4 r dod'2
  dod4 r r2

  %25
  fad, fad4 r
  R1
  R2

  %28
  R1*5
  r2 re4 r %% matà rip
  r8 si'8(la sol) mi4 r

  %35
  r8 la(sol fad)\mbreak si4 r
  sol r lad r
  fad si mid, fad

  %38
  si,\fermata r r2

}

IIfgn = \relative do{

  si'4 si fad fad
  si, si si' si
  mi, mi mid mid

  %4
  fad fad lad, lad
  si si fad' fad
  si, si si r  %%%%% ripresa a metà

  %7
  r8 sol'(fad mi) la4 r
  r8 fad(mi re)\mbreak sol4 r
  mi r fad r

  %10
  si, si' mid, fad
  si16 re(dod si) re,8(fad) mi?16 re'(dod si) mi,8(sol)  %%fine ripresa
  fad16 re'(dod si) fad8(lad) si8-. fad-. re-. si-.

  %13
  si'16 re(dod si) re,8(fad) mi16 re'(dod si) mi,8(sol)
  fad16 re'(dod si) fad8(lad) \appoggiatura lad si4 r8 si\mbreak
  \tuplet 3/2 { si16 dod re re[dod si] re, mi fad fad[mi re] } sol8(si mi re)

  %16
  \tuplet 3/2 { dod16 re mi mi[re dod] mi, fad sol sol[fad mi] } fad8(la re dod)
  \tuplet 3/2 { si16 dod re re[dod si] re, mi fad fad[mi re] } mi8(sol dod si)
  \tuplet 3/2 { lad16 si dod dod[si lad] dod, re mi mi[re dod] } re8 si r16 si' dod re

  %19
  mid,4~mid16 re' dod si la? sold fad mi? re dod si la\mbreak
  sold8 fad dod' dod, fad4 fad''
  dod dod fad, fad

  %22
  re'8[dod16 si dod8 dod,] fad dod' si4\tr
  la8[sold16 fad la8 si] dod2
  r8 fad, mi4\tr re8[dod16 si re8 mi]

  %25
  fad2 \tuplet 3/2 { re'16 si re } sol,4 si8
  \tuplet 3/2 { dod16 la dod } fad,4 la8 \tuplet 3/2 { si16 sol si } mi,4 si'8\mbreak
  \tuplet 3/2 { lad16 fad lad dod[lad dod] lad fad lad fad[dod fad] }

  %28
  re si'(dod re) r si (dod re) r do(re mi) r do(re mi)
  r lad, (si dod?) r mi,(fad sol) r re(mi fad) r si(dod re)
  si8~si32 la sol fad mi8~mi32 re dod si lad8 si fad' fad,

  %31
  si re'(dod si) r do(si lad)
  si32 dod! si la? sol[la sol fad] mi fad mi re dod[re dod si] lad8  si fad' fad,
  si4 r si r  %%%%% ripresa a metà

  %34
  r8 sol'(fad mi) la4 r
  r8 fad(mi re)\mbreak sol4 r
  mi r fad r

  %37
  si, si' mid, fad
  si,\fermata r r2

}

IIbcn = \relative do {

  si'4 si fad fad
  si, si si' si
  mi, mi mid mid

  %4
  fad fad lad, lad
  si si fad' fad
  si, si si r  %%%%% ripresa a metà

  %7
  r8 sol'(fad mi) la4 r
  r8 fad(mi re)\mbreak sol4 r
  mi r fad r

  %10
  si, si' mid, fad
  si, re mi?2  %%%% fine r
  fad si,

  %13
  re mi
  fad si,4 si\mbreak
  si si mi mi

  %16
  la, la re re
  sol sol dod, dod
  fad fad si, si

  %19
  dod dod fad fad,\mbreak
  sold8 fad dod' dod, fad''4 fad
  dod dod fad, fad

  %22
  re'8[dod16 si dod8 dod,] fad, fad' sold dod,
  fad4 r dod dod
  fad8 re dod lad si4 r

  %25
  fad' fad si, mi
  la re, sol dod,\mbreak
  fad4 fad,

  %28 OK
  si re mi mi
  fad lad, si re
  mi sol, fad8 si fad'[fad,]

  %31
  si si(dod re) mi4 fad
  si, r8 si lad si fad' fad,
  si4 r si r  %%%%% ripresa a metà

  %34
  r8 sol'(fad mi) la4 r
  r8 fad(mi re)\mbreak sol4 r
  mi r fad r

  %37
  si, si' mid, fad
  si,\fermata r r2

}

IIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key si\minor
  \time 4/4
  \tempo 4 = 75
  s1*26
  \set Score.measureLength = #(ly:make-moment 2 4)
  s2
  \set Score.measureLength = #(ly:make-moment 4 4)
  s1*11
  \bar"|."

}

IIvlI = {
  \IIglobal
  \notypeset
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

IIfg = {
  \IIglobal
  \clef bass
  <<\IIfgn \forma>>

}

IIbc = {
  \IIglobal
  \clef bass
  <<\IIbcn \forma \IIbfn>>
  \typeset

}


IIIglobal = {
  \override Score.MetronomeMark.transparent = ##t
  \override Score.BarNumber.font-size = #0.5
  \override Score.BarNumber.padding = #1.3
  \override TupletBracket.bracket-visibility = ##f
  \senza
}


IIIvlIn =  \relative do'' {

  r16 si si8[(do)]
  si16[si] si8(do)
  si16 si' la sol la fad

  %4
  mi[si] si8(do)
  si16[si] si8(do)
  si16 mi sol mi si' sol

  %7
  fad4 r8
  si32 la sold fad mi[re do si] la[sold fad mi]
  mi'4.

  %10
  la32 sol fad mi re[do si la] sol fad mi re\mbreak
  re'4.
  sol32 fad mi re do [si la sol] fad mi re do

  %13
  do'4.
  si32(mi sol) si si,8\noBeam r
  si32(red fad) si si,8\noBeam r

  %16
  si32(mi sol) si si,8\noBeam r
  si32(red fad) si si,8\noBeam r
  r16 si si8[(do)]  % rip

  %19
  si16[si] si8(do)
  si16 si' la sol la fad\mbreak
  mi[si\p] si8(do)

  %22
  si16[si] si8(do)
  si16 si\f la sol la fad
  mi4 r8 %% fine rip

  %25
  r16 mi mi fad sol mi
  r la, la si do la
  r mi' mi fad sol mi

  %28
  r si si dod red si
  r mi mi fad sol mi
  r mi mi fad sol mi

  %31
  r red red mi fad red
  r mi mi fad sol mi
  r si si dod red si\mbreak

  %34
  r mi mi fad sol mi
  R4.
  r16 fad' fad sol la fad

  %37
  R4.
  r16 mi mi fad sol mi
  R4.

  %40
  r16 re re mi fad re
  R4.*9
  r16 mi mi8[(fa)]

  %51
  mi16[mi] mi8(fa)
  mi16 mi re do re si
  la[mi'] \once\slurDashed mi8(fa)

  %54
  mi16[mi] mi8(fa)\mbreak
  mi16 do mi do la' do,
  si32 (sold si) mi mi,8\noBeam r

  %57
  mi32 (la do) mi mi,8\noBeam r
  mi32 sold si mi mi,8\noBeam r
  r16 mi' mi8[(fa)]

  %60
  mi16[mi] mi8(fa)
  mi16 la do, la si sold
  la4 r8

  %63
  R4.*24
  r16 mi' mi8[(fa)]
  mi16 [do] do8(re)

  %89
  do16[la'] la8(sol16) fad!
  sol32(mi sol) si si,8\noBeam r
  si32(red fad) si si,8\noBeam r

  %92
  si32(mi sol) si si,8\noBeam r
  si32(red fad) si si,8\noBeam r
  r16 si si8[(do)]

  %95
  si16[si] si8(do)
  si16 si' la sol la fad\mbreak
  mi mi, mi fad sol mi

  %98
  r la, la si do la
  r mi' mi fad sol mi
  r si si dod red si

  %101
  r mi mi fad sol mi
  r mi mi fad sol mi
  R4.

  %104
  r16 re re mi fad re
  R4.
  r16 do do re mi do

  %107
  R4.\mbreak
  r8 si' sol'
  r do, la'

  %110
  r dod, lad'
  r re, si'
  r mi, si'

  %113
  r mi, do'
  r mi, la
  r red, fad

  %116
  r16 sol sol la si sol\mbreak
  R4.*12
  r16 si, si8[(do)]  % rip

  %130
  si16[si] si8(do)
  si16 si' la sol la fad\mbreak
  mi[si\p] si8(do)

  %133
  si16[si] si8(do)
  si16 si\f la sol la fad
  mi4\fermata r8

}

IIIvlIIn = \relative do'' {

  r16 sol sol8[(la)]
  sol16 sol sol8[(la)]
  sol16 sol' fad mi fad red

  %4
  mi[sol,] sol8(la)
  sol16 sol sol8[(la)]
  sol16 si mi[si sol' mi]

  %7
  red4 r8
  si'32 la sold fad mi[re do si] la[sold fad mi]
  do'4.

  %10
  la'32 sol fad mi re[do si la] sol fad mi re\mbreak
  si'4.
  sol'32 fad mi re do [si la sol] fad mi re do

  %13
  la'4.
  sol16[mi'] mi8.(fad32 sol)
  fad16[fad] fad8.(sol32 la)

  %16
  sol16[sol] sol8.(la32 si)
  red,16[red] red8. mi32 fad
  sol16[sol,] sol8(la)

  %19
  sol16[sol] sol8(la)
  sol16 sol' fad mi fad red\mbreak
  mi[sol,\p] sol8(la)

  %22
  sol16[sol] sol8(la)
  sol16 sol\f fad mi fad red
  mi4 r8

  %25
  r16 mi mi fad sol mi
  r la, la si do la
  r mi' mi fad sol mi

  %28
  r si si dod red si
  r mi mi fad sol mi
  r mi mi fad sol mi

  %31
  r red red mi fad red
  r mi mi fad sol mi
  r si si dod red si\mbreak

  %34
  r mi mi fad sol mi
  R4.
  r16 re' re mi fad re

  %37
  R4.
  r16 do do re mi do
  R4.

  %40
  r16 si si do re si
  R4.*9
  r16 do\noBeam do8(re)

  %51
  do16[do] do8(re)
  do16 do si la si sold
  la[do] do8(re)

  %54
  do16[do] do8(re)\mbreak
  do16 la do la mi' la,
  sold[sold] sold8.(la32 si)

  %57
  la16[la] la8.(si32 do)
  si16[si] si8.(do32 re)
  do16[do] do8(re)

  %60
  do16[do] do8(re)
  do16[mi] la, do, re si
  la4 r8

  %63
  R4.*24
  r16 do'\noBeam do8(re)
  do16[la] la8(si)

  %89
  la16[mi'] fad!8(mi16) red
  mi16[mi] mi8.(fad32 sol)
  fad16[fad] fad8.(sol32 la)

  %92
  sol16[sol] sol8.(la32 si)
  red,16[red] red8.(mi32 fad)
  sol16[sol,] sol8(la)

  %95
  sol16[sol] sol8(la)
  sol16 sol' fad mi fad red\mbreak
  mi16 mi, mi fad sol mi

  %98
  r la, la si do la
  r mi' mi fad sol mi
  r si si dod red si

  %101
  r mi mi fad sol mi
  r mi mi fad sol mi
  R4.

  %104
  r16 re re mi fad re
  R4.
  r16 do do re mi do

  %107
  R4.\mbreak
  r8 sol' mi'
  r la, mi'

  %110
  r lad, fad'
  r si, fad'
  r si, sol'

  %113
  r do, sol'
  r do, mi
  r si red

  %116
  r16 mi mi fad sol mi\mbreak
  R4.*12
  sol16[sol,] sol8(la)

  %130
  sol16[sol] sol8(la)
  sol16 sol' fad mi fad red\mbreak
  mi[sol,\p] sol8(la)

  %133
  sol16[sol] sol8(la)
  sol16 sol\f fad mi fad red
  mi4\fermata r8

}

IIIvlan = \relative do'{

  sol'8 r16 sol mi fad
  si,8 r16 sol' mi fad
  si,8 r16 si' do si

  %4
  sol8 r16 sol mi fad
  si,8 r16 sol' mi fad
  si,8 r16 si' si si

  %7
  si4 r8
  sold4 r8
  r16 do32[si do16 do32 si do16 do]

  %10
  re4 r8\mbreak
  r16 si32[la si16 si32 la si16 si]
  do4 r8

  %13
  r16 la32[sol la16 la32 sol la16 fad]
  si,4.~
  si~

  %16
  si~
  si
  sol'8 r16 sol mi fad  %%%% rip

  %19
  si,8 r16 sol' mi fad
  si,8 r16 si' do si\mbreak
  si8 r16 sol\p mi fad

  %22
  si,8 r16 sol' mi fad
  si,8 r16 si\f do si
  sol4 r8  %%% fine rip

  %25
  R4.*25
  mi'8 r16 do la si
  mi,8 r16 do' la si

  %52
  mi,8 r16 mi' fa mi
  mi8 r16 do la si
  mi,8 r16 do' la si\mbreak

  %55
  mi,8 r16 mi' do' mi,
  mi4.~
  mi~

  %58
  \once\tieDashed mi~
  mi8 r16 do la si
  mi,8 r16 do' la si

  %61
  mi,8 r16 mi fa mi
  mi4 r8
  R4.*24

  %87
  sol'8 r16 sol la si
  sol8 r16 mi la sold
  mi8 r16 do' red, red

  %90
  si4.~
  si~
  si~

  %93
  si
  sol'8 r16 sol mi fad
  si,8 r16 sol' mi fad

  %96
  si,8 r16 si' do si\mbreak
  sol4 r8
  R4.*31

  %129
  sol8 r16 sol mi fad  %%%% rip
  si,8 r16 sol' mi fad
  si,8 r16 si' do si\mbreak

  %132
  si8 r16 sol\p mi fad
  si,8 r16 sol' mi fad
  si,8 r16 si\f do si

  %135
  sol4\fermata r8

}

IIIfgn = \relative do{

  mi8 r16 mi la red,
  mi8 r16 mi la red,
  mi8 r16 mi la, si

  %4
  mi,8 r16 mi' la red,
  mi8 r16 mi la red,
  mi8 r16 mi mi' mi,

  %7
  si fad' si fad red' si
  mi4 r8
  r16 la,32[sold la16 la32 sold la16 la]

  %10
  fad4 r8\mbreak
  r16 sol?32[fad sol16 sol32 fad sol16 sol]
  mi4 r8

  %13
  r16 fad32[mi fad16 fad32 mi fad16 red]
  mi16 mi' sol,[fad sol mi]
  r16 si' red, dod red si

  %16
  r mi' sol, fad sol mi
  r si' red, dod red si
  mi8 r16 mi la red,  %%%% rip

  %19
  mi8 r16 mi la red,
  mi8 r16 mi la, si\mbreak
  mi,8 r16 mi'\p la red,

  %22
  mi8 r16 mi la red,
  mi8 r16 mi\f la, si
  mi,4 r8 %%% fine rip

  %25
  si''4.
  do
  si8 la sol

  %28
  la sol fad
  \grace {sol32[fad]} mi4.
  mi'4.

  %31
  la,
  \grace {sol32[fad]} mi4.
  \grace {fad32[mi]} red4.\mbreak

  %34
  \appoggiatura red?8 mi4 r8
  mi32 fad mi fad sol[la sol la] si dod  si dod
  re4 r8

  %37
  re,32 mi re mi fad[sol fad sol] la si la si
  do4 r8
  do,32 re do re mi[fad mi fad] sol la sol la

  %40
  si4 r8
  re16(do si la sold fad)
  mi fa'(mi re do si)

  %43
  do(si la sol fa mi)\mbreak
  fa(mi re re' si la)
  sold(fad? mi fa' mi re)

  %46
  do32 si la16 si4\tr
  la32 mi' re do si[do si la] sold la sold fad
  mi la sol fa mi[fa  mi re] do re do si

  %49
  la16 la' fa[mi32 re] mi16 mi,
  la8 r16 la re sold,
  la8 r16 la re sold,

  %52
  la8 r16 la' re, mi
  la,8 r16 la re sold,
  la8 r16 la re sold,\mbreak %%% fine p. 13

  %55 OK
  la8 r16 la la' la,
  mi mi' sold fad sold mi
  r la, do si do la

  %58
  r mi'sold fad sold mi
  la,8 r16 la re sold,
  la8 r16 la re sold,

  %61
  la8 r16 la re mi
  la, do'32 si la16[mi32 re] do16 si32 la
  mi'16[si'32 la sold16 re'32 do] si16 la32 sold

  %64
  la16 do32 si la16[mi'32 re do16 si32 la]\mbreak
  re16 fa32 mi re16[la32 sol] fa16 mi32 re
  mi fad? sold la si8.[do32 re]

  %67
  do16 la mi do la8\noBeam
  la'(sib) sol
  dod4.

  %70
  re32 do? sib? la sol fa mi re r8
  re'(la) fa
  si?4.

  %73
  do32 si la sol fa mi re do r8
  sib'32 do re4 do32 sib
  \grace {la32[sold]} la4.\mbreak

  %76
  do32 re mi4 re32 do
  \grace {si32[la]} si4.
  mi16 re32 mi do16\tr[si32 do] la16\tr sol32 la

  %79
  fa16\tr mi32 fa re16\tr[do32 re] si16\tr la32 si
  \once\stemUp sol16 \once\stemDown si' si8[(do)]
  sol16 si si8[(do)]

  %82
  fa,?16[si] si8(do)
  mi,8 r32 do re mi fa sol la si
  do16[mi,] fa[mi32 re sol16 sol,]

  %85
  do8 r32 do re mi fa sol la si
  do re  mi re do16[mi, fa sol]\mbreak
  do,8 r16 do fa si,

  %88
  do8 r16 do fa si,
  do8 r16 la' si si,
  mi[mi'] sol, fad? sol mi

  %91
  r si' red, dod red si
  r mi' sol, fad sol mi
  r si' red, dod red si

  %94
  mi8 r16 mi la red,
  mi8 r16 mi la red,
  mi8 r16 mi la, si\mbreak

  %97
  si'4.
  do
  si8. red16 mi8

  %100
  la, sol fad
  sol16 fad mi8 r
  si'[si8.\tr la32 si]

  %103
  do(re mi16) la,32[si do16] fad,8\noBeam
  la[la8.\tr sol32 la]
  si do re16 sol,32[la si16] mi,8\noBeam

  %106
  sol[sol8.\tr fad32 sol]
  la si do16 fad,32[sol  la16] si,8\noBeam \mbreak
  \tuplet 3/2 {
    sol16 mi' fad sol,[mi' fad] sol, mi' fad

    %109
    la, mi' fad la,[mi' fad] la, mi' fad
    lad, fad' sol lad,[fad' sol] lad, fad' sol
    si, fad' sol si,[fad' sol] si, fad' sol

    %112
    si, sol' la si,[sol' la] si, sol' la
    do, sol' la do,[sol' la] do, sol' la
    do, la' si do,[la' si] do, la' si

    %115
    red, la' si red,[la' si] red, la' si
  }
  sol8 mi r\mbreak
  do'16 mi \appoggiatura si8 lad4\tr

  %118
  si16 re \appoggiatura la8 sold4\tr
  la16 do \appoggiatura sol?8 fad4
  sol16 fad32 mi si'16[la32 sol] mi'16 r

  %121
  mi, fad fad4\tr
  mi8 r32 mi' red? mi sol,[mi' red mi]
  la, mi' red? mi la,[mi' red mi] si mi red mi

  %124
  do8 r32 mi,red mi sol,[mi' red mi]\mbreak
  la, mi' red mi la,[mi' red mi] si16 red
  mi si' sol[fad32 mi] si'16 si,

  %127
  mi si sol[fad32 mi] si'16 si
  mi,4.
  mi'8 r16 mi la red,  %%%% rip

  %130
  mi8 r16 mi la red,
  mi8 r16 mi la, si\mbreak
  mi,8 r16 mi'\p la red,

  %133
  mi8 r16 mi la red,
  mi8 r16 mi\f la, si
  mi,4\fermata r8

}

IIIbcn = \relative do {

  mi8 r16 mi la red,
  mi8 r16 mi la red,
  mi8 r16 mi la, si

  %4
  mi,8 r16 mi' la red,
  mi8 r16 mi la red,
  mi8 r16 mi mi' mi,

  %7
  si fad' si fad red' si
  mi4 r8
  r16 la,32[sold la16 la32 sold la16 la]

  %10
  fad4 r8\mbreak
  r16 sol?32[fad sol16 sol32 fad sol16 sol]
  mi4 r8

  %13
  r16 fad32[mi fad16 fad32 mi fad16 red]
  mi16 mi' sol,[fad sol mi]
  r16 si' red, dod red si

  %16
  r mi' sol, fad sol mi
  r si' red, dod red si
  mi8 r16 mi la red,  %%%% rip

  %19
  mi8 r16 mi la red,
  mi8 r16 mi la, si\mbreak
  mi,8 r16 mi'\p la red,

  %22
  mi8 r16 mi la red,
  mi8 r16 mi\f la, si
  mi,4 r8 %%% fine rip

  %25
  R4.*10
  mi'8 mi mi
  re4 r8

  %37
  re8 re re
  do4 r8
  do do do

  %40
  si4 r8
  re4.
  sold,

  %43
  la\mbreak
  re
  mi

  %46
  la,8 mi' mi,
  la4 r8
  la4 r8

  %49
  la16 la' fa re mi[mi,]
  la8 r16 la re sold,
  la8 r16 la re sold,

  %52
  la8 r16 la' re, mi
  la,8 r16 la re sold,
  la8 r16 la re sold,\mbreak %%% fine p. 13

  %55 OK
  la8 r16 la la' la,
  mi mi' sold fad sold mi
  r la, do si do la

  %58
  r mi'sold fad sold mi
  la,8 r16 la re sold,
  la8 r16 la re sold,

  %61
  la8 r16 la re mi
  la,8 do la
  mi' sold mi

  %64
  la, do la\mbreak
  re, fa' re
  mi sold mi

  %67
  la la, r
  re sol4~
  sol8 fa mi

  %70
  fa r16 re fa re
  fa4.~
  fa?8 mi re

  %73
  mi8 r16 do mi do
  mi4.
  fa\mbreak

  %76
  fad!
  sol
  do16 do la la fa fa

  %79
  re re si si sol sol
  sol4 r8
  sol'4 r8

  %82
  fa?4 r8
  mi do r
  r16 mi fa re sol sol,

  %85
  do8 do, r
  do' r16 mi fa sol\mbreak
  do,8 r16 do fa si,

  %88
  do8 r16 do fa si,
  do8 r16 la' si si,
  mi[mi'] sol, fad? sol mi

  %91
  r si' red, dod red si
  r mi' sol, fad sol mi
  r si' red, dod red si

  %94
  mi8 r16 mi la red,
  mi8 r16 mi la red,
  mi8 r16 mi la, si\mbreak

  %97
  mi4 r8
  R4.*5
  la8 fad re

  %104
  R4.
  sol8 mi do
  R4.

  %107
  fad8 red si\mbreak
  sol sol sol
  la la la

  %110
  lad lad lad
  si si si
  si si si

  %113
  do do do
  do do do
  red red red

  %116
  mi  mi mi\mbreak
  mi fad mi
  re mi re

  %119
  do red si
  mi sol mi
  la, si do

  %122
  mi4 mi8
  la la si
  do r sol,\mbreak

  %125
  la la si
  mi16 si' sol mi si' si,
  mi si sol[mi si' si]

  %128
  mi,4.
  mi'8 r16 mi la red,  %%%% rip
  mi8 r16 mi la red,

  %131
  mi8 r16 mi la, si\mbreak
  mi,8 r16 mi'\p la red,
  mi8 r16 mi la red,

  %134
  mi8 r16 mi\f la, si
  mi,4\fermata r8

}

IIIbfn = \figuremode {

  \bassFigureExtendersOff
  \bassFigureStaffAlignmentUp




}

forma = {

  \key mi\minor
  \time 3/8
  \override Staff.TimeSignature.style = #'single-digit
  \tempo 4. = 50
  s4.*135
  \bar"|."


}

IIIvlI = {
  \IIIglobal
  %\notypeset
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

IIIfg = {
  \IIIglobal
  \clef bass
  <<\IIIfgn \forma>>

}

IIIbc = {
  \IIIglobal
  \clef bass
  <<\IIIbcn \forma \IIIbfn>>
  \typeset

}
#(set-global-staff-size 16.5)


\pointAndClickOff

\paper  {

  systems-per-page = #4
  print-first-page-number = ##t
  first-page-number = #2

}

\markup\huge "[1.] All[egr]o poco"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
    }<<

      \new PianoStaff <<

        \new Staff = "main" <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino  I]"}
          \IvlI
        >>

        \new Staff <<
          \set Staff.midiInstrument = #"violin"
          \set Staff.instrumentName = \markup \center-column{"[Violino II]"}
          \IvlII
        >>
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"viola"
        \set Staff.instrumentName = \markup \center-column{"[Viola]"}
        \Ivla
      >>

      \new Staff <<
        \set Staff.midiInstrument = #"bassoon"
        \set Staff.instrumentName = \markup \center-column{"Fagotto"}
        \Ifg
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
      \override StaffGrouper.staff-staff-spacing.padding = #1
      \override StaffGrouper.staff-staff-spacing.basic-distance = #6
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[2.] Andante"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
    }<<

      \new PianoStaff <<

        \new Staff = "main" <<
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
        \set Staff.midiInstrument = #"bassoon"
        \IIfg
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
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

\markup\huge "[3.] All[egr]o"

\score {
  {

    \new ChoirStaff \with {
      \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #3
    }<<

      \new PianoStaff <<

        \new Staff = "main" <<
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
        \set Staff.midiInstrument = #"bassoon"
        \IIIfg
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
      \override BarLine.hair-thickness = #1.2
      \override SpacingSpanner.uniform-stretching = ##t
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/4)  %aumenta lo spazio orizzontale
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

